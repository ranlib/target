version 1.0

task task_fastqc {
  input {
    File forwardReads
    File reverseReads
    String outdirPath = "."
    Int threads = 1
    Boolean extract = true
    File? noneFile
  }

  String forwardName = sub(basename(forwardReads),".f.*q.*$","")
  String reverseName = sub(basename(reverseReads),".f.*q.*$","")
  String forwardBasename = outdirPath + "/" + forwardName + "_fastqc"
  String reverseBasename = outdirPath + "/" + reverseName + "_fastqc"
  
  command {
    fastqc ${forwardReads} ${reverseReads} --outdir ${outdirPath} ~{true="--extract" false="" extract} -t ${threads} 
  }

  output {
    File forwardHtml = forwardBasename + ".html"
    File reverseHtml = reverseBasename + ".html"
    File forwardZip = forwardBasename + ".zip"
    File reverseZip = reverseBasename + ".zip"
    File? forwardSummary = if extract then forwardBasename + "/summary.txt" else noneFile
    File? reverseSummary = if extract then reverseBasename + "/summary.txt" else noneFile
    File? forwardData = if extract then forwardBasename + "/fastqc_data.txt" else noneFile
    File? reverseData = if extract then reverseBasename + "/fastqc_data.txt" else noneFile
  }
  
  runtime {
    docker: "staphb/fastqc"
    cpu: threads
  }
  
}


