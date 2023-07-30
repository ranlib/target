version 1.0

workflow wf_bwa {
  input {
    String samplename
    File r1fastq
    File r2fastq
    File reference
    Int threads
  }
  
  call task_bwa {
    input:
    samplename = samplename,
    r1fastq = r1fastq,
    r2fastq = r2fastq,
    reference = reference,
    threads = threads
  }
  
  call task_sortSam {
    input:
    samplename = samplename,
    insam = task_bwa.outsam
  }

  output {
    File outbam = task_sortSam.outbam
    File outbamidx = task_sortSam.outbamidx
  }
  
}

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


task task_sortSam {
  input {
    String samplename
    File insam
  }
  
  command <<<
    gatk SortSam \
    --INPUT ~{insam} \
    --OUTPUT ~{samplename}.sorted.bam \
    --SORT_ORDER coordinate \
    --CREATE_INDEX true
  >>>

  output {
    File outbam = "${samplename}.sorted.bam"
    File outbamidx = "${samplename}.sorted.bai"
  }

  runtime {
    docker: "broadinstitute/gatk:4.4.0.0"
    memory: "16GB"
  }
}
