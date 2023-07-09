version 1.0

workflow bwa_mem {
  input {
    String sample_name
    File r1fastq
    File r2fastq
    File ref_fasta
    Int threads
  }
  
  call align {
    input:
    sample_name = sample_name,
    r1fastq = r1fastq,
    r2fastq = r2fastq,
    ref_fasta = ref_fasta,
    threads = threads
  }
  
  call sortSam {
    input:
    sample_name = sample_name,
    insam = align.outsam
  }

  output {
    File outbam = sortSam.outbam
    File outbamidx = sortSam.outbamidx
  }
  
}

task align {
  input {
    String sample_name
    File r1fastq
    File r2fastq
    File ref_fasta
    Int threads
  }
  
  command <<<
    bwa index ~{ref_fasta}
    read_group="@RG\\tID:~{sample_name}\\tSM:~{sample_name}\\tPL:ILLUMINA"
    bwa mem -M -t ~{threads} -R ${read_group} -o ~{sample_name}.sam ~{ref_fasta} ~{r1fastq} ~{r2fastq} 
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


task sortSam {
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
