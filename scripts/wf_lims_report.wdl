version 1.0

import "./task_lims_report.wdl" as lr

workflow wf_lims_report {
  input {
    File lab_tsv
    File? lineages_tsv
    File bed_file
    String lims_tsv
    String operator
  }

  call lr.task_lims_report {
    input:
      lab_tsv = lab_tsv,
      lims_tsv = lims_tsv,
      operator = operator,
      lineages_tsv = lineages_tsv,
      bed_file = bed_file
  }

  output {
    File lims_report = task_lims_report.lims_report
  }
}
