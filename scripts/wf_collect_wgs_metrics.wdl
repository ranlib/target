version 1.0

task RunCollectWgsMetrics {
  input {
    File inputBam
    File reference
    String outputFile = "collect_wgs_metrics.txt"
    Int minMappingQuality = 20
    Int minBaseQuality = 20
  }

  command {
    gatk CollectWgsMetrics \
    -I ${inputBam} \
    -R ${reference} \
    -O ${outputFile} \
    -MQ ${minMappingQuality} \
    -Q ${minBaseQuality}
  }

  output {
    File collectMetricsOutput = "${outputFile}"
  }
  
  runtime {
    docker: "broadinstitute/gatk:latest"
  }
}

workflow RunCollectWgsMetricsWorkflow {
  input {
    File inputBam
    File reference
    String outputFile
    Int? minMappingQuality
    Int? minBaseQuality
  }

  call RunCollectWgsMetrics {
    input:
      inputBam = inputBam,
      reference = reference,
      outputFile = outputFile,
      minMappingQuality = minMappingQuality,
      minBaseQuality = minBaseQuality
    }

    output {
      File collectMetricsOutput = RunCollectWgsMetrics.collectMetricsOutput
    }
}
