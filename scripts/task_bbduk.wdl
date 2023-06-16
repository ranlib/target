version 1.0

task bbduk {
  input {
    File        read1_trimmed
    File        read2_trimmed
    String      samplename
    String      docker="staphb/bbtools:38.76"
    Int?        cpus = 4
    String?     memory = "250 GB"
  }
  
  command <<<
    date | tee DATE
    
    repair.sh in1=~{read1_trimmed} in2=~{read2_trimmed} out1=~{samplename}.paired_1.fastq.gz out2=~{samplename}.paired_2.fastq.gz
    
    bbduk.sh in1=~{samplename}.paired_1.fastq.gz in2=~{samplename}.paired_2.fastq.gz out1=~{samplename}.rmadpt_1.fastq.gz out2=~{samplename}.rmadpt_2.fastq.gz ref=/bbmap/resources/adapters.fa stats=~{samplename}.adapters.stats.txt ktrim=r k=23 mink=11 hdist=1 tpe tbo

    bbduk.sh in1=~{samplename}.rmadpt_1.fastq.gz in2=~{samplename}.rmadpt_2.fastq.gz out1=~{samplename}_1.clean.fastq.gz out2=~{samplename}_2.clean.fastq.gz outm=~{samplename}.matched_phix.fq ref=/bbmap/resources/phix174_ill.ref.fa.gz k=31 hdist=1 stats=~{samplename}.phix.stats.txt

  >>>

  output {
    File       read1_clean = "${samplename}_1.clean.fastq.gz"
    File       read2_clean = "${samplename}_2.clean.fastq.gz"
    File       adapter_stats = "${samplename}.adapters.stats.txt"
    File       phiX_stats = "${samplename}.phix.stats.txt"
    String     bbduk_docker   = docker
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
