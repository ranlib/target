version 1.0

import "./task_snpit.wdl" as snpit

task summary {
  input {
    Array[Array[Array[String]]] lines
  }
  command {
    set -x
    echo ~{lines[0][0][2]}
  }
}

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

  call summary {
    input:
    lines = task_snpit.snpit_lineage
  }
  
  output {
    Array[File] snpit_log = task_snpit.output_log
    Array[Array[String]] snpit_lines_array = task_snpit.snpit_lines
    Array[Array[String]] snpit_species_array = task_snpit.snpit_species
    Array[Array[Array[String]]] snpit_lineage_array = task_snpit.snpit_lineage
  }
}
