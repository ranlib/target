version 1.0

import "./task_repair.wdl" as repair

workflow wf_repair {
  input {
    File read1
    File read2
    String samplename
  }

  call repair.task_repair {
    input:
      read1 = read1,
      read2 = read2,
      samplename = samplename
  }

  output {
    File repaired_read1 = task_repair.repaired_out1
    File repaired_read2 = task_repair.repaired_out2
    File repaired_singletons = task_repair.repaired_singletons
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Repair reads in paired end fastq files"
  }

  parameter_meta {
    ## inputs
    read1: {description: "Input fastq file with forward reads", category: "required"}
    read2: {description: "Input fastq file with reverse reads", category: "required"}
    samplename: {description: "Sample name", category: "required"}
    ## output
    repaired_read1: {description: "Output fastq file with forward reads"}
    repaired_read2: {description: "Output fastq file with reverse reads"}
    repaired_singletons: {description: "Output fastq file with reads that could not be paired"}
  }

}
