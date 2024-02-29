version 1.0

import "./task_lims_report.wdl" as lr

workflow wf_lims_report {
  input {
    File lab_report
    File? lineage_report
    String lims_report_name
    String operator
  }

  call lr.task_lims_report {
    input:
      lab_report = lab_report,
      lims_report_name = lims_report_name,
      lineage_report = lineage_report,
      operator = operator
  }

  output {
    File lims_report = task_lims_report.lims_report
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## LIMS report"
  }

  parameter_meta {
    ## inputs
    lab_report: {description: "Input laboratorian csv report", category: "required"}
    lineage_report: {description: "Input lineage report", category: "optional"}
    lims_report_name: {description: "Name for output LIMS report csv file", category: "required"}
    ## output
    lims_report: {description: "Output csv LIMS report"}
  }

}
