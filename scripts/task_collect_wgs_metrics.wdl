version 1.0

task task_collect_wgs_metrics {
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
    docker: "broadinstitute/gatk:4.4.0.0"
  }
}

