version 1.0

task task_depth_of_coverage {
  input {
    File bam
    File reference
    File intervals
    Int lower_coverage = 10
    Int min_base_quality = 20
    String outputPrefix = "depth_of_coverage"
  }
  
  command {
    set -xe
    samtools index ${bam}
    samtools faidx ${reference}
    gatk CreateSequenceDictionary --REFERENCE ${reference}
    gatk DepthOfCoverage \
    --input ${bam} \
    --reference ${reference} \
    --intervals ${intervals} \
    --output ${outputPrefix} \
    --min-base-quality ~{min_base_quality} \
    --summary-coverage-threshold 1 \
    --summary-coverage-threshold ${lower_coverage}
  }
  
  output {
    Array[File] outputs = glob("${outputPrefix}*")
  }

  runtime {
    docker: "broadinstitute/gatk:4.4.0.0"
  }
}