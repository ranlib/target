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
    Array[File] err_files = task_trimmomatic.trim_err
    Array[String] versions = task_trimmomatic.version
    Array[String] pipeline_dates = task_trimmomatic.pipeline_date
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Read base quality trimming"
  }

  parameter_meta {
    ## inputs
    read1_files: {description: "List of fastq files with forward reads.", category: "required"}
    read2_files: {description: "List of fastq files with reverse reads.", category: "required"}
    samplenames: {description: "List of sample names.", category: "required"}

    ## outputs
    read1_trimmed_files: {description: "List of trimmed output fastq file for forward reads."}
    read2_trimmed_files: {description: "List of trimmed output fastq file for reverse reads."}
    stats_files: {description: "List of text files with trimming statistics."}
    log_files: {description: "List of text files with trimming log."}
    err_files: {description: "List of text files with trimming error log."}
  }

}
