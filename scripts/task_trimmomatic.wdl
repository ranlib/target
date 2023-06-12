version 1.0

task trimmomatic {
  input {
    File        read1
    File        read2
    String      samplename
    String      docker="staphb/trimmomatic:0.39"
    Int?        trimmomatic_minlen = 15
    Int?        trimmomatic_window_size=4
    Int?        trimmomatic_quality_trim_score=30
    Int?        cpus = 4
    String?     memory = "8 GB"
  }

  command <<<
    # date and version control
    date | tee DATE
    trimmomatic -version > VERSION && sed -i -e 's/^/Trimmomatic /' VERSION

    trimmomatic PE \
    -threads ~{cpus} \
    ~{read1} ~{read2} \
    -baseout ~{samplename}.fastq.gz \
    SLIDINGWINDOW:~{trimmomatic_window_size}:~{trimmomatic_quality_trim_score} \
    MINLEN:~{trimmomatic_minlen} > ~{samplename}.trim.stats.txt

  >>>

  output {
    File       read1_trimmed = "${samplename}_1P.fastq.gz"
    File          read2_trimmed = "${samplename}_2P.fastq.gz"
    File       trimmomatic_stats = "${samplename}.trim.stats.txt"
    String     version = read_string("VERSION")
    String     pipeline_date = read_string("DATE")
  }

  runtime {
      docker:       "~{docker}"
      memory:       "~{memory}"
      cpu:          cpus
      disks:        "local-disk 100 SSD"
      preemptible:  0
  }
}
