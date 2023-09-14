version 1.0

task task_fast_lineage_caller {
  input {
    File input_vcf
    String output_filename
    String docker = "dbest/fast_lineage_caller:v1.0.0"
  }

  command <<<
    fast-lineage-caller ~{input_vcf} --out ~{output_filename}
    tail -1 ~{output_filename} | cut -f 4 > lipworth2019
  >>>

  output {
    File results_tsv = output_filename
    String lineage_type = read_string("lipworth2019")
  }

  runtime {
    docker: docker
  }
}
