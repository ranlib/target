version 1.0

import "./task_RunCollectMultipleMetrics.wdl" as RunCollectMultipleMetrics

workflow RunCollectMultipleMetricsWorkflow {
  input {
    File inputBam
    File reference
    String outputBasename
  }

  call RunCollectMultipleMetrics.RunCollectMultipleMetrics {
    input:
      inputBam = inputBam,
      reference = reference,
      outputBasename = outputBasename
    }

    output {
      Array[File] collectMetricsOutput = RunCollectMultipleMetrics.collectMetricsOutput
    }
}
