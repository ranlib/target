
## task_bracken

### Inputs

#### Required

  * `database` (File, **required**)
  * `kraken_report` (File, **required**)
  * `samplename` (String, **required**)

#### Defaults

  * `disk_size` (Int, default=100)
  * `docker` (String, default="staphb/bracken")
  * `level` (String, default="S")
  * `memory` (String, default="250GB")
  * `read_length` (Int, default=150)
  * `threshold` (Int, default=10)

### Outputs

  * `bracken_report` (Array[File])
