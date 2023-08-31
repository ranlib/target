version 1.0

task task_lims_report {
  input {
    File lab_report
    File? lineage_report
    File bed_file
    String lims_report_name
    String operator
    String docker = "dbest/lims_report:v1.0.0"
  }

  command <<<
    set -x

    LINEAGE=""
    if ~{defined(lineage_report)} ; then
    LINEAGE="--lineages ~{lineage_report}"
    fi

    lims_report.py \
    --lab ~{lab_report} --operator ~{operator} --bed ~{bed_file} "${LINEAGE}" \
    --lims ~{lims_report_name}
  >>>

  output {
    File lims_report = lims_report_name
  }

  runtime {
    docker: docker
  }
}
