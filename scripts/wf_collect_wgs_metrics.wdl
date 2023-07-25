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
}
