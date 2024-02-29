version 1.0

import "./task_collect_wgs_metrics.wdl" as wgs_metrics

workflow wf_collect_wgs_metrics {
  input {
    File reference
    File bam
    File? bed
  }
  
  call wgs_metrics.task_collect_wgs_metrics {
    input:
    reference = reference,
    bam = bam,
    bed = bed
  }
  
  output {
    File collectMetricsOutput = task_collect_wgs_metrics.collectMetricsOutput
    File collectMetricsSensitivity = task_collect_wgs_metrics.collectMetricsSensitivity
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Collect whole genome sequencing QC metrics"
  }

  parameter_meta {
    ## inputs
    bam: {description: "Input bam alignemnt file.", category: "required"}
    reference: {description: "Reference genome", category: "required"}
    bed: {description: "Input bed file with regions to check", category: "optional"}
    ## output
    collectMetricsOutput: {description: "Output text file with QC metrics."}
    collectMetricsSensitivity: {description: "Output text file with sensitivity metrics."}
  }

}
