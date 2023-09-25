version 1.0

task task_snpit {
  input {
    File vcf
    String docker = "valleema/snpit:1.1"
  }

  command <<<
    snpit-run.py --input ~{vcf} > snpit.log
    head -1 snpit.log > species.log
    tail -1 snpit.log > lineage.log
  >>>

  output {
    File output_log = "snpit.log"
    Array[String] snpit_lines = read_lines("snpit.log")
    Array[String] snpit_species = read_lines("species.log")
    Array[Array[String]] snpit_lineage = read_tsv("lineage.log")
  }

  runtime {
    docker: docker
  }
}
