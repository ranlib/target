version 1.0

task task_lims_report {
  input {
    File lab_tsv
    File? lineages_tsv
    File bed_file
    String lims_tsv
    String operator
    String docker = "dbest/lims_report:v1.0.0"
  }

  command <<<
    set -x

    LINEAGE=""
    if ~{defined(lineages_tsv)} ; then
    LINEAGE="--lineages ~{lineages_tsv}"
    fi

    lims_report.py \
    --lab ~{lab_tsv} --operator ~{operator} --bed ~{bed_file} ${LINEAGE} \
    --lims ~{lims_tsv}
  >>>

  output {
    File lims_report = lims_tsv
  }

  runtime {
    docker: docker
  }
}
