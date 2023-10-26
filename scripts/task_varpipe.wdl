version 1.0

task task_varpipe {
  input {
    File read1
    File read2
    File reference
    File config
    File snpEff_config
    File snpEff_database
    String samplename
    String outdir
    String genome
    Boolean keep = true
    Boolean no_trim = true
    Boolean whole_genome = true
    Boolean verbose = true
    Int threads = 1
    String memory = "32GB"
    String docker = "dbest/varpipe4:v2.0.0"
  }
  
  command {
    set -x
    date | tee DATE
    Varpipeline.py \
    --fastq ~{read1} \
    --fastq2 ~{read2} \
    --reference ~{reference} \
    --genome ~{genome} \
    --name ~{samplename} \
    --threads ~{threads} \
    --outdir ~{outdir} \
    --configuration ~{config} \
    --snpEff_config ~{snpEff_config} \
    --database ~{snpEff_database} \
    --annotation \
    ~{true="--verbose" false="" verbose} \
    ~{true="--keepfiles" false="" keep} \
    ~{true="--whole_genome" false="" whole_genome} \
    ~{true="--no_trim" false="" no_trim}
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
    #File bai = "~{outdir}/~{samplename}_sdrcsm.bai"
    #File bam = "~{outdir}/~{samplename}_sdrcsm.bam"
    File bai = "~{outdir}/~{samplename}_s.bai"
    File bam = "~{outdir}/~{samplename}_s.bam"
    File stats = "~{outdir}/~{samplename}_stats.txt"
    File structural_variants = "~{outdir}/~{samplename}_structural_variants.txt"
    File summary = "~{outdir}/~{samplename}_summary.txt"
    File target_region_coverage = "~{outdir}/~{samplename}_target_region_coverage.txt"
    File? trim_log = "~{outdir}/trimLog.txt"
    File snpEff_summary_targets = "~{outdir}/~{samplename}_snpEff_summary_targets.csv"
    File? snpEff_summary_full = "~{outdir}/~{samplename}_snpEff_summary_full.csv"
    File mark_duplicates_metrics = "~{outdir}/MarkDupes.metrics"
    File qc_log = "~{outdir}/QC/QC.log"
    String pipeline_date = read_string("DATE")
  }
  
  runtime {
    docker: docker
    memory: memory
    cpu: threads
  }
}

