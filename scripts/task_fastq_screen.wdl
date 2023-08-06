version 1.0

task task_fastq_screen {
  input {
    File reads
    File configuration
    File contaminants
    Boolean nohits = true
    String aligner = "bwa"
    String memory = "10GB"
    String docker = "dbest/fastq_screen:v0.15.3"
    Int subset = 100000
    Int threads = 1
  }

  String samplename = sub(sub(basename(reads),".fastq.gz",""),".fq.gz","")
  
  command <<<
    set -ex
    tar -xvf ~{contaminants}
    fastq_screen --force --threads ~{threads} --outdir . --aligner ~{aligner} --conf ~{configuration} --subset ~{subset} --nohits ~{reads}
  >>>
  
  output {
    File html = samplename + "_screen.html"
    #File png = samplename + "_screen.png"
    File txt = samplename + "_screen.txt"
    File tagged = samplename + ".tagged.fastq.gz"
    File tagged_filter = samplename + ".tagged_filter.fastq.gz"
  }

  runtime {
    docker: docker
    memory: memory
  }
}
