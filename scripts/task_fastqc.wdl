version 1.0

task task_fastqc {
  input {
    File forwardReads
    File reverseReads
    Int threads = 1
    String docker = "staphb/fastqc:0.12.1"
  }

  String forwardName = sub(basename(forwardReads),".f.*q.*$","")
  String reverseName = sub(basename(reverseReads),".f.*q.*$","")
  
  command {
    fastqc ~{forwardReads} ~{reverseReads} --outdir "." --extract -t ~{threads}
  }

  output {
    File forwardHtml = forwardName + "_fastqc.html"
    File reverseHtml = reverseName + "_fastqc.html"
    File forwardZip = forwardName + "_fastqc.zip"
    File reverseZip = reverseName + "_fastqc.zip"
    File forwardData = forwardName + "_fastqc/fastqc_data.txt"
    File reverseData = reverseName + "_fastqc/fastqc_data.txt"
    File forwardSummary = forwardName + "_fastqc/summary.txt"
    File reverseSummary = reverseName + "_fastqc/summary.txt"
  }
  
  runtime {
    docker: "~{docker}"
    cpu: threads
  }
  
}


