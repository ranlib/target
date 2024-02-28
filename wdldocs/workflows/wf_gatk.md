
## wf_gatk

### Inputs

#### Required

  * `inputBams` (Array[File]+, **required**)
  * `inputBamsIndex` (Array[File]+, **required**)
  * `intervals` (Array[File]+, **required**)
  * `min_allele_fraction` (Float, **required**)
  * `min_median_read_position` (Int, **required**)
  * `min_reads_per_strand` (Int, **required**)
  * `outputAlignedVcf` (String, **required**)
  * `outputFilteredVcf` (String, **required**)
  * `outputVcf` (String, **required**)
  * `referenceFasta` (File, **required**)
  * `referenceFastaDict` (File, **required**)
  * `referenceFastaFai` (File, **required**)

#### Defaults

  * `dockerImage` (String, default="broadinstitute/gatk:4.2.6.1")
  * `javaXmx` (String, default="8G")
  * `memory` (String, default="9G")

### Outputs

  * `vcfFile` (File)
  * `vcfFileIndex` (File)
  * `vcfFileStats` (File)
  * `vcfAlignedFile` (File)
  * `vcfAlignedFileIndex` (File)
  * `vcfFilteredFile` (File)
  * `vcfFilteredFileIndex` (File)
  * `vcfFilteredFileStats` (File)
