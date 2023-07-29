version 1.0

task task_variant_interpretation {
  input {
    File vcf
    File bam
    File bai
    File bed
    File json
    String sample_name
    Int minimum_coverage = 10
    Int minimum_total_depth = 0
    Int minimum_variant_depth = 0
    Boolean all_genes = false
    String report
    String docker = "dbest/variant_interpretation:v1.0.2"
    String memory = "8GB"
  }
  
  command {
    variant_interpretation.py \
    --vcf ~{vcf} \
    --bam ~{bam} \
    --bed ~{bed} \
    --json ~{json} \
    --sample_name ~{sample_name} \
    --minimum_coverage ~{minimum_coverage} \
    --minimum_total_depth ~{minimum_total_depth} \
    --minimum_variant_depth ~{minimum_variant_depth} \
    --report ~{report} \
    ${if all_genes then '--all_genes' else ''}
  }
  
  output {
    File interpretation_report = "${report}"
  }
  
  runtime {
    docker: docker
    memory: memory
  }
}

