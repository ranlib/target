version 1.0

import "./task_bbduk.wdl" as bbduk

workflow wf_bbduk {
  input {
    File forwardReads
    File reverseReads
    File? contamination
    String samplename
    String memory = "2GB"
    String docker = "staphb/bbtools:39.01"
    Int cpu = 4
  }

  call bbduk.task_bbduk {
    input:
    read1_trimmed = forwardReads,
    read2_trimmed = reverseReads,
    contamination = contamination,
    samplename = samplename,
    docker = docker,
    memory = memory,
    cpu = cpu
  }

  output {
    File read1_clean = task_bbduk.read1_clean
    File read2_clean = task_bbduk.read1_clean
    File adapter_stats = task_bbduk.adapter_stats
    File phiX_stats = task_bbduk.phiX_stats
    String bbduk_docker  = task_bbduk.bbduk_docker
    String pipeline_date = task_bbduk.pipeline_date
  }
}
