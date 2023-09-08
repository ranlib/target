version 1.0

task task_intersect_vcf_bed {
  input {
    File vcf
    File bed
    String docker = "staphb/bedtools:2.31.0"
    String intersected_vcf = "intersected.vcf"
  }

  command {
    set -x
    bedtools intersect -header -a ~{vcf} -b ~{bed} > ~{intersected_vcf}
  }
  
  output {
    File output_vcf = intersected_vcf
  }

  runtime {
    docker: docker
  }
}
