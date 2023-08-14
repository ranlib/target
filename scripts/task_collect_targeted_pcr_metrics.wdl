version 1.0

task task_collect_targeted_pcr_metrics {
  input {
    File bam
    File reference
    File amplicon_bed
    File target_bed
    String outputMetrics = "collect_targeted_pcr_metrics.txt"
    String sensitivityFile = "collect_targeted_pcr_sensitivity_metrics.txt"
    String target_coverage_file = "collect_targeted_pcr_target_coverage.txt"
    String docker = "broadinstitute/gatk:4.4.0.0"
    String memory = "8GB"
    Int minMappingQuality = 20
    Int minBaseQuality = 20
    Int coverage_cap = 250
    Int sample_size = 10000
    Boolean clip_overlapping_reads = true
  }

  #--ALLELE_FRACTION [0.001, 0.005, 0.01, 0.02, 0.05, 0.1, 0.2, 0.3, 0.5]
  
  command {
    samtools faidx ~{reference}
    
    gatk CreateSequenceDictionary \
    --REFERENCE ~{reference} \
    --OUTPUT "reference.dict"

    gatk BedToIntervalList \
    --INPUT ~{amplicon_bed} \
    --OUTPUT "amplicon.intervals" \
    --SEQUENCE_DICTIONARY "reference.dict"

    gatk BedToIntervalList \
    --INPUT ~{target_bed} \
    --OUTPUT "target.intervals" \
    --SEQUENCE_DICTIONARY "reference.dict"

    gatk CollectTargetedPcrMetrics \
    --INPUT ~{bam} \
    --REFERENCE_SEQUENCE ~{reference} \
    --CLIP_OVERLAPPING_READS ~{clip_overlapping_reads} \
    --COVERAGE_CAP ~{coverage_cap} \
    --SAMPLE_SIZE ~{sample_size} \
    --MINIMUM_MAPPING_QUALITY ~{minMappingQuality} \
    --MINIMUM_BASE_QUALITY ~{minBaseQuality} \
    --AMPLICON_INTERVALS "amplicon.intervals" \
    --TARGET_INTERVALS "target.intervals" \
    --OUTPUT ~{outputMetrics} \
    --THEORETICAL_SENSITIVITY_OUTPUT ~{sensitivityFile} \
    --PER_TARGET_COVERAGE  ~{target_coverage_file}
  }
  
  output {
    File? metrics = outputMetrics
    File? collectMetricsSensitivity = sensitivityFile
    File? target_coverage = target_coverage_file
  }
  
  runtime {
    docker: docker
    memory: memory
  }
}
