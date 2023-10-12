version 1.0

import "./wf_varpipe.wdl" as varpipe

workflow wf_varpipe_cdc {
  input {
    Array[File]+ read1
    Array[File]+ read2
    String samplename
    File reference = "gs://fc-718290db-e82f-4e78-9e82-d05f81c8f329/uploads/ERR552797_split_fastq/NC_000962.3.fasta"
    File config = "gs://fc-718290db-e82f-4e78-9e82-d05f81c8f329/uploads/ERR552797_split_fastq/snp_docker.config"
    File fastq_screen_configuration = "gs://fc-718290db-e82f-4e78-9e82-d05f81c8f329/uploads/ERR552797_split_fastq/fastq_screen.config"
    File fastq_screen_contaminants = "gs://fc-718290db-e82f-4e78-9e82-d05f81c8f329/uploads/ERR552797_split_fastq/fastq_screen_contamination.tar.gz"
    File clockwork_decontamination_metadata = "gs://fc-718290db-e82f-4e78-9e82-d05f81c8f329/uploads/ERR552797_split_fastq/clockwork_decontamination_metadata.tsv"
    File clockwork_contaminants = "gs://fc-718290db-e82f-4e78-9e82-d05f81c8f329/uploads/ERR552797_split_fastq/clockwork_contaminants.fa.gz"
    File bed = "gs://fc-718290db-e82f-4e78-9e82-d05f81c8f329/uploads/ERR552797_split_fastq/tbdb.bed"
    File json = "gs://fc-718290db-e82f-4e78-9e82-d05f81c8f329/uploads/ERR552797_split_fastq/tbdb.dr.json"
  }

  call varpipe.wf_varpipe {
    input:
    read1 = read1,
    read2 = read2,
    samplename = samplename,
    outdir = samplename,
    reference = reference,
    config = config,
    fastq_screen_configuration = fastq_screen_configuration,
    fastq_screen_contaminants = fastq_screen_contaminants,
    clockwork_decontamination_metadata = clockwork_decontamination_metadata,
    clockwork_contaminants = clockwork_contaminants,
    bed = bed,
    json = json
  }

  output {
    File? trim_err   = wf_varpipe.trim_err
    File? trim_stats = wf_varpipe.trim_stats
    File? DR_loci_annotation        = wf_varpipe.DR_loci_annotation 
    File? DR_loci_Final_annotation  = wf_varpipe.DR_loci_Final_annotation 
    File? DR_loci_raw_annotation    = wf_varpipe.DR_loci_raw_annotation 
    File? full_annotation        = wf_varpipe.full_annotation
    File? full_Final_annotation  = wf_varpipe.full_Final_annotation 
    File? full_raw_annotation    = wf_varpipe.full_raw_annotation 
    File? genome_region_coverage = wf_varpipe.genome_region_coverage 
    File? interpretation  = wf_varpipe.interpretation 
    File? lineage_report  = wf_varpipe.lineage_report 
    File? Lineage = wf_varpipe.Lineage 
    File? log   = wf_varpipe.log 
    File? bai   = wf_varpipe.bai 
    File? bam   = wf_varpipe.bam 
    File? stats = wf_varpipe.stats 
    File? structural_variants  = wf_varpipe.structural_variants 
    File? summary              = wf_varpipe.summary 
    File? target_region_coverage  = wf_varpipe.target_region_coverage
    File? mark_duplicates_metrics = wf_varpipe.mark_duplicates_metrics
    File? snpEff_summary_targets  = wf_varpipe.snpEff_summary_targets
    File? snpEff_summary_full     = wf_varpipe.snpEff_summary_full
    File? qc_log = wf_varpipe.qc_log
    String? pipeline_date = wf_varpipe.pipeline_date
    Array[File]? depth_of_coverage_outputs = wf_varpipe.depth_of_coverage_outputs
    Array[File]? multiple_metrics_outputs  = wf_varpipe.multiple_metrics_outputs
    File? collect_wgs_output_metrics       = wf_varpipe.collect_wgs_output_metrics
    File? collect_targeted_pcr_metrics     = wf_varpipe.collect_targeted_pcr_metrics
    # output from fastq_screen
    File? fastq_screen_html   = wf_varpipe.fastq_screen_html
    File? fastq_screen_txt    = wf_varpipe.fastq_screen_txt
    File? fastq_screen_tagged = wf_varpipe.fastq_screen_tagged
    File? fastq_screen_tagged_filter = wf_varpipe.fastq_screen_tagged_filter
    # output from fastqc
    File forwardHtml = wf_varpipe.forwardHtml
    File reverseHtml = wf_varpipe.reverseHtml
    File forwardZip  = wf_varpipe.forwardZip
    File reverseZip  = wf_varpipe.reverseZip
    File forwardSummary = wf_varpipe.forwardSummary
    File reverseSummary = wf_varpipe.reverseSummary
    File forwardData    = wf_varpipe.forwardData
    File reverseData    = wf_varpipe.reverseData
    # output from fastqc after cleanup
    File? forwardHtml_cleaned = wf_varpipe.forwardHtml_cleaned
    File? reverseHtml_cleaned = wf_varpipe.reverseHtml_cleaned
    File? forwardZip_cleaned  = wf_varpipe.forwardZip_cleaned
    File? reverseZip_cleaned  = wf_varpipe.reverseZip_cleaned
    File? forwardData_cleaned = wf_varpipe.forwardData_cleaned
    File? reverseData_cleaned = wf_varpipe.reverseData_cleaned
    File? forwardSummary_cleaned = wf_varpipe.forwardSummary_cleaned
    File? reverseSummary_cleaned = wf_varpipe.reverseSummary_cleaned
    # output from bbduk
    File? adapter_stats = wf_varpipe.adapter_stats
    File? phiX_stats    = wf_varpipe.phiX_stats
    # output from clockwork decontamination
    File? clockwork_decontamination_stats = wf_varpipe.clockwork_decontamination_stats
    # output from delly
    File? dellyVcf = wf_varpipe.dellyVcf
    # variant interpretation
    File? interpretation_report = wf_varpipe.interpretation_report
    # multiqc
    File? multiqc_report = wf_varpipe.multiqc_report
  }
}
