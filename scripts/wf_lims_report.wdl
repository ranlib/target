version 1.0

import "./task_lims_report.wdl" as lr

workflow wf_lims_report {
  input {
    File lab_report
    File? lineage_report
    File bed_file
    String lims_report_name
    String operator
  }

  call lr.task_lims_report {
    input:
      lab_report = lab_report,
      lims_report_name = lims_report_name,
      lineage_report = lineage_report,
      operator = operator,
      bed_file = bed_file
  }

  output {
    File lims_report = task_lims_report.lims_report
  }
}
