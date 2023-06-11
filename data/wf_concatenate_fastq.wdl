workflow ConcatenateFastQPairs {
  input {
    Array[File] forwardFastqFiles
    Array[File] reverseFastqFiles
    File outputForward
    File outputReverse
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
    File outputForward
    File outputReverse
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
