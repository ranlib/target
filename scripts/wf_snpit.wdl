version 1.0

import "./task_snpit.wdl" as snpit

workflow wf_snpit {
  input {
    File vcf
    String docker = "valleema/snpit:1.1"
  }

  call snpit.task_snpit {
    input:
      vcf = vcf,
      docker = docker
  }

  output {
    File snpit_log = task_snpit.output_log
  }
}
