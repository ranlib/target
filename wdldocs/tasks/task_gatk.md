
## LeftAlignAndTrimVariants

### Inputs

#### Required

  * `alignedVcf` (String, **required**)
  * `referenceFasta` (File, **required**)
  * `referenceFastaDict` (File, **required**)
  * `referenceFastaFai` (File, **required**)
  * `unfilteredVcf` (File, **required**)

#### Defaults

  * `dockerImage` (String, default="broadinstitute/gatk:4.2.6.1")
  * `javaXmx` (String, default="12G")
  * `memory` (String, default="13G")

### Outputs

  * `outputAlignedVcf` (File)
  * `outputAlignedVcfIndex` (File)

## FilterMutectCalls

### Inputs

#### Required

  * `filteredVcf` (String, **required**)
  * `min_allele_fraction` (Float, **required**)
  * `min_median_read_position` (Int, **required**)
  * `min_reads_per_strand` (Int, **required**)
  * `mutect2stats` (File, **required**)
  * `referenceFasta` (File, **required**)
  * `referenceFastaDict` (File, **required**)
  * `referenceFastaFai` (File, **required**)
  * `unfilteredVcf` (File, **required**)

#### Defaults

  * `dockerImage` (String, default="broadinstitute/gatk:4.2.6.1")
  * `javaXmx` (String, default="12G")
  * `memory` (String, default="13G")

### Outputs

  * `outputFilteredVcf` (File)
  * `outputFilteredVcfIndex` (File)
  * `outputFilteredStats` (File)

## Mutect2

### Inputs

#### Required

  * `inputBams` (Array[File]+, **required**)
  * `inputBamsIndex` (Array[File]+, **required**)
  * `intervals` (Array[File]+, **required**)
  * `outputVcf` (String, **required**)
  * `referenceFasta` (File, **required**)
  * `referenceFastaDict` (File, **required**)
  * `referenceFastaFai` (File, **required**)

#### Defaults

  * `dockerImage` (String, default="broadinstitute/gatk:4.2.6.1")
  * `javaXmx` (String, default="4G")
  * `memory` (String, default="5G")

### Outputs

  * `vcfFile` (File)
  * `vcfFileIndex` (File)
  * `vcfFileStats` (File)
