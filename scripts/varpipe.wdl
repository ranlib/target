version 1.0

import "./task_RunCollectMultipleMetrics.wdl" as bamQC
import "./task_fastqc.wdl" as fastqc
import "./task_bbduk.wdl" as bbduk
import "./task_delly.wdl" as delly

task task_varpipe {
  input {
    File read1
    File read2
    File reference
    File config
    String samplename
    String outdir
    String genome
    Boolean keep = true
    Int threads = 1
    String memory = "32 GB"
    String docker = "dbest/varpipe4:latest"
  }
  
  command {
    date | tee DATE
    Varpipeline.py -q ~{read1} -q2 ~{read2} -r ~{reference} -g ~{genome} -n ~{samplename} -t ~{threads} -o ~{outdir} -v -a ~{true="-k" false="" keep} -c ~{config}
  }
  
  output {
    File DR_loci_annotation = "~{outdir}/~{samplename}_DR_loci_annotation.txt"
    File DR_loci_Final_annotation = "~{outdir}/~{samplename}_DR_loci_Final_annotation.txt"
    File DR_loci_raw_annotation = "~{outdir}/~{samplename}_DR_loci_raw_annotation.vcf"
    File full_annotation = "~{outdir}/~{samplename}_full_annotation.txt"
    File full_Final_annotation = "~{outdir}/~{samplename}_full_Final_annotation.txt"
    File full_raw_annotation = "~{outdir}/~{samplename}_full_raw_annotation.vcf"
    File genome_region_coverage = "~{outdir}/~{samplename}_genome_region_coverage.txt"
    File interpretation = "~{outdir}/~{samplename}_interpretation.txt"
    File lineage_report = "~{outdir}/~{samplename}.lineage_report.txt"
    File Lineage = "~{outdir}/~{samplename}_Lineage.txt"
    File log = "~{outdir}/~{samplename}.log"
    File bai = "~{outdir}/~{samplename}_sdrcsm.bai"
    File bam = "~{outdir}/~{samplename}_sdrcsm.bam"
    File stats = "~{outdir}/~{samplename}_stats.txt"
    File structural_variants = "~{outdir}/~{samplename}_structural_variants.txt"
    File summary = "~{outdir}/~{samplename}_summary.txt"
    File target_region_coverage = "~{outdir}/~{samplename}_target_region_coverage.txt"
    File trim_log = "~{outdir}/trimLog.txt"
    File mark_duplicates_metrics = "~{outdir}/MarkDupes.metrics"
    File qc_log = "~{outdir}/QC/QC.log"
    String pipeline_date = read_string("DATE")
  }
  
  runtime {
    docker: "~{docker}"
    memory: "~{memory}"
    cpu: threads
  }
}

workflow wf_varpipe {
  input {
    File read1
    File read2
    File reference
    File config
    String samplename
    String outdir
    String genome
    Int threads = 1
    # input for bam QC
    Boolean run_bamQC = true
    String outputBasename = "multiple_metrics"
    # fastqc
    Int minNumberReads = 100000
    ## bbduk
    Boolean run_decontamination = true
    # delly
    Boolean run_delly = true
    String svType = "DEL"
    File? noneFile
  }
  
  call fastqc.task_fastqc {
    input:
    forwardReads = read1,
    reverseReads = read2,
    threads = threads
  }

  Boolean filter1 = task_fastqc.numberForwardReads == task_fastqc.numberReverseReads
  Boolean filter2 = task_fastqc.numberForwardReads > minNumberReads
  Boolean filter = filter1 && filter2
  if ( filter ) {
    if ( run_decontamination ) {
      call bbduk.task_bbduk {
	input:
	read1_trimmed = read1,
	read2_trimmed = read2,
	samplename = samplename
      }
    }
    
    call task_varpipe {
      input:
      read1 = select_first([task_bbduk.read1_clean, read1]),
      read2 = select_first([task_bbduk.read2_clean, read1]),
      reference = reference,
      samplename = samplename,
      config = config,
      outdir = outdir,
      genome = genome,
      threads = threads
    }

    if ( run_delly ) {
      call delly.task_delly {
	input:
	bamFile = task_varpipe.bam,
	bamIndex = task_varpipe.bai,
	referenceFasta = reference,
	svType = svType
      }
    }
    
    if ( run_bamQC ) {
      call bamQC.RunCollectMultipleMetrics {
	input:
	inputBam = task_varpipe.bam,
	reference = reference,
	outputBasename = outputBasename
      }
    }
  }

  output {
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
    File? trim_log = task_varpipe.trim_log
    File? mark_duplicates_metrics = task_varpipe.mark_duplicates_metrics
    File? qc_log = task_varpipe.qc_log
    String? pipeline_date = task_varpipe.pipeline_date
    # output from bam QC
    Array[File]? collectMetricsOutput = RunCollectMultipleMetrics.collectMetricsOutput
    # output from fastqc
    File? forwardHtml = task_fastqc.forwardHtml
    File? reverseHtml = task_fastqc.reverseHtml
    File? forwardZip = task_fastqc.forwardZip
    File? reverseZip = task_fastqc.reverseZip
    File? forwardSummary = task_fastqc.forwardSummary
    File? reverseSummary = task_fastqc.reverseSummary
    File? forwardData = task_fastqc.forwardData
    File? reverseData = task_fastqc.reverseData
    # output from bbduk
    File? adapter_stats = select_first([task_bbduk.adapter_stats, noneFile])
    File? phiX_stats = select_first([task_bbduk.phiX_stats, noneFile])
    # output from delly
    File? dellyVcf = select_first([task_delly.vcfFile, noneFile])
  }
}
