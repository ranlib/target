version 1.0

import "./task_delly.wdl" as task_delly

workflow wf_delly {
  input {
    Array[File]+ bamFiles
    Array[File]+ bamIndices
    File referenceFasta
    String svType
  }

  scatter ( idx in range(length(bamFiles)) ) {
    call task_delly.task_delly {
      input:
      bamFile = bamFiles[idx],
      bamIndex = bamIndices[idx],
      referenceFasta = referenceFasta,
      svType = svType
    }
  }

  output {
    Array[File] vcfFiles = task_delly.vcfFile
  }
  
  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "Workflow to run Delly structural variant caller on multiple BAM files"
  }
}
