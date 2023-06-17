version 1.0

task task_delly {
  input {
    File bamFile
    File bamIndex
    File referenceFasta
    String svType
  }

  String outFile = sub(basename(bamFile),".bam",".delly.bcf")
  String outVCF = sub(basename(bamFile),".bam",".delly.vcf.gz")

  command {
    delly call -t ~{svType} -o ~{outFile} -g ~{referenceFasta} ~{bamFile}
    bcftools view ~{outFile} | gzip > ~{outVCF}
  }

  output {
    File vcfFile = outVCF
  }

  runtime {
    docker: "dbest/delly"
  }
}
