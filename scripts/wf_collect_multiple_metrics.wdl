version 1.0

import "./task_collect_multiple_metrics.wdl" as bamQC

workflow RunCollectMultipleMetricsWorkflow {
  input {
    File inputBam
    File reference
    String outputBasename
  }

  call bamQC.RunCollectMultipleMetrics {
    input:
      inputBam = inputBam,
      reference = reference,
      outputBasename = outputBasename
    }

    output {
      Array[File] collectMetricsOutput = RunCollectMultipleMetrics.collectMetricsOutput
    }
}
