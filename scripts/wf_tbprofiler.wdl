version 1.0

import "./task_concatenate_fastq.wdl" as concatenate_fastq
import "./task_fastqc.wdl" as fastqc
import "./task_trimmomatic.wdl" as trimmomatic
import "./task_bbduk.wdl" as bbduk
import "./wf_clockwork_decontamination.wdl" as cd
import "./task_tbprofiler.wdl" as tbprofiler
import "./task_bcf2vcf.wdl" as bcf2vcf
import "./task_multiqc.wdl" as multiQC
import "./task_variant_interpretation.wdl" as vi
import "./task_collect_multiple_metrics.wdl" as bamQC
import "./task_collect_wgs_metrics.wdl" as wgsQC
import "./wf_collect_targeted_pcr_metrics.wdl" as tpcrm
import "./task_depth_of_coverage.wdl" as doc

workflow wf_tbprofiler {
  input {
    Array[File]+ read1
    Array[File]+ read2
    File reference
    String samplename
    Int minNumberReads = 10000
    Boolean run_decontamination = true
    # clockwork
    Boolean run_clockwork_decontamination = true
    File clockwork_decontamination_metadata
    File clockwork_contaminants
    Boolean run_bamQC = true
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

    if ( run_clockwork_decontamination ) {
      call cd.wf_clockwork_decontamination {
	input:
	reference = clockwork_contaminants,
	sample_name = samplename,
        metadata_file = clockwork_decontamination_metadata,
	input_reads_1 = task_trimmomatic.read1_trimmed,
	input_reads_2 = task_trimmomatic.read2_trimmed
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
	bam = task_tbprofiler.bam,
	reference = reference
      }
      call wgsQC.task_collect_wgs_metrics {
	input:
	bam = task_tbprofiler.bam,
	reference = reference
      }
      call tpcrm.wf_collect_targeted_pcr_metrics {
	input:
	bam = task_tbprofiler.bam,
	reference = reference,
	amplicon_bed = bed,
	target_bed = bed
      }
      call doc.task_depth_of_coverage {
	input:
	bam = task_tbprofiler.bam,
	reference = reference,
	intervals = bed
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
    
  }
  # end filter
  
  Array[File] allReports = flatten([
  select_all([task_trimmomatic.trim_err, task_fastqc.forwardData, task_fastqc.reverseData, task_bbduk.adapter_stats, task_bbduk.phiX_stats ]),
  flatten(select_all([task_collect_multiple_metrics.collectMetricsOutput,[]]))
  ])
  if ( length(allReports) > 0 ) {
    call multiQC.task_multiqc {
      input:
      inputFiles = allReports,
      outputPrefix = samplename
    }
  }
  
  output {
    File? csv = task_tbprofiler.csv
    File? bam = task_tbprofiler.bam
    File? bai = task_tbprofiler.bai
    File? vcf = task_tbprofiler.vcf
    File? svs = task_bcf2vcf.vcf_file
    # output from trimmer trimmomatic
    File? trim_stats = task_trimmomatic.trim_stats
    # output from bbduk decontamination
    File? phiX_stats = task_bbduk.phiX_stats
    File? adapter_stats = task_bbduk.adapter_stats
    # output from clockwork decontamination
    File? clockwork_decontamination_stats = wf_clockwork_decontamination.stats
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
    Array[File]? multiple_metrics_outputs = task_collect_multiple_metrics.collectMetricsOutput
    Array[File]? depth_of_coverage_outputs = task_depth_of_coverage.outputs
    File? collect_wgs_output_metrics = task_collect_wgs_metrics.collectMetricsOutput
    File? collect_targeted_pcr_metrics = wf_collect_targeted_pcr_metrics.output_metrics
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
    bed: {
      description: "bed file with genomic intervals of interest. Note: reference name in case of London TB profiler is 'Chromosome', make sure to use correct bed file",
      category: "required"
    }
    json: {
      description: "json file with drug information for variants.",
      category: "required"
    }
    report: {
      description: "Name for output tsv file.",
      category: "optional"
    }
    run_decontamination: {
      description: "Flag, turn on if decontamination of fastq files should be run.",
      category: "optional"
    }
    run_bamQC: {
      description: "Flag for performing alignment bam QC.",
      category: "optional"
    }
    # output
    adapter_stats: {description: "Name file where decontamination procedure writes adapter contamination statistics to."}
    phiX_stats: {description: "phiX contamination report from bbduk decontamination task."}

    bam: {description: "Output alignement file of alignment procedure, aligner is bwa."}
    bai: {description: "Index file for output alignement file of alignment procedure, aligner is bwa."}
    csv: {description: "Ouput variant call file in csv format."}
    vcf: {description: "Ouput variant call file in vcf format."}
    svs: {description: "Ouput structural variants call file in vcf format."}

    collectMetricsOutput: {description: "Array of output files from alignment bam QC."}

    forwardData: {description: "Fastqc output data for forward reads."}
    forwardHtml: {description: "Fastqc output html file for forward reads."}
    forwardSummary: {description: "Fastqc output summary file for forward reads."}
    forwardZip: {description: "Fastqc output zip file for forward reads."}
    
    reverseData: {description: "Fastqc output data for reverse reads."}
    reverseHtml: {description: "Fastqc output html file for reverse reads."}
    reverseSummary: {description: "Fastqc output summary file for reverse reads."}
    reverseZip: {description: "Fastqc output zip file for reverse reads."}

    trim_stats: {description: "Output text file for read trimming statistics."}
    interpretation_report: {description: "Output tsv file from variant interpretation."}
    multiqc_report: {description: "Output html file with QC summary report."}
  }

}
