version 1.0

import "./task_delly.wdl" as delly
import "./task_snpEff.wdl" as snpEff

workflow wf_structural_variants {
  input {
    # delly
    File bam
    File bai
    File reference
    String svType = "DEL"
    String delly_docker = "dbest/delly:v1.0.0"
    String delly_memory = "32GB"
    # snpEff
    File dataDir
    File config
    String genome
    Boolean hgvs = true
    Boolean lof = true
    Boolean noDownstream = false
    Boolean noIntergenic = false
    Boolean noShiftHgvs = false
    Int upDownStreamLen = 5000
    String snpEff_memory = "9G"
    String snpEff_docker = "dbest/snpeff:v5.2f"
    String output_vcf_name = "structural_variants.vcf"
  }

  call delly.task_delly {
    input:
    bamFile = bam,
    bamIndex = bai,
    reference = reference,
    svType = svType,
    docker = delly_docker,
    memory = delly_memory
  }

  if (defined(task_delly.vcfFile)) {
    call snpEff.task_snpEff {
      input:
      vcf = select_first([task_delly.vcfFile]),
      genome = genome,
      config = config,
      dataDir = dataDir,
      docker = snpEff_docker,
      memory = snpEff_memory,
      hgvs = hgvs,
      lof = lof,
      noDownstream = noDownstream,
      noIntergenic = noIntergenic,
      noShiftHgvs = noShiftHgvs,
      upDownStreamLen = upDownStreamLen,
      outputPath = output_vcf_name
    }
  }

  output {
    File? vcf = task_delly.vcfFile
    File? vcf_annotated = task_snpEff.outputVcf
  }
  
  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Structural variants caller workflow"
  }
}
