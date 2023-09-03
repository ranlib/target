version 1.0

import "./task_lineage.wdl" as l

workflow wf_lineage {
  input {
    File vcf
    File lineage_markers
    String samplename
    String lineage_report_name
  }

  call l.task_lineage {
    input:
      vcf = vcf,
      lineage_markers = lineage_markers,
      samplename = samplename,
      lineage_report_name = lineage_report_name
  }

  output {
    File lineage_report = task_lineage.lineage_report
  }
}
