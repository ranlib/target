version 1.0

task task_variant_interpretation {
  input {
    File vcf
    File bam
    File bai
    File bed
    File json
    String samplename
    Int minimum_coverage = 10
    Int minimum_total_depth = 10
    Int minimum_variant_depth = 10
    Float minimum_allele_percentage = 10
    Boolean filter_genes = true
    Boolean filter_variants = false
    Boolean verbose = false
    Boolean debug = true
    String report = "variant_interpretation.tsv"
    String docker = "dbest/variant_interpretation:v1.4.0"
    String memory = "8GB"
  }
  
  command {
    set -xe
    variant_interpretation.py \
    --vcf ~{vcf} \
    --bam ~{bam} \
    --bed ~{bed} \
    --json ~{json} \
    --samplename ~{samplename} \
    --minimum_coverage ~{minimum_coverage} \
    --minimum_total_depth ~{minimum_total_depth} \
    --minimum_variant_depth ~{minimum_variant_depth} \
    --minimum_allele_percentage ~{minimum_allele_percentage} \
    --report ~{report} \
    ${if filter_variants then '--filter_variants' else ''} \
    ${if filter_genes then '--filter_genes' else ''} \
    ${if verbose then '--verbose' else ''} \
    ${if debug then '--debug' else ''}
  }
  
  output {
    File interpretation_report = "${report}"
    File interpretation_log = stdout()
  }
  
  runtime {
    docker: docker
    memory: memory
  }
}

