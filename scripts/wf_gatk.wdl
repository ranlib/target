version 1.0

import "./task_gatk.wdl" as gatk

workflow wf_gatk {
  input {
    Array[File]+ inputBams
    Array[File]+ inputBamsIndex
    File referenceFasta
    File referenceFastaDict
    File referenceFastaFai
    String outputVcf
    Array[File]+ intervals
    String javaXmx = "4G"
    String memory = "5G"
    Int timeMinutes = 240
    String dockerImage =  "broadinstitute/gatk:4.4.0.0"
  }

  call gatk.mutect2 {
    input:
    inputBams = inputBams,
    inputBamsIndex = inputBamsIndex,
    referenceFasta = referenceFasta,
    referenceFastaDict = referenceFastaDict,
    referenceFastaFai = referenceFastaFai,
    outputVcf = outputVcf,
    intervals = intervals,
    javaXmx = javaXmx,
    memory = memory,
    timeMinutes = timeMinutes,
    dockerImage = dockerImage
  }

  output {
    File vcfFile = mutect2.vcfFile
    File vcfFileIndex = mutect2.vcfFileIndex
    File stats = mutect2.stats
  }
}
