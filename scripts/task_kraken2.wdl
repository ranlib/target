version 1.0

task task_kraken2 {
  input {
    File read1
    File read2
    Array[File]+ indexFiles
    String samplename
    String docker = "staphb/kraken2:latest"
    String memory = "250GB"
    Int threads = 1
    Int disk_size= 100
  }

  command <<<
    set -u
    set -x
    mkdir -p ${PWD}/kraken
    for file in ~{sep=" " indexFiles}
    do
       cp ${file} ${PWD}/kraken/"$(basename ${file})"
    done
    kraken2 \
    --db ${PWD}/kraken \
    --threads ~{threads} \
    --output ~{samplename}.kraken.output \
    --report ~{samplename}.kraken.report \
    --unclassified-out ~{samplename}.unclassified#.fq \
    --classified-out ~{samplename}.classified#.fq \
    --paired ~{basename(read1)} ~{basename(read2)} 
  >>>

  output {
    File? krakenReport = "${samplename}.kraken.report"
    File? krakenOutput = "${samplename}.kraken.output"
    Array[File] unclassified = glob("${samplename}.unclassified*")
    Array[File] classified = glob("${samplename}.classified*")
  }

  runtime {
    docker: docker
    memory: memory
    disks: "local-disk " + disk_size + " SSD"
  }
}

