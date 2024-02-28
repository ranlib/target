
## wf_minimap2

### Inputs

#### Required

  * `outputPrefix` (String, **required**)
  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `reference` (File, **required**)
  * `samplename` (String, **required**)

#### Optional

  * `Indexing.splitIndex` (Int?)
  * `Mapping.howToFindGTAG` (String?)
  * `Mapping.matchingScore` (Int?)
  * `Mapping.maxFragmentLength` (Int?)
  * `Mapping.maxIntronLength` (Int?)
  * `Mapping.mismatchPenalty` (Int?)
  * `Mapping.retainMaxSecondaryAlignments` (Int?)

#### Defaults

  * `threads` (Int, default=1)
  * `Indexing.dockerImage` (String, default="staphb/minimap2:2.25")
  * `Indexing.kmerSize` (Int, default=15)
  * `Indexing.memory` (String, default="4G")
  * `Indexing.minimizerWindowSize` (Int, default=10)
  * `Indexing.timeMinutes` (Int, default=10)
  * `Indexing.useHomopolymerCompressedKmer` (Boolean, default=false)
  * `Mapping.dockerImage` (String, default="staphb/minimap2:2.25")
  * `Mapping.kmerSize` (Int, default=15)
  * `Mapping.memory` (String, default="30G")
  * `Mapping.secondaryAlignment` (Boolean, default=false)
  * `Mapping.skipSelfAndDualMappings` (Boolean, default=false)
  * `Mapping.softClippingForSupplementaryAlignments` (Boolean, default=true)
  * `Mapping.timeMinutes` (Int, default=1 + ceil((size(queryFile1,"G") * 200 / cores)))
  * `Mapping.writeLongCigar` (Boolean, default=true)

### Outputs

  * `sam` (File)
  * `mmi` (File)
  * `bam` (File)
  * `bai` (File)
