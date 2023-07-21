version 1.0

import "./task_collect_wgs_metrics.wdl" as wgs_metrics

workflow wf_collect_wgs_metrics {
  input {
    File inputBam
    File reference
    String outputFile
    Int? minMappingQuality
    Int? minBaseQuality
  }

  call wgs_metrics.task_collect_wgs_metrics {
    input:
      inputBam = inputBam,
      reference = reference,
      outputFile = outputFile,
      minMappingQuality = minMappingQuality,
      minBaseQuality = minBaseQuality
    }

    output {
      File collectMetricsOutput =task_collect_wgs_metrics.collectMetricsOutput
    }
}
