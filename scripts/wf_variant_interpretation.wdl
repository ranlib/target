version 1.0

import "./task_variant_interpretation.wdl" as vi

workflow wf_variant_interpretation {
  input {
    File vcf
    File bam
    File bai
    File bed
    File json
    String sample_name
    String? report
  }

  # select_first([report]) to coerce String? -> String
  String the_report = if defined(report) then select_first([report]) else sample_name+"_variant_interpretation.tsv"
  
  call vi.task_variant_interpretation {
    input:
    vcf = vcf,
    bam = bam,
    bai = bai,
    bed = bed,
    json = json,
    sample_name = sample_name,
    report = the_report
  }
  
  output {
    File interpretation_report = task_variant_interpretation.interpretation_report
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
