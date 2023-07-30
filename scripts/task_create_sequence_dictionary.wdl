version 1.0

task task_create_sequence_dictionary {
  input {
    File reference
    String docker = "broadinstitute/gatk:4.4.0.0"
    String memory = "8GB"
  }

  String outputFile = basename(reference)
  String reference_dict = sub(sub(outputFile,".fasta",".dict"),".fa",".dict")
  String reference_fai = outputFile + ".fai"
  
  command {
    ln -s ~{reference} ~{outputFile}
    samtools faidx ~{outputFile}
    gatk CreateSequenceDictionary --REFERENCE ~{reference} --OUTPUT ~{reference_dict}
  }

  output {
    File dict = reference_dict
    File fai = reference_fai
  }

  runtime {
    docker: docker
    memory: memory
  }
}
