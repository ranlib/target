
## wf_ptrimmer

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## primer trimming workflow.

### Inputs

#### Required

  * `ampfile` (File, **required**); **description**: Input primer file; **category**: required
  * `keep` (Boolean, **required**); **description**: Keep the reads with no primer sequence [default: discard reads]; **category**: required
  * `kmer` (Int, **required**); **description**: kmer length for indexing [8]; **category**: optional
  * `minqual` (Int, **required**); **description**: the minimum average quality to keep after triming [20]; **category**: optional
  * `mismatch` (Int, **required**); **description**: Maximum number of mismatches allowed for primer sequence [3]; **category**: optional
  * `read1` (File, **required**); **description**: Input fastq files with forward reads. Can be gzipped or not.; **category**: required
  * `read2` (File, **required**); **description**: Input fastq files with reverse reads. Can be gzipped or not.; **category**: required
  * `seqtype` (String, **required**); **description**: The sequencing type [single|pair]; **category**: required
  * `trim1` (String, **required**); **description**: Name of output fastq files with forward reads. Must have suffix .gz; **category**: required
  * `trim2` (String, **required**); **description**: Name of output fastq files with reverse reads. Must have suffix .gz; **category**: required

#### Defaults

  * `summary` (String, default="Summary.ampcount"); **description**: Trimming information of each amplicon [default: Summary.ampcount]; **category**: optional
  * `task_ptrimmer.docker` (String, default="dbest/ptrimmer:v1.3.4")

### Outputs

  * `trimmedRead1` (File)
  * `trimmedRead2` (File)
  * `trimmingSummary` (File)
