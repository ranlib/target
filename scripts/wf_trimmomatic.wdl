version 1.0

import "./task_trimmomatic.wdl" as trimmomatic

workflow wf_trimmomatic {
  input {
    Array[File]+ read1_files
    Array[File]+ read2_files
    Array[String]+ samplenames
  }

  scatter ( indx in range(length(read1_files)) ) {
    call trimmomatic.task_trimmomatic {
      input:
        read1 = read1_files[indx],
        read2 = read2_files[indx],
        samplename = samplenames[indx]
    }
  }

  output {
    Array[File] read1_trimmed_files = task_trimmomatic.read1_trimmed
    Array[File] read2_trimmed_files = task_trimmomatic.read2_trimmed
    Array[File] stats_files = task_trimmomatic.trim_stats
    Array[File] log_files = task_trimmomatic.trim_log
    Array[String] versions = task_trimmomatic.version
    Array[String] pipeline_dates = task_trimmomatic.pipeline_date
  }
}
