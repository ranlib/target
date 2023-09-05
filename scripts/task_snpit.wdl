version 1.0

task task_snpit {
  input {
    File vcf
    String docker
  }

  command <<<
    snpit-run.py --input ~{vcf}
  >>>

  output {
    File output_log = stdout()
  }

  runtime {
    docker: docker
  }
}
