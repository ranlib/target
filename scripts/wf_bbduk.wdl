version 1.0

import "./task_bbduk.wdl" as bbduk

workflow wf_bbduk {
  input {
    File forwardReads
    File reverseReads
    String samplename
  }

  call bbduk.bbduk {
    input:
    read1_trimmed = forwardReads,
    read2_trimmed = reverseReads,
    samplename = samplename
  }

  output {
    File       read1_clean = bbduk.read1_clean
    File       read2_clean = bbduk.read1_clean
    File       adapter_stats = bbduk.adapter_stats
    File       phiX_stats = bbduk.phiX_stats
    String     bbduk_docker  = bbduk.bbduk_docker
    String     pipeline_date = bbduk.pipeline_date
  }
}
