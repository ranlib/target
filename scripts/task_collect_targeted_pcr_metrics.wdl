version 1.0

task task_collect_targeted_pcr_metrics {
  input {
    File bam
    File reference
    File amplicon_bed
    File target_bed
    String outputMetrics = "collect_targeted_pcr_metrics.txt"
    String sensitivityFile = "collect_targeted_pcr_sensitivity_metrics.txt"
    String docker = "broadinstitute/gatk:4.4.0.0"
    Int minMappingQuality = 20
    Int minBaseQuality = 20
    Int coverage_cap = 250
    Int sample_size = 10000
    Boolean clip_overlapping_reads = true
  }

  String amplicon_intervals = if defined(amplicon_bed) then "amplicon.intervals" else ""
  String target_intervals = if defined(target_bed) then "target.intervals" else ""
  #--ALLELE_FRACTION [0.001, 0.005, 0.01, 0.02, 0.05, 0.1, 0.2, 0.3, 0.5]
  
  command {
    samtools faidx ~{reference}
    
    gatk CreateSequenceDictionary \
    --REFERENCE ~{reference} \
    --OUTPUT "reference.dict"

    gatk BedToIntervalList \
    --INPUT ~{amplicon_bed} \
    --OUTPUT ~{amplicon_intervals} \
    --SEQUENCE_DICTIONARY "reference.dict"

    gatk BedToIntervalList \
    --INPUT ~{target_bed} \
    --OUTPUT ~{target_intervals} \
    --SEQUENCE_DICTIONARY "reference.dict"

    gatk CollectTargetedPcrMetrics \
    --INPUT ~{bam} \
    --OUTPUT ~{outputMetrics} \
    --REFERENCE_SEQUENCE ~{reference} \
    --CLIP_OVERLAPPING_READS ~{clip_overlapping_reads} \
    --COVERAGE_CAP ~{coverage_cap} \
    --SAMPLE_SIZE ~{sample_size} \
    --MINIMUM_MAPPING_QUALITY ~{minMappingQuality} \
    --MINIMUM_BASE_QUALITY ~{minBaseQuality} \
    --THEORETICAL_SENSITIVITY_OUTPUT ~{sensitivityFile} \
    --AMPLICON_INTERVALS ~{amplicon_intervals} \
    --TARGET_INTERVALS ~{target_intervals}
  }
  
  output {
    File metrics = "${outputMetrics}"
    File collectMetricsSensitivity = "${sensitivityFile}"
  }
  
  runtime {
    docker: "~{docker}"
    memory: "8GB"
  }
}
