version 1.0

task task_repair {
  input {
    File read1
    File read2
    String samplename
    String docker = "staphb/bbtools:39.01"
    String memory = "8GB"
  }

  String java_mem = "-Xmx" + sub(memory,"GB","g")
  String paired_out1 = "${samplename}_paired_1.fastq.gz"
  String paired_out2 = "${samplename}_paired_2.fastq.gz"
  String singletons  = "${samplename}_singletons.fastq.gz"
  
  command <<<
    set -ex
    repair.sh ~{java_mem} \
    in1=~{read1} \
    in2=~{read2} \
    out1=~{paired_out1} \
    out2=~{paired_out2} \
    outs=~{singletons}
  >>>

  output {
    File repaired_out1 = paired_out1 
    File repaired_out2 = paired_out2
    File repaired_singletons = singletons
  }

  runtime {
    docker: docker
    memory: memory
    maxRetries: 1
    preemptible: 0
  }
}
