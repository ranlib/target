
## Indexing

### Inputs

#### Required

  * `outputPrefix` (String, **required**); **description**: Output directory path + output file prefix.; **category**: required
  * `referenceFile` (File, **required**); **description**: Reference fasta file.; **category**: required

#### Optional

  * `splitIndex` (Int?); **description**: Split index for every ~NUM input bases.; **category**: advanced

#### Defaults

  * `cores` (Int, default=1); **description**: The number of cores to be used.; **category**: advanced
  * `dockerImage` (String, default="staphb/minimap2:2.25"); **description**: The docker image used for this task. Changing this may result in errors which the developers may choose not to address.; **category**: advanced
  * `kmerSize` (Int, default=15); **description**: K-mer size (no larger than 28).; **category**: advanced
  * `memory` (String, default="4G"); **description**: The amount of memory available to the job.; **category**: advanced
  * `minimizerWindowSize` (Int, default=10); **description**: Minimizer window size.; **category**: advanced
  * `timeMinutes` (Int, default=10); **description**: The maximum amount of time the job will run in minutes.; **category**: advanced
  * `useHomopolymerCompressedKmer` (Boolean, default=false); **description**: Use homopolymer-compressed k-mer (preferrable for pacbio).; **category**: advanced

### Outputs

  * `indexFile` (File)

## Mapping

### Inputs

#### Required

  * `outputPrefix` (String, **required**); **description**: Output directory path + output file prefix.; **category**: required
  * `presetOption` (String, **required**); **description**: This option applies multiple options at the same time.; **category**: common
  * `queryFile1` (File, **required**); **description**: Input fasta file.; **category**: required
  * `queryFile2` (File, **required**)
  * `referenceFile` (File, **required**); **description**: Reference fasta file.; **category**: required

#### Optional

  * `howToFindGTAG` (String?); **description**: How to find GT-AG. f:transcript strand, b:both strands, n:don't match GT-AG.; **category**: common
  * `matchingScore` (Int?); **description**: Matching score.; **category**: advanced
  * `maxFragmentLength` (Int?); **description**: Max fragment length (effective with -xsr or in the fragment mode).; **category**: advanced
  * `maxIntronLength` (Int?); **description**: Max intron length (effective with -xsplice; changing -r).; **category**: advanced
  * `mismatchPenalty` (Int?); **description**: Mismatch penalty.; **category**: advanced
  * `retainMaxSecondaryAlignments` (Int?); **description**: Retain at most N secondary alignments.; **category**: advanced

#### Defaults

  * `addMDTagToSam` (Boolean, default=true); **description**: Adds a MD tag to the sam output file.; **category**: common
  * `cores` (Int, default=4); **description**: The number of cores to be used.; **category**: advanced
  * `dockerImage` (String, default="staphb/minimap2:2.25"); **description**: The docker image used for this task. Changing this may result in errors which the developers may choose not to address.; **category**: advanced
  * `kmerSize` (Int, default=15); **description**: K-mer size (no larger than 28).; **category**: advanced
  * `memory` (String, default="30G"); **description**: The amount of memory available to the job.; **category**: advanced
  * `outputSam` (Boolean, default=true); **description**: Output in the sam format.; **category**: common
  * `secondaryAlignment` (Boolean, default=false); **description**: Whether to output secondary alignments.; **category**: advanced
  * `skipSelfAndDualMappings` (Boolean, default=false); **description**: Skip self and dual mappings (for the all-vs-all mode).; **category**: advanced
  * `softClippingForSupplementaryAlignments` (Boolean, default=true)
  * `timeMinutes` (Int, default=1 + ceil((size(queryFile1,"G") * 200 / cores))); **description**: The maximum amount of time the job will run in minutes.; **category**: advanced
  * `writeLongCigar` (Boolean, default=true)

### Outputs

  * `alignmentFile` (File)
