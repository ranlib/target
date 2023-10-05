version 1.0

import "./task_variant_interpretation.wdl" as vi

workflow wf_variant_interpretation {
  input {
    File vcf
    File bam
    File bai
    File bed
    File json
    String samplename
    Int minimum_coverage = 10
    Int minimum_total_depth = 0
    Int minimum_variant_depth = 0
    Boolean filter_genes = false
    Boolean filter_variants = true
    Boolean verbose = false
    String filtered_vcf = "filtered_vcf.vcf"
    String report = "variant_interpretation.tsv"
    String docker = "dbest/variant_interpretation:v1.3.0"
    String memory = "8GB"
  }

  call vi.task_variant_interpretation {
    input:
    vcf = vcf,
    bam = bam,
    bai = bai,
    bed = bed,
    json = json,
    samplename = samplename,
    report = report,
    docker = docker,
    memory = memory,
    verbose = verbose,
    filter_genes = filter_genes,
    filter_variants = filter_variants,
    minimum_coverage = minimum_coverage,
    minimum_total_depth = minimum_total_depth,
    minimum_variant_depth = minimum_variant_depth
  }
  
  output {
    File interpretation_report = task_variant_interpretation.interpretation_report
    File interpretation_log = task_variant_interpretation.interpretation_log
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## variant interpretation \n This is the variant interpretation workflow.\n\n This also runs as a task in the CDC TB profiler workflow."
  }
  
  parameter_meta {
    vcf: {
      description: "vcf file or compressed vcf file (suffix vcf.gz) output from CDC/London TB profiler pipeline.",
      category: "required"
    }
    bam: {
      description: "bam file output from CDC/London TB profiler pipeline.",
      category: "required"
    }
    bai: {
      description: "bam index file output from CDC/London TB profiler pipeline.",
      category: "required"
    }
    bed: {
      description: "bed file with genomic intervals of interest. Note: reference name in case of London TB profiler is 'Chromosome', make sure to use correct bed file",
      category: "required"
    }
    json: {
      description: "json file with drug information for variants.",
      category: "required"
    }
    samplename: {
      description: "sample name.",
      category: "required"
    }
    minimum_coverage: {
      description: "minimum coverage requirement.",
      category: "optional"
    }
    minimum_total_depth: {
      description: "minimum total number of reads that cover a variant requirement.",
      category: "optional"
    }
    minimum_variant_depth: {
      description: "minimum number of reads that support a variant requirement.",
      category: "optional"
    }
    filter_genes: {
      description: "if true, only genes interest are written to the output tsv report.",
      category: "optional"
    }
    filter_variants: {
      description: "if true, only variants with a PASS in the vcf filter columns are considered.",
      category: "optional"
    }
    report: {
      description: "name for output tsv file.",
      category: "optional"
    }
    # output
    interpretation_report: {description: "Output tsv file of variant interpretation."}
    interpretation_log: {description: "Output tsv file that captures output to stdout of variant interpretation."}
  }
  
}
