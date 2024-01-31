version 1.0

task task_centrifuge {
  input {
    File R1
    File R2
    Array[File]+ indexFiles
    String samplename
    Int threads
    String docker = "dbest/centrifuge:v1.0.4"
    String memory = "20GB"
  }
  command <<<
    set -x
    indexBasename="$(basename ~{sub(indexFiles[0], "\.[0-9]\.cf", "")})"
    for file in ~{sep=" " indexFiles}
    do
       ln -s ${file} $PWD/"$(basename ${file})"
    done
    centrifuge -x $PWD/${indexBasename} --threads ~{threads} -1 ~{R1} -2 ~{R2} --report-file ~{samplename}.centrifuge.summary.report.tsv -S ~{samplename}.centrifuge.classification.tsv
  >>>
  output {
    File classificationTSV = "${samplename}.centrifuge.classification.tsv"
    File summaryReportTSV = "${samplename}.centrifuge.summary.report.tsv"
  }
  runtime {
    docker: docker
    cpu: threads
    memory: memory
  }
}

task task_kreport {
  input {
    File classificationTSV
    Array[File]+ indexFiles
    String samplename
    String docker = "dbest/centrifuge:v1.0.4"
    String memory = "20GB"
  }
  command <<<
    set -x
    indexBasename="$(basename ~{sub(indexFiles[0], "\.[0-9]\.cf", "")})"
    for file in ~{sep=" " indexFiles}
    do
       ln -s ${file} $PWD/"$(basename ${file})"
    done
    centrifuge-kreport -x $PWD/${indexBasename} ~{classificationTSV} > ~{samplename}.centrifuge.classification.kraken_style.tsv
  >>>
  output {
    File krakenStyleTSV = "${samplename}.centrifuge.classification.kraken_style.tsv"
  }
  runtime {
    docker: docker
    memory: memory
  }
}

workflow wf_centrifuge {
  input {
    File R1
    File R2
    String samplename
    Int threads
    Array[File]+ indexFiles
    String memory = "20GB"
  }
  
  call task_centrifuge {
    input:
    R1 = R1,
    R2 = R2,
    samplename = samplename,
    threads = threads,
    memory = memory,
    indexFiles = indexFiles
  }
  
  call task_kreport {
    input:
    classificationTSV = task_centrifuge.classificationTSV,
    samplename = samplename,
    memory = memory,
    indexFiles = indexFiles
  }
  
  output {
    File classificationTSV = task_centrifuge.classificationTSV
    File summaryReportTSV = task_centrifuge.summaryReportTSV
  }
}
