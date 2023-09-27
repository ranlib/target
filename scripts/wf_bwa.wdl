version 1.0

import "./task_bwa.wdl" as bwa
import "./task_sortSam.wdl" as sort_sam

workflow wf_bwa {
  input {
    String samplename
    File r1fastq
    File r2fastq
    File reference
    Int threads
  }
  
  call bwa.task_bwa {
    input:
    samplename = samplename,
    r1fastq = r1fastq,
    r2fastq = r2fastq,
    reference = reference,
    threads = threads
  }
  
  call sort_sam.task_sortSam {
    input:
    samplename = samplename,
    insam = task_bwa.outsam
  }

  output {
    File outbam = task_sortSam.outbam
    File outbamidx = task_sortSam.outbamidx
  }
  
}
