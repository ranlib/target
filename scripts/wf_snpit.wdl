version 1.0

import "./task_snpit.wdl" as snpit

workflow wf_snpit {
  input {
    Array[File]+ vcfs
    String docker = "valleema/snpit:1.1"
  }

  scatter (vcf in vcfs) {
    call snpit.task_snpit {
      input:
      vcf = vcf,
      docker = docker
    }
  }
  
  output {
    Array[File] snpit_log = task_snpit.output_log
  }
}
