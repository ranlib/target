
## task_ptrimmer

### Inputs

#### Required

  * `ampfile` (File, **required**)
  * `keep` (Boolean, **required**)
  * `kmer` (Int, **required**)
  * `minqual` (Int, **required**)
  * `mismatch` (Int, **required**)
  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `seqtype` (String, **required**)
  * `trim1` (String, **required**)
  * `trim2` (String, **required**)

#### Defaults

  * `docker` (String, default="dbest/ptrimmer:v1.3.4")
  * `summary` (String, default="Summary.ampcount")

### Outputs

  * `trimmedRead1` (File)
  * `trimmedRead2` (File)
  * `trimmingSummary` (File)
