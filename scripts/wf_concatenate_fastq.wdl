version 1.0

import "./task_concatenate_fastq.wdl" as task_concatenate_fastq

workflow wf_concatenate_fastq {
  input {
    Array[File]+ forwardFastqFiles
    Array[File]+ reverseFastqFiles
    String outputForward
    String outputReverse
  }

  call task_concatenate_fastq.task_concatenate_fastq {
    input:
      forwardFastqFiles = forwardFastqFiles,
      reverseFastqFiles = reverseFastqFiles,
      outputForward = outputForward,
      outputReverse = outputReverse
  }

  output {
    File concatenatedForwardFastq = task_concatenate_fastq.concatenatedForwardFastq
    File concatenatedReverseFastq = task_concatenate_fastq.concatenatedReverseFastq
  }
}
