version 1.0

task task_collect_hs_metrics {
  input {
    File bam
    File reference
    File bait_bed
    File target_bed
    String hs_metrics = "collect_hs_metrics.txt"
    String docker = "broadinstitute/gatk:4.6.1.0"
    String memory = "8GB"
  }

  String bait_intervals = if defined(bait_bed) then "bait.intervals" else ""
  String target_intervals = if defined(target_bed) then "target.intervals" else ""
  
  command {
    samtools faidx ~{reference}
    
    gatk CreateSequenceDictionary \
    --REFERENCE ~{reference} \
    --OUTPUT "reference.dict"

    gatk BedToIntervalList \
    --INPUT ~{bait_bed} \
    --OUTPUT ~{bait_intervals} \
    --SEQUENCE_DICTIONARY "reference.dict"

    gatk BedToIntervalList \
    --INPUT ~{target_bed} \
    --OUTPUT ~{target_intervals} \
    --SEQUENCE_DICTIONARY "reference.dict"

    gatk CollectHsMetrics \
    --INPUT ${bam} \
    --OUTPUT ${hs_metrics} \
    --REFERENCE_SEQUENCE ${reference} \
    --BAIT_INTERVALS ${bait_intervals} \
    --TARGET_INTERVALS ${target_intervals}
  }

  output {
    File collect_hs_metrics = "${hs_metrics}"
  }

  runtime {
    docker: docker
    memory: memory
  }
}
