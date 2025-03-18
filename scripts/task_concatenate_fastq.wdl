version 1.0

task task_concatenate_fastq {
  input {
    Array[File]+ forwardFastqFiles
    Array[File]+ reverseFastqFiles
    String outputForward
    String outputReverse
  }

  command {
    cat ${sep=' ' forwardFastqFiles} > ${outputForward}
    cat ${sep=' ' reverseFastqFiles} > ${outputReverse}
  }

  output {
    File concatenatedForwardFastq = "${outputForward}"
    File concatenatedReverseFastq = "${outputReverse}"
  }

  runtime {
    docker: "ubuntu:24.04"
  }
}
