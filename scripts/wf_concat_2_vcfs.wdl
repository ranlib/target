version 1.0

import "./task_concat_2_vcfs.wdl" as concat

workflow wf_concat_2_vcfs {
  input {
    File vcf1
    File vcf2
    String output_vcf_name = "output.vcf"
  }
  
  call concat.task_concat_2_vcfs {
    input:
    vcf1 = vcf1,
    vcf2 = vcf2,
    output_vcf_name = output_vcf_name
  }

  output {
    File vcf = task_concat_2_vcfs.concatenated_vcf
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "Concatentate 2 vcf files"
  }

}

