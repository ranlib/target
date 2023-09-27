version 1.0

task task_bwa {
  input {
    String samplename
    File r1fastq
    File r2fastq
    File reference
    Int threads
  }
  
  command <<<
    bwa index ~{reference}
    read_group="@RG\\tID:~{samplename}\\tSM:~{samplename}\\tPL:ILLUMINA"
    bwa mem -M -t ~{threads} -R ${read_group} -o ~{samplename}.sam ~{reference} ~{r1fastq} ~{r2fastq} 
  >>>

  output {
    File outsam = "${samplename}.sam"
  }

  runtime {
    docker: "staphb/bwa:0.7.17"
    cpu: threads
    memory: "16GB"
  }
}
