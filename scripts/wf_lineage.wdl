version 1.0

import "./task_lineage.wdl" as lineage

workflow wf_lineage {
  input {
    File vcf
    File lineage_markers
    String samplename
    String lineage_report_name = "lineage_report.tsv"
    String docker = "dbest/lineage:v1.0.0"
  }

  call lineage.task_lineage {
    input:
    vcf = vcf,
    lineage_markers = lineage_markers,
    samplename = samplename,
    lineage_report_name = lineage_report_name,
    docker = docker
  }
  
  output {
    File lineage_report = task_lineage.lineage_report
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## lineage caller \n Determinate TB lineage based on SNPs."
  }
  
  parameter_meta {
    vcf: {
      description: "vcf file or compressed vcf file (suffix vcf.gz) output from CDC/London TB profiler pipeline.",
      category: "required"
    }
    samplename: {
      description: "sample name.",
      category: "required"
    }
    lineage_markers: {
      description: "tsv file with columns Lineage, Position, Ref, Alt",
      category: "required"
    }
    lineage_report_name: {
      description: "filename for output lineage report",
      category: "optional"
    }
    docker: {
      description: "docker image to be used",
      category: "optional"
    }
    
    # output
    interpretation_report: {description: "Output tsv file of variant interpretation."}
    interpretation_log: {description: "Output tsv file that captures output to stdout of variant interpretation."}
  }

}
