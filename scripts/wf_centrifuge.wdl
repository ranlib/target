version 1.0

import "./task_centrifuge.wdl" as task_centrifuge
import "./task_kreport.wdl" as task_kreport

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

  call task_centrifuge.task_centrifuge {
    input:
    R1 = R1,
    R2 = R2,
    samplename = samplename,
    threads = threads,
    memory = memory,
    disk_size = disk_size_gb,
    indexFiles = indexFiles
  }
  
  call task_kreport.task_kreport {
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
