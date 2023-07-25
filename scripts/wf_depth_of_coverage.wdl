version 1.0

workflow wf_depth_of_coverage {
  input {
    File bam
    File bed
    File reference
    Int lowerCoverageThreshold
    String outputPrefix
  }

  call task_depth_of_coverage {
    input:
    bam = bam,
    reference = reference,
    intervals = bed,
    lower_coverage = lowerCoverageThreshold,
    outputPrefix = outputPrefix
  }

  output {
    Array[File] coverageOutputs = task_depth_of_coverage.outputs
  }

  meta {
    description: "A workflow to calculate Depth of Coverage using GATK's DepthOfCoverage tool."
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
  }
  parameter_meta {
    bam: {
      description: "Input BAM file.",
      category: "required"
    }
    reference: {
      description: "Reference genome file.",
      category: "required"
    }
    intervals: {
      description: "Interval file specifying the regions of interest.",
      category: "required"
    }
    lower_coverage: {
      description: "Summary coverage threshold to be used in the DepthOfCoverage task.",
      category: "required"
    }
    outputPrefix: {
      description: "Output prefix for the coverage analysis.",
      category: "required"
    }
  }

}

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
