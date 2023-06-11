version 1.0

workflow ConcatenateFastQPairs {
  input {
    Array[File] forwardFastqFiles
    Array[File] reverseFastqFiles
    String outputForward
    String outputReverse
  }

  call concatenateFastQ {
    input:
      forwardFastqFiles = forwardFastqFiles,
      reverseFastqFiles = reverseFastqFiles,
      outputForward = outputForward,
      outputReverse = outputReverse
  }
}

task concatenateFastQ {
  input {
    Array[File] forwardFastqFiles
    Array[File] reverseFastqFiles
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
}
