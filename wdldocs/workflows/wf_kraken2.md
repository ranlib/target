
## wf_kraken2

### Inputs

#### Required

  * `database` (File, **required**)
  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `samplename` (String, **required**)

#### Defaults

  * `disk_multiplier` (Int, default=20)
  * `disk_size` (Int, default=100)
  * `level` (String, default="S")
  * `memory` (String, default="250GB")
  * `read_length` (Int, default=150)
  * `threads` (Int, default=1)
  * `threshold` (Int, default=10)
  * `task_bracken.docker` (String, default="staphb/bracken")
  * `task_kraken2.docker` (String, default="staphb/kraken2:latest")
  * `task_kraken2.minimum_base_quality` (Int, default=20)

### Outputs

  * `krakenReport` (File?)
  * `krakenOutput` (File?)
  * `brackenReport` (Array[File]?)
  * `unclassified` (Array[File])
  * `classified` (Array[File])
