version 1.0

import "./task_lineage.wdl" as lineage
import "./task_snpit.wdl" as snpit

workflow wf_lineage {
  input {
    File vcf
    File lineage_markers
    String samplename
    String lineage_report_name = "lineage_report.tsv"
    String lineage_docker = "dbest/lineage:v1.0.0"
    String snpit_docker = "valleema/snpit:1.1"
  }

  call lineage.task_lineage {
    input:
    vcf = vcf,
    lineage_markers = lineage_markers,
    samplename = samplename,
    lineage_report_name = lineage_report_name,
    docker = lineage_docker
  }

  call snpit.task_snpit {
    input:
      vcf = vcf,
      docker = snpit_docker
  }

  output {
    File lineage_report = task_lineage.lineage_report
    File snpit_log = task_snpit.output_log
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Lineage caller \n Determinate tuberculosis lineage based on SNPs."
  }
  
  parameter_meta {
    vcf: {
      description: "vcf file or compressed vcf file (suffix vcf.gz)",
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
    lineage_docker: {
      description: "docker image to be used for CDC lineage caller",
      category: "optional"
    }
    snpit_docker: {
      description: "docker image to be used for snpit lineage caller",
      category: "optional"
    }
    
    # output
    lineage_report: {description: "Output tsv file of CDC lineage caller"}
    snpit_log: {description: "Output tsv file of snpit lineage caller"}
  }

}
