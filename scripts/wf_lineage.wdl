version 1.0

import "./task_lineage.wdl" as l

workflow wf_lineage {
  input {
    File input_annotation
    File lineage_markers
    String lineage_report_name
    String samplename
  }

  call l.task_lineage {
    input:
      input_annotation = input_annotation,
      lineage_markers = lineage_markers,
      lineage_report_name = lineage_report_name,
      samplename = samplename
  }

  output {
    File lineage_report = task_lineage.lineage_report
  }
}
