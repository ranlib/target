version 1.0

task task_collect_multiple_metrics {
  input {
    File bam
    File reference
    String outputBasename = "multiple_metrics"
    String docker = "broadinstitute/gatk:4.4.0.0"
    String memory = "8GB"
  }

  command {
    gatk CollectMultipleMetrics \
    -I ${bam} \
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
    "${outputBasename}"+".base_distribution_by_cycle_metrics",
    "${outputBasename}"+".insert_size_metrics",
    "${outputBasename}"+".quality_by_cycle_metrics",
    "${outputBasename}"+".quality_distribution_metrics",
    "${outputBasename}"+".gc_bias.detail_metrics",
    "${outputBasename}"+".gc_bias.summary_metrics",
    "${outputBasename}"+".pre_adapter_detail_metrics",
    "${outputBasename}"+".pre_adapter_summary_metrics",
    "${outputBasename}"+".bait_bias_detail_metrics",
    "${outputBasename}"+".bait_bias_summary_metrics",
    "${outputBasename}"+".error_summary_metrics",
    "${outputBasename}"+".quality_yield_metrics"
    ]
  }
  
  runtime {
    docker: docker
    memory: memory
  }
}

