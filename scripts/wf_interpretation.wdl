version 1.0

import "./task_variant_interpretation.wdl" as vi
import "./task_lineage.wdl" as lineage
import "./task_snpit.wdl" as snpit
import "./task_lims_report.wdl" as lims

workflow wf_interpretation {
  input {
    File vcf
    File bam
    File bai
    File bed
    File json
    String samplename
    String interpretation_report = "variant_interpretation.tsv"
    String interpretation_docker = "dbest/variant_interpretation:v1.0.7"
    String interpretation_memory = "8GB"
    Boolean filter_variants = false
    Boolean filter_genes = true
    Boolean verbose = false
    Int minimum_coverage = 10
    Int minimum_total_depth = 0
    Int minimum_variant_depth = 0
    File lineage_markers
    String lineage_report_name = "lineages.tsv"
    String lineage_docker = "dbest/lineage:v1.0.0"
    String snpit_docker = "valleema/snpit:1.1"
    String lims_report_name = "lims_report.tsv"
    String lims_operator = "DB"
    String lims_docker = "dbest/lims_report:v1.0.0"
  }
  
  call vi.task_variant_interpretation {
    input:
    vcf = vcf,
    bam = bam,
    bai = bai,
    bed = bed,
    json = json,
    samplename = samplename,
    report = interpretation_report,
    docker = interpretation_docker,
    memory = interpretation_memory,
    filter_genes = filter_genes,
    filter_variants = filter_variants,
    verbose = verbose,
    minimum_coverage = minimum_coverage,
    minimum_total_depth =  minimum_total_depth,
    minimum_variant_depth = minimum_variant_depth
  }

  call lineage.task_lineage {
    input:
    vcf = vcf,
    lineage_markers = lineage_markers,
    lineage_report_name = lineage_report_name,
    samplename = samplename,
    docker = lineage_docker
  }

  call snpit.task_snpit {
    input:
    vcf = vcf,
    docker = snpit_docker
  }

  call lims.task_lims_report {
    input:
    lab_report = task_variant_interpretation.interpretation_report,
    bed_file = bed,
    operator = lims_operator,
    lineage_report = task_lineage.lineage_report,
    lims_report_name = lims_report_name,
    docker = lims_docker
  }

  output {
    File lab_log = task_variant_interpretation.interpretation_log
    File lab_report = task_variant_interpretation.interpretation_report
    File snpit_log = task_snpit.output_log
    File lineage_report = task_lineage.lineage_report
    File lims_report = task_lims_report.lims_report
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## interpretation \n This is the interpretation workflow.\n\n"
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
    interpretation_report: {
      description: "name for variant interpretation output tsv file",
      category: "optional"
    }
    # output
    lab_report: {description: "Output tsv file of variant interpretation."}
    lab_log: {description: "Output tsv file that captures output to stdout of variant interpretation."}
    snpit_log: {description: "Output tsv file that captures output to stdout of snpit."}
    lims_report: {description: "Output tsv file for LIMS."}
    lineage_report: {description: "Output tsv file from lineage."}
  }
  
}
