version 1.0

task task_lineage {
  input {
    File input_annotation
    File lineage_markers
    String lineage_report_name
    String samplename
    String docker = "dbest/lineage:v1.0.0"
  }

  command {
    lineage_parser.py \
      ${input_annotation} \
      ${lineage_markers} \
      ${lineage_report_name} \
      ${samplename}
  }

  output {
    File lineage_report = lineage_report_name
  }

  runtime {
    docker: docker
  }
}
