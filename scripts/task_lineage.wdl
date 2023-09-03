version 1.0

task task_lineage {
  input {
    File vcf
    File lineage_markers
    String samplename
    String lineage_report_name = "lineage.tsv"
    String docker = "dbest/lineage:v1.0.0"
  }

  command {
    get_lineage.py \
      --vcf ${vcf} \
      --lineages ${lineage_markers} \
      --samplename ${samplename} \
      --report  ${lineage_report_name}
  }

  output {
    File lineage_report = lineage_report_name
  }

  runtime {
    docker: docker
  }
}
