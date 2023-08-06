version 1.0

task task_fastq_screen {
  input {
    File reads
    File configuration
    File contaminants
    Int threads = 1
    String aligner = "bwa"
    String memory = "10GB"
    String docker = "dbest/fastq_screen:v0.15.3"
  }
  
  command <<<
    set -ex
    tar -xvf ~{contaminants}
    fastq_screen --force --threads ~{threads} --outdir . --aligner ~{aligner} --conf ~{configuration} ~{reads}
  >>>
  
  output {
    File html = sub(sub(basename(reads),".fastq.gz","_screen.html"),".fq.gz","_screen.html")
    #File png = sub(sub(basename(reads),".fastq.gz","_screen.png"),".fq.gz","_screen.png")
    File txt = sub(sub(basename(reads),".fastq.gz","_screen.txt"),".fq.gz","_screen.txt")
  }

  runtime {
    docker: docker
    memory: memory
  }
}
