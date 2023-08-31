version 1.0

import "./task_delly.wdl" as delly
import "./task_snpEff.wdl" as snpEff

workflow wf_structural_variants {
  input {
    File bam
    File bai
    File reference
    String svType = "DEL"
    # snpEff
    File dataDir
    File config
    String genome
  }

  call delly.task_delly {
    input:
    bamFile = bam,
    bamIndex = bai,
    reference = reference,
    svType = svType
  }

  call snpEff.task_snpEff {
    input:
    vcf = task_delly.vcfFile,
    genome = genome,
    config = config,
    dataDir = dataDir
  }

  output {
    File vcf = task_delly.vcfFile
    File vcf_annotated = task_snpEff.outputVcf
  }
  
  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "Structural variants workflow"
  }
}
