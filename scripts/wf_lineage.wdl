version 1.0

import "./task_lineage.wdl" as l

workflow wf_lineage {
  input {
    File input_annotation
    File lineage_markers
    String lineage_report
    String samplename
  }

  call l.task_lineage {
    input:
      input_annotation = input_annotation,
      lineage_markers = lineage_markers,
      lineage_report = lineage_report,
      samplename = samplename
  }

  output {
    File lineage = task_lineage.lineage
  }
}
