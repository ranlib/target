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

task task_kreport {
  input {
    File classificationTSV
    Array[File]+ indexFiles
    String samplename
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
    centrifuge-kreport -x $PWD/${indexBasename} ~{classificationTSV} 2> ~{samplename}.centrifuge.classification.kraken_style.err 1> ~{samplename}.centrifuge.classification.kraken_style.tsv
  >>>
  output {
    File krakenStyleTSV = "${samplename}.centrifuge.classification.kraken_style.tsv"
  }
  runtime {
    docker: docker
    memory: memory
    disks: "local-disk " + disk_size + " SSD"
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
    Int disk_size= 100
    Int disk_multiplier = 20
  }
  
  Int dynamic_disk_size = disk_multiplier*ceil(size(R1, "GiB"))
  Int disk_size_gb = select_first([disk_size, dynamic_disk_size])

  call task_centrifuge {
    input:
    R1 = R1,
    R2 = R2,
    samplename = samplename,
    threads = threads,
    memory = memory,
    disk_size = disk_size_gb,
    indexFiles = indexFiles
  }
  
  call task_kreport {
    input:
    classificationTSV = task_centrifuge.classificationTSV,
    samplename = samplename,
    memory = memory,
    disk_size = disk_size_gb,
    indexFiles = indexFiles
  }
  
  output {
    File classificationTSV = task_centrifuge.classificationTSV
    File summaryReportTSV = task_centrifuge.summaryReportTSV
    File krakenStyleTSV = task_kreport.krakenStyleTSV
  }
}
