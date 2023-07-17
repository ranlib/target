version 1.0

import "./task_collect_multiple_metrics.wdl" as bamQC

workflow wf_collect_multiple_metrics {
  input {
    File inputBam
    File reference
  }

  call bamQC.task_collect_multiple_metrics {
    input:
      inputBam = inputBam,
      reference = reference
    }

    output {
      Array[File] collectMetricsOutput = task_collect_multiple_metrics.collectMetricsOutput
    }
}
