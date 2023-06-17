version 1.0

import "./task_bcf2vcf.wdl" as bcf2vcf

workflow wf_bcf2vcf {
  input {
    File bcf_file
  }

  call bcf2vcf.task_bcf2vcf {
    input:
    bcf_file = bcf_file
  }

  output {
    File vcf_file = task_bcf2vcf.vcf_file
  }

}
