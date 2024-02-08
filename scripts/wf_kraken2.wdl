version 1.0

import "./task_kraken2.wdl" as kraken

workflow wf_kraken2 {
  input {
    File read1
    File read2
    String samplename
    Array[File]+ indexFiles
    Int disk_size= 100
    Int disk_multiplier = 20
    Int threads = 1
    String memory = "250GB"
  }

  Int dynamic_disk_size = disk_multiplier*ceil(size(read1, "GiB"))
  Int disk_size_gb = select_first([disk_size, dynamic_disk_size])

  call kraken.task_kraken2 {
    input:
    read1 = read1,
    read2 = read2,
    samplename = samplename,
    threads = threads,
    memory = memory,
    indexFiles = indexFiles,
    disk_size = disk_size_gb
  }

  output {
    File? krakenReport = task_kraken2.krakenReport
    File? krakenOutput = task_kraken2.krakenOutput
    Array[File] unclassified = task_kraken2.unclassified
    Array[File] classified = task_kraken2.classified
  }
}
