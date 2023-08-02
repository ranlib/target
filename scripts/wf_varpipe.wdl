version 1.0

import "./task_concatenate_fastq.wdl" as concatenate_fastq
import "./task_fastqc.wdl" as fastqc
import "./task_trimmomatic.wdl" as trimmomatic
import "./task_bbduk.wdl" as bbduk
import "./wf_clockwork_decontamination.wdl" as cd
import "./task_varpipe.wdl" as varpipe
import "./task_delly.wdl" as delly
import "./task_multiqc.wdl" as multiQC
import "./task_variant_interpretation.wdl" as vi
import "./task_collect_multiple_metrics.wdl" as bamQC
import "./task_collect_wgs_metrics.wdl" as wgsQC
import "./wf_collect_targeted_pcr_metrics.wdl" as tpcrm
import "./task_depth_of_coverage.wdl" as doc

workflow wf_varpipe {
  input {
    Array[File]+ read1
    Array[File]+ read2
    File reference
    File config
    String samplename
    String outdir
    String genome = "NC_000962.3"
    Boolean keep = false
    Boolean whole_genome = true
    Boolean verbose = false
    # trimmomatic
    Boolean no_trim = true
    # fastqc
    Boolean run_fastqc_after_cleanup = true
    Int minNumberReads = 10000
    # bbduk
    Boolean run_decontamination = true
    # clockwork
    Boolean run_clockwork_decontamination = true
    File clockwork_decontamination_metadata
    File clockwork_contaminants
    # delly
    Boolean run_delly = true
    # bamQC
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

    if ( run_fastqc_after_cleanup ) {
      call fastqc.task_fastqc as fastqc_after_cleanup {
	input:
	forwardReads = select_first([task_bbduk.read1_clean, wf_clockwork_decontamination.clean_reads_1, task_trimmomatic.read1_trimmed]),
	reverseReads = select_first([task_bbduk.read2_clean, wf_clockwork_decontamination.clean_reads_2, task_trimmomatic.read2_trimmed])
      }
    }
    
    call varpipe.task_varpipe {
      input:
      read1 = select_first([task_bbduk.read1_clean, wf_clockwork_decontamination.clean_reads_1, task_trimmomatic.read1_trimmed]),
      read2 = select_first([task_bbduk.read2_clean, wf_clockwork_decontamination.clean_reads_2, task_trimmomatic.read2_trimmed]),
      reference = reference,
      samplename = samplename,
      config = config,
      outdir = outdir,
      genome = genome,
      keep = keep,
      no_trim = no_trim,
      whole_genome = whole_genome,
      verbose = verbose
    }

    if ( run_delly ) {
      call delly.task_delly {
	input:
	bamFile = task_varpipe.bam,
	bamIndex = task_varpipe.bai,
	reference = reference
      }
    }
    
    if ( run_bamQC ) {
      call bamQC.task_collect_multiple_metrics {
	input:
	bam = task_varpipe.bam,
	reference = reference
      }
      call wgsQC.task_collect_wgs_metrics {
	input:
	bam = task_varpipe.bam,
	reference = reference
      }
      call tpcrm.wf_collect_targeted_pcr_metrics {
	input:
	bam = task_varpipe.bam,
	reference = reference,
	amplicon_bed = bed,
	target_bed = bed
      }
      call doc.task_depth_of_coverage {
	input:
	bam = task_varpipe.bam,
	reference = reference,
	intervals = bed
      }
    }

    String the_report = if defined(report) then select_first([report]) else samplename+"_variant_interpretation.tsv"
    call vi.task_variant_interpretation {
      input:
      vcf = task_varpipe.DR_loci_raw_annotation,
      bam = task_varpipe.bam,
      bai = task_varpipe.bai,
      bed = bed,
      json = json,
      sample_name = samplename,
      report = the_report
    }
  }
  # end filter
  
  Array[File] allReports = flatten([
  select_all([task_trimmomatic.trim_err,
  task_fastqc.forwardData,
  task_fastqc.reverseData,
  task_bbduk.adapter_stats,
  task_bbduk.phiX_stats,
  task_varpipe.snpEff_summary_full,
  task_varpipe.snpEff_summary_targets,
  task_collect_wgs_metrics.collectMetricsOutput,
  wf_collect_targeted_pcr_metrics.output_metrics ]),
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
    # trimmomatic
    #File? trim_log = task_trimmomatic.trim_log
    File? trim_err = task_trimmomatic.trim_err
    File? trim_stats = task_trimmomatic.trim_stats
    # output from varpipe
    File? DR_loci_annotation  = task_varpipe.DR_loci_annotation 
    File? DR_loci_Final_annotation  = task_varpipe.DR_loci_Final_annotation 
    File? DR_loci_raw_annotation  = task_varpipe.DR_loci_raw_annotation 
    File? full_annotation = task_varpipe.full_annotation
    File? full_Final_annotation  = task_varpipe.full_Final_annotation 
    File? full_raw_annotation  = task_varpipe.full_raw_annotation 
    File? genome_region_coverage  = task_varpipe.genome_region_coverage 
    File? interpretation  = task_varpipe.interpretation 
    File? lineage_report  = task_varpipe.lineage_report 
    File? Lineage  = task_varpipe.Lineage 
    File? log  = task_varpipe.log 
    File? bai  = task_varpipe.bai 
    File? bam  = task_varpipe.bam 
    File? stats  = task_varpipe.stats 
    File? structural_variants  = task_varpipe.structural_variants 
    File? summary  = task_varpipe.summary 
    File? target_region_coverage  = task_varpipe.target_region_coverage
    File? mark_duplicates_metrics = task_varpipe.mark_duplicates_metrics
    File? snpEff_summary_targets = task_varpipe.snpEff_summary_targets
    File? snpEff_summary_full = task_varpipe.snpEff_summary_full
    File? qc_log = task_varpipe.qc_log
    String? pipeline_date = task_varpipe.pipeline_date
    # output from bam QC
    Array[File]? multiple_metrics_outputs = task_collect_multiple_metrics.collectMetricsOutput
    Array[File]? depth_of_coverage_outputs = task_depth_of_coverage.outputs
    File? collect_wgs_output_metrics = task_collect_wgs_metrics.collectMetricsOutput
    File? collect_targeted_pcr_metrics = wf_collect_targeted_pcr_metrics.output_metrics
    # output from fastqc
    File forwardHtml = task_fastqc.forwardHtml
    File reverseHtml = task_fastqc.reverseHtml
    File forwardZip = task_fastqc.forwardZip
    File reverseZip = task_fastqc.reverseZip
    File forwardSummary = task_fastqc.forwardSummary
    File reverseSummary = task_fastqc.reverseSummary
    File forwardData = task_fastqc.forwardData
    File reverseData = task_fastqc.reverseData
    # output from fastqc after cleanup
    File? forwardHtml_cleaned = fastqc_after_cleanup.forwardHtml
    File? reverseHtml_cleaned = fastqc_after_cleanup.reverseHtml
    File? forwardZip_cleaned = fastqc_after_cleanup.forwardZip
    File? reverseZip_cleaned = fastqc_after_cleanup.reverseZip
    File? forwardSummary_cleaned = fastqc_after_cleanup.forwardSummary
    File? reverseSummary_cleaned = fastqc_after_cleanup.reverseSummary
    File? forwardData_cleaned = fastqc_after_cleanup.forwardData
    File? reverseData_cleaned = fastqc_after_cleanup.reverseData
    # output from bbduk
    File? adapter_stats = task_bbduk.adapter_stats
    File? phiX_stats = task_bbduk.phiX_stats
    # output from clockwork decontamination
    File? clockwork_decontamination_stats = wf_clockwork_decontamination.stats
    # output from delly
    File? dellyVcf = task_delly.vcfFile
    # variant interpretation
    File? interpretation_report = task_variant_interpretation.interpretation_report
    # multiqc
    File? multiqc_report = task_multiqc.report
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## variant pipeline \n This is the CDC TB profiler: https://github.com/CDCgov/NCHHSTP-DTBE-Varpipe-WGS.\n\n This also runs fastq QC, decontamination, and alignment QC."
  }
  
  parameter_meta {
    read1: {
      description: "List of fastq files with forward reads. Must have suffix fastq.gz or fq.gz.",
      category: "required"
    }
    read2: {
      description: "List of fastq files with reverse reads. Must have suffix fastq.gz or fq.gz.",
      category: "required"
    }
    reference: {
      description: "Reference sequence to align to in fasta format.",
      category: "required"
    }
    config: {
      description: "Configuration file with parameters for the pipeline.",
      category: "required"
    }
    samplename: {
      description: "Alphanumeric name of the sample.",
      category: "required"
    }
    outdir: {
      description: "Alphanumeric name of output directory.",
      category: "required"
    }
    genome: {
      description: "Alphanumeric name of reference genome.",
      category: "optional"
    }
    keep: {
      description: "Flag if temporary output files should be kept, for debugging purposes.",
      category: "optional"
    }
    whole_genome: {
      description: "Flag if variant calls should be performed on entire genome, not only intervals of interest.",
      category: "optional"
    }
    verbose: {
      description: "Flag for additional debugging output written to log file.",
      category: "optional"
    }
    run_bamQC: {
      description: "Flag for performing alignment bam QC.",
      category: "optional"
    }
    outputBasename: {
      description: "Prefix for the output files of the alignment QC.",
      category: "optional"
    }
    minNumberReads: {
      description: "Minimum number of reads required to run the pipeline.",
      category: "optional"
    }
    run_decontamination: {
      description: "Flag, turn on if decontamination of fastq files should be run.",
      category: "optional"
    }
    run_delly: {
      description: "Flag, turn on if delly for structural variant calling should be run.",
      category: "optional"
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

    # output
    bam: {description: "Output alignement file of alignment procedure, aligner is bwa."}
    bai: {description: "Index file for output alignement file of alignment procedure, aligner is bwa."}

    DR_loci_raw_annotation: {description: "Ouput vcf file with annotated variant calls in regions of interest."}
    DR_loci_annotation: {description: "Ouput text file with annotated variant calls in regions of interest."}
    DR_loci_Final_annotation: {description: "Ouput text file with annotated variant calls in regions of interest with some selection."}

    full_raw_annotation: {description: "Ouput vcf file with annotated variant calls in regions of interest."}
    full_annotation: {description: "Ouput text file with annotated variant calls in regions of interest."}
    full_Final_annotation: {description: "Ouput text file with annotated variant calls in regions of interest with some selection."}

    forwardData: {description: "Fastqc output data for forward reads."}
    forwardHtml: {description: "Fastqc output html file for forward reads."}
    forwardSummary: {description: "Fastqc output summary file for forward reads."}
    forwardZip: {description: "Fastqc output zip file for forward reads."}
    
    reverseData: {description: "Fastqc output data for reverse reads."}
    reverseHtml: {description: "Fastqc output html file for reverse reads."}
    reverseSummary: {description: "Fastqc output summary file for reverse reads."}
    reverseZip: {description: "Fastqc output zip file for reverse reads."}
    
    Lineage: {description: "Varpipe lineage output."}
    lineage_report: {description: "Varpipe lineage report."}

    log: {description: "Varpipe log file."}
    qc_log: {description: "Varpipe QC report."}
    
    collectMetricsOutput: {description: "Array of output files from alignment bam QC."}

    adapter_stats: {description: "Name file where decontamination procedure writes adapter contamination statistics to."}
    phiX_stats: {description: "phiX contamination report from bbduk decontamination task."}

    dellyVcf: {description: "Ouput vcf file from delly structural variant caller."}

    interpretation: {description: "Output tsv file from varpipe interpretation."}
    interpretation_report: {description: "Output tsv file from variant interpretation."}

    multiqc_report: {description: "Output html file with QC summary report."}

  }
}
