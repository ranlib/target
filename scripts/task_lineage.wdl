version 1.0

task task_lineage {
  input {
    File input_annotation
    File lineage_markers
    String lineages_tsv
    String sample_id
  }

  command {
    lineage_parser.py \
      ${input_annotation} \
      ${lineage_markers} \
      ${lineages_tsv} \
      ${sample_id}
  }

  output {
    File lineage = lineages_tsv
  }

  runtime {
    docker: "dbest/lineage:v1.0.0"
  }
}
