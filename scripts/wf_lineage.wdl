version 1.0

import "./task_lineage.wdl" as l

workflow wf_lineage {
  input {
    File input_annotation
    File lineage_markers
    String lineages_tsv
    String samplename
  }

  call l.task_lineage {
    input:
      input_annotation = input_annotation,
      lineage_markers = lineage_markers,
      lineages_tsv = lineages_tsv,
      samplename = samplename
  }

  output {
    File lineage = task_lineage.lineage
  }
}
