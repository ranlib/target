version 1.0

task task_lineage {
  input {
    File input_annotation
    File lineage_markers
    String lineages_tsv
    String samplename
    String docker = "dbest/lineage:v1.0.0"
  }

  command {
    lineage_parser.py \
      ${input_annotation} \
      ${lineage_markers} \
      ${lineages_tsv} \
      ${samplename}
  }

  output {
    File lineage = lineages_tsv
  }

  runtime {
    docker: docker
  }
}
