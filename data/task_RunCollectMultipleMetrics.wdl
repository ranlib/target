version 1.0

task RunCollectMultipleMetrics {
  input {
    File inputBam
    File reference
    String outputBasename = "multiple_metrics"
  }

  command {
    gatk CollectMultipleMetrics \
    -I ${inputBam} \
    -R ${reference} \
    -O ${outputBasename} \
    --PROGRAM CollectAlignmentSummaryMetrics \
    --PROGRAM CollectInsertSizeMetrics \
    --PROGRAM QualityScoreDistribution \
    --PROGRAM MeanQualityByCycle \
    --PROGRAM CollectBaseDistributionByCycle \
    --PROGRAM CollectGcBiasMetrics \
    --PROGRAM CollectSequencingArtifactMetrics \
    --PROGRAM CollectQualityYieldMetrics
  }

  output {
    Array[File] collectMetricsOutput = [
    "${outputBasename}"+".insert_size_metrics",
    "${outputBasename}"+".alignment_summary_metrics",
    "${outputBasename}"+".read_length_histogram.pdf",
    "${outputBasename}"+".base_distribution_by_cycle_metrics",
    "${outputBasename}"+".base_distribution_by_cycle.pdf",
    "${outputBasename}"+".insert_size_metrics",
    "${outputBasename}"+".insert_size_histogram.pdf",
    "${outputBasename}"+".quality_by_cycle_metrics",
    "${outputBasename}"+".quality_by_cycle.pdf",
    "${outputBasename}"+".quality_distribution_metrics",
    "${outputBasename}"+".quality_distribution.pdf",
    "${outputBasename}"+".gc_bias.detail_metrics",
    "${outputBasename}"+".gc_bias.summary_metrics",
    "${outputBasename}"+".gc_bias.pdf",
    "${outputBasename}"+".pre_adapter_detail_metrics",
    "${outputBasename}"+".pre_adapter_summary_metrics",
    "${outputBasename}"+".bait_bias_detail_metrics",
    "${outputBasename}"+".bait_bias_summary_metrics",
    "${outputBasename}"+".error_summary_metrics",
    "${outputBasename}"+".quality_yield_metrics"
    ]
  }
  
  runtime {
    docker: "broadinstitute/gatk:latest"
  }
}

