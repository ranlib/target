version 1.0

task task_genbank_to_fasta {
  input {
    File genbankFile
  }
  command {
    genbank2fasta.py -i ~{genbankFile} -o .
  }
  output {
    File fastaFile = sub(basename(genbankFile),".gb",".fasta")
  }
  runtime {
    docker: "rpolicas/genbank2fasta:1.0.2"
    memory: "8GB"
  }
}
