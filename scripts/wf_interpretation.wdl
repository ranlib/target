version 1.0

import "./task_variant_interpretation.wdl" as vi
import "./task_lineage.wdl" as lineage
import "./task_lims_report.wdl" as lims

workflow wf_interpretation {
  input {
    File vcf
    File bam
    File bai
    File bed
    File json
    String samplename
    String? report
    File? input_annotation
    File? lineage_markers
    String lineages_tsv = "lineages.tsv"
    String lims_tsv = "lims_report.tsv"
    String operator = "DB"
  }
  
  # select_first([report]) to coerce String? -> String
  String the_report = if defined(report) then select_first([report]) else samplename+"_variant_interpretation.tsv"
  
  call vi.task_variant_interpretation {
    input:
    vcf = vcf,
    bam = bam,
    bai = bai,
    bed = bed,
    json = json,
    samplename = samplename,
    report = the_report
  }

  if ( defined(lineage_markers) ) {
    call lineage.task_lineage {
      input:
      input_annotation = select_first([input_annotation]),
      lineage_markers = select_first([lineage_markers]),
      lineages_tsv = lineages_tsv,
      samplename = samplename
    }
  }

  call lims.task_lims_report {
    input:
    lab_tsv = task_variant_interpretation.interpretation_report,
    bed_file = bed,
    operator = operator,
    lineages_tsv = task_lineage.lineage,
    lims_tsv = lims_tsv
  }

  output {
    File lab_report = task_variant_interpretation.interpretation_report
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
    sample_name: {
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
    report: {
      description: "name for output tsv file.",
      category: "optional"
    }
    # output
    interpretation_report: {description: "Output tsv file of variant interpretation."}
  }
  
}
