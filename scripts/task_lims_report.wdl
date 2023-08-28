version 1.0

task task_lims_report {
  input {
    File lab_tsv
    File lineages_tsv
    File bed_file
    String lims_tsv
    String operator
  }

  command {
    lims_report.py \
      --lab ${lab_tsv} \
      --lims ${lims_tsv} \
      --operator ${operator} \
      --lineages ${lineages_tsv} \
      --bed ${bed_file}
  }

  output {
    File lims_report = lims_tsv
  }

  runtime {
    docker: "dbest/lims_report:v1.0.0"
  }
}
