version 1.0

task task_varpipe {
  input {
    File read1
    File read2
    File reference
    File config
    String samplename
    String outdir
    String genome = "NC_000962.3"
    Int threads = 1
  }
  command {
    Varpipeline.py -q ${read1} -q2 ${read2} -r ${reference} -g ${genome} -n ${samplename} -t ${threads} -o ${outdir} -v -a -k -c ${config}
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
  }
  runtime {
    docker: "dbest/varpipe4:latest"
    cpu: 4
    memory: "10 GB"
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
    String genome = "NC_000962"
    Int threads = 1
  }
  call task_varpipe {
    input:
    read1 = read1,
    read2 = read2,
    reference = reference,
    samplename = samplename,
    config = config,
    outdir = outdir,
    genome = genome,
    threads = threads
  }
  output {
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
  }
}
