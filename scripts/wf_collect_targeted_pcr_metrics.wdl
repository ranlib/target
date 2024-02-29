version 1.0

import "./task_collect_targeted_pcr_metrics.wdl" as tpcrm
import "./task_mark_duplicates.wdl" as md

workflow wf_collect_targeted_pcr_metrics {
  input {
    File bam
    File reference
    File amplicon_bed
    File target_bed
  }

  call md.task_mark_duplicates {
    input:
    reference = reference,
    bam = bam
  }


  call tpcrm.task_collect_targeted_pcr_metrics {
    input:
    bam = task_mark_duplicates.output_marked_bam,
    reference = reference,
    amplicon_bed = amplicon_bed,
    target_bed = target_bed
  }
  
  output {
    File? output_metrics = task_collect_targeted_pcr_metrics.metrics
    File? target_coverage = task_collect_targeted_pcr_metrics.target_coverage
    File? sensitivity_metrics = task_collect_targeted_pcr_metrics.collectMetricsSensitivity
    File output_marked_bam = task_mark_duplicates.output_marked_bam
    File output_marked_metrics_txt = task_mark_duplicates.output_marked_metrics_txt
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Collect targeted PCR QC metrics"
  }

  parameter_meta {
    ## inputs
    bam: {description: "Input bam alignemnt file.", category: "required"}
    reference: {description: "Reference genome", category: "required"}
    amplicon_bed: {description: "Input bed file with amplicon regions", category: "required"}
    target_bed: {description: "Input bed file with regions to check", category: "required"}
    ## output
    output_metrics: {description: "Output text file with QC metrics."}
    target_coverage: {description: "Output text file target coverage."}
    sensitivity_metrics: {description: "Output text file with sensitivity metrics."}
    output_marked_bam: {description: "Output bam file with duplicate reads marked."}
    output_marked_metrics_txt: {description: "Output text file with metrics from bam file with duplicates marked."}
  }

}
