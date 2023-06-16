version 1.0

import "./task_fastqc.wdl" as task_fastqc

workflow wf_fastqc {
  input {
    File forwardReads
    File reverseReads
    Int threads = 1
  }

  call task_fastqc.task_fastqc {
    input:
    forwardReads = forwardReads,
    reverseReads = reverseReads,
    threads = threads
  }

  output {
    File forwardHtml = task_fastqc.forwardHtml
    File reverseHtml = task_fastqc.reverseHtml
    File forwardZip = task_fastqc.forwardZip
    File reverseZip = task_fastqc.reverseZip
    File forwardSummary = task_fastqc.forwardSummary
    File reverseSummary = task_fastqc.reverseSummary
    File forwardData = task_fastqc.forwardData
    File reverseData = task_fastqc.reverseData
    Int numberForwardReads = task_fastqc.numberForwardReads
    Int numberReverseReads = task_fastqc.numberForwardReads
  }
}
