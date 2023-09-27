version 1.0

import "./task_concatenate_fastq.wdl" as concatenate_fastq
import "./task_fastqc.wdl" as fastqc
import "./task_fastq_screen.wdl" as fastq_screen
import "./task_trimmomatic.wdl" as trimmomatic
import "./task_bbduk.wdl" as bbduk
import "./task_create_sequence_dictionary.wdl" as csd
import "./task_genbank_to_fasta.wdl" as genbank2fasta
import "./wf_gatk.wdl" as gatk
import "./wf_minimap2.wdl" as minimap2
import "./task_snpEff.wdl" as snpEff
import "./task_delly.wdl" as delly
import "./task_collect_multiple_metrics.wdl" as bamQC
import "./task_collect_wgs_metrics.wdl" as wgsQC
import "./wf_collect_targeted_pcr_metrics.wdl" as tpcrm
import "./task_depth_of_coverage.wdl" as doc
import "./task_multiqc.wdl" as multiQC
import "./task_concat_2_vcfs.wdl" as concat

workflow wf_ngs_pipeline {
  input {
    File genbankFile
    Array[File]+ read1
    Array[File]+ read2
    File intervals
    String samplename
    Int threads = 1
    Int min_reads_per_strand
    Int min_median_read_position
    Float min_allele_fraction
    # fastq_screen
    File fastq_screen_configuration
    File fastq_screen_contaminants
    # snpEff
    String genome
    File dataDir
    File config
    # concat vcfs
    String output_vcf_name = "all_variants.vcf"
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

  call fastq_screen.task_fastq_screen {
    input:
    reads = task_concatenate_fastq.concatenatedForwardFastq,
    configuration = fastq_screen_configuration,
    contaminants = fastq_screen_contaminants
  }
  
  call fastqc.task_fastqc {
    input:
    forwardReads = task_concatenate_fastq.concatenatedForwardFastq,
    reverseReads = task_concatenate_fastq.concatenatedReverseFastq
  }
  
  call trimmomatic.task_trimmomatic {
    input:
    read1 = task_concatenate_fastq.concatenatedForwardFastq,
    read2 = task_concatenate_fastq.concatenatedReverseFastq,
    samplename = samplename
  }
  
  call bbduk.task_bbduk {
    input:
    read1_trimmed = task_trimmomatic.read1_trimmed,
    read2_trimmed = task_trimmomatic.read2_trimmed,
    samplename = samplename
  }

  call genbank2fasta.task_genbank_to_fasta {
    input:
    genbankFile = genbankFile
  }

  call minimap2.wf_minimap2 {
    input:
    reference = task_genbank_to_fasta.fastaFile,
    read1 = select_first([task_bbduk.read1_clean, task_trimmomatic.read1_trimmed]),
    read2 = select_first([task_bbduk.read2_clean, task_trimmomatic.read2_trimmed]),
    outputPrefix = samplename,
    samplename = samplename,
    threads = threads
  }

  call csd.task_create_sequence_dictionary {
    input:
    reference = task_genbank_to_fasta.fastaFile
  }
  
  call gatk.wf_gatk {
    input:
    inputBams = [wf_minimap2.bam],
    inputBamsIndex = [wf_minimap2.bai],
    intervals = [intervals],
    referenceFasta = task_genbank_to_fasta.fastaFile,
    referenceFastaDict = task_create_sequence_dictionary.dict, 
    referenceFastaFai = task_create_sequence_dictionary.fai,
    min_reads_per_strand =  min_reads_per_strand,
    min_median_read_position = min_median_read_position,
    min_allele_fraction =  min_allele_fraction,
    outputVcf = sub(basename(wf_minimap2.bam),".bam",".vcf"),
    outputAlignedVcf = sub(basename(wf_minimap2.bam),".bam","_aligned.vcf"),
    outputFilteredVcf = sub(basename(wf_minimap2.bam),".bam","_filtered.vcf")
  }

  call delly.task_delly {
    input:
    bamFile = wf_minimap2.bam,
    bamIndex = wf_minimap2.bai,
    reference = task_genbank_to_fasta.fastaFile
  }

  call concat.task_concat_2_vcfs {
    input:
    vcf1 = wf_gatk.vcfFilteredFile,
    vcf2 = task_delly.vcfFile,
    output_vcf_name = output_vcf_name
  }

  call snpEff.task_snpEff {
    input:
    vcf = task_concat_2_vcfs.concatenated_vcf,
    genome = genome,
    config = config,
    dataDir = dataDir
  }

  call bamQC.task_collect_multiple_metrics {
    input:
    bam = wf_minimap2.bam,
    reference = task_genbank_to_fasta.fastaFile
  }
  call wgsQC.task_collect_wgs_metrics {
    input:
    bam = wf_minimap2.bam,
    reference = task_genbank_to_fasta.fastaFile
  }
  call tpcrm.wf_collect_targeted_pcr_metrics {
    input:
    bam = wf_minimap2.bam,
    reference = task_genbank_to_fasta.fastaFile,
    amplicon_bed = intervals,
    target_bed = intervals
  }
  call doc.task_depth_of_coverage {
    input:
    bam = wf_minimap2.bam,
    reference = task_genbank_to_fasta.fastaFile,
    intervals = intervals
  }

  Array[File] allReports = flatten([
  select_all([
  task_trimmomatic.trim_err,
  task_fastqc.forwardData,
  task_fastqc.reverseData,
  task_bbduk.adapter_stats,
  task_bbduk.phiX_stats,
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
    # output from fastq_screen
    File? fastq_screen_html = task_fastq_screen.html
    File? fastq_screen_txt = task_fastq_screen.txt
    File? fastq_screen_tagged = task_fastq_screen.tagged
    File? fastq_screen_tagged_filter = task_fastq_screen.tagged_filter
    # output from fastqc
    File forwardHtml = task_fastqc.forwardHtml
    File reverseHtml = task_fastqc.reverseHtml
    File forwardZip = task_fastqc.forwardZip
    File reverseZip = task_fastqc.reverseZip
    File forwardSummary = task_fastqc.forwardSummary
    File reverseSummary = task_fastqc.reverseSummary
    File forwardData = task_fastqc.forwardData
    File reverseData = task_fastqc.reverseData
    # output from trimmomatic
    #File? trim_log = task_trimmomatic.trim_log
    File? trim_err = task_trimmomatic.trim_err
    File? trim_stats = task_trimmomatic.trim_stats
    # output from bbduk
    File? adapter_stats = task_bbduk.adapter_stats
    File? phiX_stats = task_bbduk.phiX_stats
    # output from variant calling
    File? bam = wf_minimap2.bam
    File? bai = wf_minimap2.bai
    File? vcf = wf_gatk.vcfFile
    File? vcfIndex = wf_gatk.vcfFileIndex
    File? vcfStats = wf_gatk.vcfFileStats
    File? vcfAligned = wf_gatk.vcfAlignedFile
    File? vcfAlignedIndex = wf_gatk.vcfAlignedFileIndex
    File? vcfFiltered = wf_gatk.vcfFilteredFile
    File? vcfFilteredIndex = wf_gatk.vcfFilteredFileIndex
    File? vcfFilteredStats = wf_gatk.vcfFilteredFileStats
    # output from delly
    File? dellyVcf = task_delly.vcfFile
    # all variants = variant valler + SV caller delly
    File? vcf_concatenated = task_concat_2_vcfs.concatenated_vcf
    # snpEff
    File? vcfAnnotated = task_snpEff.outputVcf
    # output from bam QC
    Array[File]? multiple_metrics_outputs = task_collect_multiple_metrics.collectMetricsOutput
    Array[File]? depth_of_coverage_outputs = task_depth_of_coverage.outputs
    File? collect_wgs_output_metrics = task_collect_wgs_metrics.collectMetricsOutput
    File? collect_targeted_pcr_metrics = wf_collect_targeted_pcr_metrics.output_metrics
    # multiqc
    File? multiqc_report = task_multiqc.report
  }
}
