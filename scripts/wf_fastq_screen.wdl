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
  }
}
