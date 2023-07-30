version 1.0

workflow wf_bwa {
  input {
    String sample_name
    File r1fastq
    File r2fastq
    File reference
    Int threads
  }
  
  call task_bwa {
    input:
    sample_name = sample_name,
    r1fastq = r1fastq,
    r2fastq = r2fastq,
    reference = reference,
    threads = threads
  }
  
  call task_sortSam {
    input:
    sample_name = sample_name,
    insam = task_bwa.outsam
  }

  output {
    File outbam = task_sortSam.outbam
    File outbamidx = task_sortSam.outbamidx
  }
  
}

task task_bwa {
  input {
    String sample_name
    File r1fastq
    File r2fastq
    File reference
    Int threads
  }
  
  command <<<
    bwa index ~{reference}
    read_group="@RG\\tID:~{sample_name}\\tSM:~{sample_name}\\tPL:ILLUMINA"
    bwa mem -M -t ~{threads} -R ${read_group} -o ~{sample_name}.sam ~{reference} ~{r1fastq} ~{r2fastq} 
  >>>

  output {
    File outsam = "${sample_name}.sam"
  }

  runtime {
    docker: "staphb/bwa:0.7.17"
    cpu: threads
    memory: "16GB"
  }

}


task task_sortSam {
  input {
    String sample_name
    File insam
  }
  
  command <<<
    gatk SortSam \
    --INPUT ~{insam} \
    --OUTPUT ~{sample_name}.sorted.bam \
    --SORT_ORDER coordinate \
    --CREATE_INDEX true
  >>>

  output {
    File outbam = "${sample_name}.sorted.bam"
    File outbamidx = "${sample_name}.sorted.bai"
  }

  runtime {
    docker: "broadinstitute/gatk:4.4.0.0"
    memory: "16GB"
  }
}
