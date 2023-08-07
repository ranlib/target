version 1.0

import "./task_bbduk.wdl" as bbduk

workflow wf_bbduk {
  input {
    File forwardReads
    File reverseReads
    File? contamination
    String samplename
  }

  call bbduk.task_bbduk {
    input:
    read1_trimmed = forwardReads,
    read2_trimmed = reverseReads,
    contamination = contamination,
    samplename = samplename
  }

  output {
    File read1_clean = task_bbduk.read1_clean
    File read2_clean = task_bbduk.read2_clean
    File? phiX_stats = task_bbduk.phiX_stats
    File? polyA_stats = task_bbduk.polyA_stats
    File? Ecoli_stats = task_bbduk.Ecoli_stats
    File? adapter_stats = task_bbduk.adapter_stats
    File? Covid19_stats = task_bbduk.Covid19_stats
    String pipeline_date = task_bbduk.pipeline_date
  }
}
