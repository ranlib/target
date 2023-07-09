version 1.0

import "./task_snpEff.wdl" as snpEff

workflow wf_snpEff {
  input {
    File vcf
    File dataDir
    File config
    String genome
    String outputPath = "./snpeff.vcf"
    Boolean hgvs = true
    Boolean lof = true
    Boolean noDownstream = false
    Boolean noIntergenic = false
    Boolean noShiftHgvs = false
    Int? upDownStreamLen
    
    String memory = "9G"
    String javaXmx = "8G"
    Int timeMinutes = 60
    String dockerImage = "quay.io/biocontainers/snpeff:5.1d--hdfd78af_0"
  }


  call snpEff.SnpEff {
    input:
    vcf = vcf,
    genome = genome,
    config = config,
    dataDir = dataDir
  }

  output {
    File outputVcf = SnpEff.outputVcf
  }
}
