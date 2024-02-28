version 1.0

import "./task_delly.wdl" as delly

workflow wf_delly {
  input {
    Array[File]+ bamFiles
    Array[File]+ bamIndices
    File reference
    String svType
  }

  scatter ( idx in range(length(bamFiles)) ) {
    call delly.task_delly {
      input:
      bamFile = bamFiles[idx],
      bamIndex = bamIndices[idx],
      reference = reference,
      svType = svType
    }
  }

  output {
    Array[File?] vcfFiles = task_delly.vcfFile
  }
  
  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "Workflow to run Delly structural variant caller on multiple BAM files"
  }

  parameter_meta {
    # inputs
    bamFiles: {description: "List of bam files to process.", category: "required"}
    bamIndices: {description: "List of index bam files, one index per bam file.", category: "required"}
    reference: {description: "The reference fasta file also used for mapping.", category: "required"}
    svType: {description: "Type of structural variant to look for.", category: "common"}
    # outputs
    vcfFiles: {description: "List of files containing structural variants."}
  }

}
