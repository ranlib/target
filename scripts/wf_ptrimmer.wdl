version 1.0

import "./task_ptrimmer.wdl" as ptrimmer

workflow wf_ptrimmer {
  input {
    Boolean keep
    String seqtype
    File ampfile
    File read1
    File read2
    String trim1
    String trim2
    String summary = "Summary.ampcount"
    Int minqual
    Int kmer
    Int mismatch
  }
  
  call ptrimmer.task_ptrimmer {
    input:
    keep = keep,
    seqtype = seqtype,
    ampfile = ampfile,
    read1 = read1,
    trim1 = trim1,
    read2 = read2,
    trim2 = trim2,
    summary = summary,
    minqual = minqual,
    kmer = kmer,
    mismatch = mismatch
  }
  
  output {
    File trimmedRead1 = task_ptrimmer.trimmedRead1
    File trimmedRead2 =  task_ptrimmer.trimmedRead2
    File trimmingSummary =  task_ptrimmer.trimmingSummary
  }
}
