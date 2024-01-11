version 1.0

task task_ptrimmer {
  input {
    Boolean keep
    String seqtype
    File ampfile
    File read1
    File read2
    String trim1
    String trim2
    String summary = "Summary.ampcount"
    Int minqual
    Int kmer
    Int mismatch
    String docker = "dbest/ptrimmer:v1.3.4"
  }
  
  String ptrim1 = sub(trim1,".gz","")
  String ptrim2 = sub(trim2,".gz","")

  command <<<
    set -x
    ptrimmer -l ~{keep} -t ~{seqtype} -a ~{ampfile} -f ~{read1} -d ~{ptrim1} -r ~{read2} -e ~{ptrim2} -s ~{summary} -q ~{minqual} -k ~{kmer} -m ~{mismatch}
    gzip ~{ptrim1} ~{ptrim2}
  >>>
    
  output {
    File trimmedRead1 = trim1
    File trimmedRead2 = trim2
    File trimmingSummary = summary
  }
    
  runtime {
    docker: docker
  }
}

