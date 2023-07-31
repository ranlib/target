version 1.0

import "./task_concatenate_fastq.wdl" as concatenate_fastq
import "./task_fastqc.wdl" as fastqc
import "./task_trimmomatic.wdl" as trimmomatic
import "./task_bbduk.wdl" as bbduk
import "./task_create_sequence_dictionary.wdl" as csd
import "./task_genbank_to_fasta.wdl" as genbank2fasta
import "./wf_bwa.wdl" as bwa
import "./wf_gatk.wdl" as gatk
import "./task_minimap2.wdl" as minimap2
import "./task_snpEff.wdl" as snpEff
import "./task_delly.wdl" as delly
import "./task_collect_multiple_metrics.wdl" as bamQC
import "./task_collect_wgs_metrics.wdl" as wgsQC
import "./wf_collect_targeted_pcr_metrics.wdl" as tpcrm
import "./task_depth_of_coverage.wdl" as doc
import "./task_multiqc.wdl" as multiQC

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
    # snpEff
    String genome
    File dataDir
    File config

    Boolean run_delly = true
    Boolean run_bamQC = true
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

  String outputPrefix = sub(sub(basename(task_genbank_to_fasta.fastaFile), ".fasta", ""), ".fa", "")
  call minimap2.Indexing {
    input:
    referenceFile = task_genbank_to_fasta.fastaFile,
    outputPrefix = outputPrefix,
    cores = threads
  }
  
  call minimap2.Mapping {
    input:
    referenceFile = task_genbank_to_fasta.fastaFile,
    queryFile1 = task_trimmomatic.read1_trimmed,
    queryFile2 = task_trimmomatic.read2_trimmed,
    outputPrefix = samplename,
    presetOption = "sr",
    addMDTagToSam = true,
    outputSam = true,
    cores = threads
  }

  call bwa.wf_bwa {
    input:
    samplename = samplename,
    reference = task_genbank_to_fasta.fastaFile,
    r1fastq = task_trimmomatic.read1_trimmed,
    r2fastq = task_trimmomatic.read2_trimmed,
    threads = threads
  }

  call csd.task_create_sequence_dictionary {
    input:
    reference = task_genbank_to_fasta.fastaFile
  }
  
  call gatk.wf_gatk {
    input:
    inputBams = [wf_bwa.outbam],
    inputBamsIndex = [wf_bwa.outbamidx],
    intervals = [intervals],
    referenceFasta = task_genbank_to_fasta.fastaFile,
    referenceFastaDict = task_create_sequence_dictionary.dict, 
    referenceFastaFai = task_create_sequence_dictionary.fai,
    min_reads_per_strand =  min_reads_per_strand,
    min_median_read_position = min_median_read_position,
    min_allele_fraction =  min_allele_fraction,
    outputVcf = sub(basename(wf_bwa.outbam),".bam",".vcf"),
    outputAlignedVcf = sub(basename(wf_bwa.outbam),".bam","_aligned.vcf"),
    outputFilteredVcf = sub(basename(wf_bwa.outbam),".bam","_filtered.vcf")
  }

  call snpEff.SnpEff {
    input:
    vcf = wf_gatk.vcfFilteredFile,
    genome = genome,
    config = config,
    dataDir = dataDir
  }

  if ( run_delly ) {
    call delly.task_delly {
      input:
      bamFile = wf_bwa.outbam,
      bamIndex = wf_bwa.outbamidx,
      referenceFasta = task_genbank_to_fasta.fastaFile
    }
  }
  
  if ( run_bamQC ) {
    call bamQC.task_collect_multiple_metrics {
      input:
      bam = wf_bwa.outbam,
      reference = task_genbank_to_fasta.fastaFile
    }
    call wgsQC.task_collect_wgs_metrics {
      input:
      bam = wf_bwa.outbam,
      reference = task_genbank_to_fasta.fastaFile
    }
    call tpcrm.wf_collect_targeted_pcr_metrics {
      input:
      bam = wf_bwa.outbam,
      reference = task_genbank_to_fasta.fastaFile,
      amplicon_bed = intervals,
      target_bed = intervals
    }
    call doc.task_depth_of_coverage {
      input:
      bam = wf_bwa.outbam,
      reference = task_genbank_to_fasta.fastaFile,
      intervals = intervals
    }
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
    File? bam = wf_bwa.outbam
    File? bai = wf_bwa.outbamidx
    File? vcf = wf_gatk.vcfFile
    File? vcfIndex = wf_gatk.vcfFileIndex
    File? vcfStats = wf_gatk.vcfFileStats
    File? vcfAligned = wf_gatk.vcfAlignedFile
    File? vcfAlignedIndex = wf_gatk.vcfAlignedFileIndex
    File? vcfFiltered = wf_gatk.vcfFilteredFile
    File? vcfFilteredIndex = wf_gatk.vcfFilteredFileIndex
    File? vcfFilteredStats = wf_gatk.vcfFilteredFileStats
    # snpEff
    File vcfAnnotated = SnpEff.outputVcf
    # output from delly
    File? dellyVcf = task_delly.vcfFile
    # output from bam QC
    Array[File]? multiple_metrics_outputs = task_collect_multiple_metrics.collectMetricsOutput
    Array[File]? depth_of_coverage_outputs = task_depth_of_coverage.outputs
    File? collect_wgs_output_metrics = task_collect_wgs_metrics.collectMetricsOutput
    File? collect_targeted_pcr_metrics = wf_collect_targeted_pcr_metrics.output_metrics
    # multiqc
    File? multiqc_report = task_multiqc.report
  }
}
