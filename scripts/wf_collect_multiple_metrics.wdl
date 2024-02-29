version 1.0

import "./task_collect_multiple_metrics.wdl" as bamQC

workflow wf_collect_multiple_metrics {
  input {
    File bam
    File reference
  }
  
  call bamQC.task_collect_multiple_metrics {
    input:
    bam = bam,
    reference = reference
  }
  
  output {
    Array[File] collectMetricsOutput = task_collect_multiple_metrics.collectMetricsOutput
  }
  
  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Collect multiple QC metrics from bam alignment file"
  }

  parameter_meta {
    ## inputs
    bam: {description: "Input bam alignemnt file.", category: "required"}
    reference: {description: "Reference genome", category: "required"}
    ## output
    collectMetricsOutput: {description: "Output text file with QC metrics."}
  }
}
