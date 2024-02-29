version 1.0

import "./task_fastq_screen.wdl" as fqs

workflow wf_fastq_screen {
  input {
    File reads
    File configuration
    File contaminants
  }
  
  call fqs.task_fastq_screen {
    input:
    reads = reads,
    configuration = configuration,
    contaminants = contaminants
  }

  output {
    File html = task_fastq_screen.html
    #File png = task_fastq_screen.png
    File txt = task_fastq_screen.txt
    File tagged = task_fastq_screen.tagged
    File tagged_filter = task_fastq_screen.tagged_filter
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## QC screen for fastq files"
  }

  parameter_meta {
    ## inputs
    reads: {description: "fastq file", category: "required"}
    contaminants: {description: "tsv file with adapter names in column 1 and sequences in column 2.", category: "optional"}
    configuration: {description: "configuration file.", category: "optional"}

    ## outputs
    html: {description: "output html file.", category: "optional"}
    txt: {description: "output in text format.", category: "optional"}
    tagged: {description: "output fastq file with reads tagged according to from which species they are coming from.", category: "optional"}
    tagged_filter: {description: "output fastq file with reads from genome 1 only", category: "optional"}
  }
}
