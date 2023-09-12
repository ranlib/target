version 1.0

task task_bcf2vcf {
  input {
    File bcf_file
    String docker = "staphb/bcftools:1.17"
  }

  String vcf = "${basename(bcf_file)}.vcf"

  command {
    bcftools view ${bcf_file} > ${vcf}
  }

  output {
    File vcf_file = vcf
  }

  runtime {
    docker: docker
  }
}

