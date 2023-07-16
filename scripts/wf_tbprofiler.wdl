version 1.0

import "./task_tbprofiler.wdl" as tbprofiler
import "./task_bcf2vcf.wdl" as bcf2vcf
import "./task_fastqc.wdl" as fastqc
import "./task_bbduk.wdl" as bbduk
import "./task_trimmomatic.wdl" as trimmomatic
import "./task_collect_multiple_metrics.wdl" as bamQC
import "./task_multiqc.wdl" as multiQC
import "./task_concatenate_fastq.wdl" as concatenate_fastq

workflow wf_tbprofiler {
  input {
    Array[File]+ read1
    Array[File]+ read2
    File reference
    String samplename
    String tbprofiler_docker_image
    String mapper
    String caller
    Float min_af
    Float min_af_pred
    Int threads
    Int min_depth
    Int cov_frac_threshold
    Int minNumberReads
    Int trimmomatic_minlen
    Int trimmomatic_window_size
    Int trimmomatic_quality_trim_score
    Boolean no_trim
    Boolean run_decontamination
    Boolean run_bamQC
    String outputBasename
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
    reverseReads = task_concatenate_fastq.concatenatedReverseFastq,
    threads = threads
  }

  Boolean filter1 = task_fastqc.numberForwardReads == task_fastqc.numberReverseReads
  Boolean filter2 = task_fastqc.numberForwardReads > minNumberReads
  Boolean filter = filter1 && filter2
  if ( filter ) {

    call trimmomatic.task_trimmomatic {
      input:
      read1 = task_concatenate_fastq.concatenatedForwardFastq,
      read2 = task_concatenate_fastq.concatenatedReverseFastq,
      samplename = samplename,
      cpu = threads,
      trimmomatic_minlen = trimmomatic_minlen,
      trimmomatic_window_size = trimmomatic_window_size,
      trimmomatic_quality_trim_score = trimmomatic_quality_trim_score
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
      samplename = samplename,
      cpu = threads,
      tbprofiler_docker_image = tbprofiler_docker_image,
      mapper = mapper,
      caller = caller,
      min_depth = min_depth,
      min_af = min_af,
      min_af_pred = min_af_pred,
      cov_frac_threshold = cov_frac_threshold,
      no_trim = no_trim
    }
    
    call bcf2vcf.task_bcf2vcf {
      input:
      bcf_file = task_tbprofiler.bcf
    }

    if ( run_bamQC ) {
      call bamQC.RunCollectMultipleMetrics {
	input:
	inputBam = task_tbprofiler.bam,
	reference = reference,
	outputBasename = outputBasename
      }
    }

    Array[File] allReports = flatten([
    select_all([task_trimmomatic.trim_log, task_fastqc.forwardData, task_fastqc.reverseData, task_bbduk.adapter_stats, task_bbduk.phiX_stats]),
    flatten(select_all([RunCollectMultipleMetrics.collectMetricsOutput,[]]))
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
    Array[File]? collectMetricsOutput = RunCollectMultipleMetrics.collectMetricsOutput
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
