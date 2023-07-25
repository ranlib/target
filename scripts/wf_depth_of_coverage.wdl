version 1.0

import "./task_depth_of_coverage.wdl" as doc

workflow wf_depth_of_coverage {
  input {
    File bam
    File bed
    File reference
    Int lowerCoverageThreshold
    String outputPrefix
  }

  call doc.task_depth_of_coverage {
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
