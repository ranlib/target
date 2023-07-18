version 1.0

import "./task_tbprofiler.wdl" as tbprofiler
import "./task_bcf2vcf.wdl" as bcf2vcf
import "./task_fastqc.wdl" as fastqc
import "./task_bbduk.wdl" as bbduk
import "./task_trimmomatic.wdl" as trimmomatic
import "./task_collect_multiple_metrics.wdl" as bamQC
import "./task_multiqc.wdl" as multiQC
import "./task_concatenate_fastq.wdl" as concatenate_fastq
import "./task_variant_interpretation.wdl" as vi

workflow wf_tbprofiler {
  input {
    Array[File]+ read1
    Array[File]+ read2
    File reference
    String samplename
    Int minNumberReads
    Boolean run_decontamination
    Boolean run_bamQC
    # variant interpretation
    File bed
    File json
    String? report
  }

  String outputForward = "${samplename}_1.fq.gz"
  String outputReverse = "${samplename}_2.fq.gz"

  call concatenate_fastq.task_concatenate_fastq {
    input:
      forwardFastqFiles = read1,
      reverseFastqFiles = read2,
      outputForward = outputForward,
      outputReverse = outputReverse
  }

  call fastqc.task_fastqc {
    input:
    forwardReads = task_concatenate_fastq.concatenatedForwardFastq,
    reverseReads = task_concatenate_fastq.concatenatedReverseFastq
  }

  Boolean filter1 = task_fastqc.numberForwardReads == task_fastqc.numberReverseReads
  Boolean filter2 = task_fastqc.numberForwardReads > minNumberReads
  Boolean filter = filter1 && filter2
  if ( filter ) {

    call trimmomatic.task_trimmomatic {
      input:
      read1 = task_concatenate_fastq.concatenatedForwardFastq,
      read2 = task_concatenate_fastq.concatenatedReverseFastq,
      samplename = samplename
    }

    if ( run_decontamination ) {
      call bbduk.task_bbduk {
	input:
	read1_trimmed = task_trimmomatic.read1_trimmed,
	read2_trimmed = task_trimmomatic.read2_trimmed,
	samplename = samplename
      }
    }

    call tbprofiler.task_tbprofiler {
      input:
      read1 = select_first([task_bbduk.read1_clean, task_trimmomatic.read1_trimmed]),
      read2 = select_first([task_bbduk.read2_clean, task_trimmomatic.read1_trimmed]),
      samplename = samplename
    }
    
    call bcf2vcf.task_bcf2vcf {
      input:
      bcf_file = task_tbprofiler.bcf
    }

    if ( run_bamQC ) {
      call bamQC.task_collect_multiple_metrics {
	input:
	inputBam = task_tbprofiler.bam,
	reference = reference
      }
    }

    String the_report = if defined(report) then select_first([report]) else samplename+"_variant_interpretation.tsv"
    
    call vi.task_variant_interpretation {
      input:
      vcf = task_tbprofiler.vcf,
      bam = task_tbprofiler.bam,
      bai = task_tbprofiler.bai,
      bed = bed,
      json = json,
      sample_name = samplename,
      report = the_report
    }

    Array[File] allReports = flatten([
    select_all([task_trimmomatic.trim_log, task_fastqc.forwardData, task_fastqc.reverseData, task_bbduk.adapter_stats, task_bbduk.phiX_stats]),
    flatten(select_all([task_collect_multiple_metrics.collectMetricsOutput,[]]))
    ])
    if ( length(allReports) > 0 ) {
      call multiQC.task_multiqc {
	input:
	inputFiles = allReports,
	outputPrefix = samplename
      }
    }
    
  }
  # end filter
  
  output {
    File? csv = task_tbprofiler.csv
    File? bam = task_tbprofiler.bam
    File? bai = task_tbprofiler.bai
    File? vcf = task_tbprofiler.vcf
    File? svs = task_bcf2vcf.vcf_file
    # output from trimmer
    File? trim_stats = task_trimmomatic.trim_stats
    # output from decontamination
    File? phiX_stats = task_bbduk.phiX_stats
    File? adapter_stats = task_bbduk.adapter_stats
    # output from fastqc
    File forwardHtml = task_fastqc.forwardHtml
    File reverseHtml = task_fastqc.reverseHtml
    File forwardZip = task_fastqc.forwardZip
    File reverseZip = task_fastqc.reverseZip
    File forwardSummary = task_fastqc.forwardSummary
    File reverseSummary = task_fastqc.reverseSummary
    File forwardData = task_fastqc.forwardData
    File reverseData = task_fastqc.reverseData
    # output from bam QC
    Array[File]? collectMetricsOutput = task_collect_multiple_metrics.collectMetricsOutput
    # variant interpretation
    File? interpretation_report = task_variant_interpretation.interpretation_report
    # multiqc
    File? multiqc_report = task_multiqc.report
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## variant pipeline \n This is the London TB profiler: https://github.com/jodyphelan/TBProfiler.\n\n This also runs fastq QC, decontamination, and alignment QC."
  }
  
  parameter_meta {
    read1: {
      description: "List of fastq files with forward reads.",
      category: "required"
    }
    read2: {
      description: "List of fastq files with reverse reads.",
      category: "required"
    }
    reference: {
      description: "Reference sequence to align to.",
      category: "required"
    }
    samplename: {
      description: "Name of the sample.",
      category: "required"
    }
  }

}
