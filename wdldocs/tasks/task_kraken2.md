
## task_kraken2

### Inputs

#### Required

  * `database` (File, **required**)
  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `samplename` (String, **required**)

#### Defaults

  * `disk_size` (Int, default=100)
  * `docker` (String, default="staphb/kraken2:latest")
  * `memory` (String, default="250GB")
  * `minimum_base_quality` (Int, default=20)
  * `threads` (Int, default=1)

### Outputs

  * `krakenReport` (File?)
  * `krakenOutput` (File?)
  * `unclassified` (Array[File])
  * `classified` (Array[File])
