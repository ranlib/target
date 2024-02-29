version 1.0

import "./task_concatenate_fastq.wdl" as concatenate_fastq

workflow wf_concatenate_fastq {
  input {
    Array[File]+ forwardFastqFiles
    Array[File]+ reverseFastqFiles
    String outputForward
    String outputReverse
  }

  call concatenate_fastq.task_concatenate_fastq {
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

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Concatenate fastq files"
  }

  parameter_meta {
    # inputs
    forwardFastqFiles: {description: "List of fastq files with forward reads.", category: "required"}
    reverseFastqFiles: {description: "List of fastq files with reverse reads.", category: "required"}
    # outputs
    outputForward: {description: "Output fastq file with forward reads."}
    outputReverse: {description: "Output fastq file with reverse reads."}
  }
}
