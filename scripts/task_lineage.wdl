version 1.0

task task_lineage {
  input {
    File input_annotation
    File lineage_markers
    String lineage_report
    String samplename
    String docker = "dbest/lineage:v1.0.0"
  }

  command {
    lineage_parser.py \
      ${input_annotation} \
      ${lineage_markers} \
      ${lineage_report} \
      ${samplename}
  }

  output {
    File lineage = lineage_report
  }

  runtime {
    docker: docker
  }
}
