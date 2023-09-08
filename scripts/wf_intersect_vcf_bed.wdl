version 1.0

import "./task_intersect_vcf_bed.wdl" as intersect

workflow wf_intersect_vcf_bed {
  input {
    File vcf
    File bed
  }
  
  call intersect.task_intersect_vcf_bed {
    input:
    vcf = vcf,
    bed = bed
  }

  output {
    File intersected_vcf = task_intersect_vcf_bed.output_vcf
  }
}

