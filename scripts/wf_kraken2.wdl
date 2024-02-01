version 1.0

task task_kraken2 {
  input {
    File R1
    File R2
    String samplename
    String docker = "staphb/kraken2:latest"
    String memory = "64GB"
    Int threads
  }
  command <<<
    export KRAKEN2_DB_PATH=/data/kraken2
    kraken2 \
    -db k2_standard_20230314 \
    --threads ~{threads} \
    --report ~{samplename}.kraken.report \
    --gzip-compressed \
    --unclassified-out ~{samplename}.unclassified#.fq \
    --classified-out ~{samplename}.classified#.fq \
    --output ~{samplename}.Kraken.out \
    --paired ~{basename(R1)} ~{basename(R2)} 
  >>>
  output {
    File krakenReport = "${samplename}.kraken.report"
    Array[File] unclassified = glob("${samplename}.unclassified*")
    Array[File] classified = glob("${samplename}.classified*")
    File krakenOut = "${samplename}.Kraken.out"
  }
  runtime {
    docker: docker
    memory: memory
  }
}

workflow wf_kraken2 {
  input {
    File R1
    File R2
    String samplename
  }
  call task_kraken2 {
    input:
      R1 = R1,
      R2 = R2,
      samplename = samplename
  }
  output {
    File krakenReport = task_kraken2.krakenReport
    Array[File] unclassified = task_kraken2.unclassified
    Array[File] classified = task_kraken2.classified
    File krakenOut = task_kraken2.krakenOut
  }
}
