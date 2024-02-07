version 1.0

task task_centrifuge {
  input {
    File R1
    File R2
    Array[File]+ indexFiles
    String samplename
    Int threads = 1
    String docker = "dbest/centrifuge:v1.0.4"
    String memory = "20GB"
    Int disk_size = 100
  }

  command <<<
    set -x
    indexBasename="$(basename ~{sub(indexFiles[0], "\.[0-9]\.cf", "")})"
    for file in ~{sep=" " indexFiles}
    do
       ln -s ${file} $PWD/"$(basename ${file})"
    done
    centrifuge -x $PWD/${indexBasename} --threads ~{threads} -1 ~{R1} -2 ~{R2} --report-file ~{samplename}.centrifuge.summary.report.tsv -S ~{samplename}.centrifuge.classification.tsv
    (head -n1 ~{samplename}.centrifuge.summary.report.tsv ; tail -n+2 ~{samplename}.centrifuge.summary.report.tsv | sort -t $'\t' -r -g -k7 ) > ~{samplename}.centrifuge.summary.report.sorted.tsv
  >>>

  output {
    File classificationTSV = "${samplename}.centrifuge.classification.tsv"
    File summaryReportTSV = "${samplename}.centrifuge.summary.report.sorted.tsv"
  }

  runtime {
    docker: docker
    cpu: threads
    memory: memory
    disks: "local-disk " + disk_size + " SSD"
  }
}

