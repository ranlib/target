
## task_fastq_screen

### Inputs

#### Required

  * `configuration` (File, **required**)
  * `contaminants` (File, **required**)
  * `reads` (File, **required**)

#### Defaults

  * `aligner` (String, default="bwa")
  * `docker` (String, default="dbest/fastq_screen:v0.15.3")
  * `memory` (String, default="10GB")
  * `subset` (Int, default=100000)
  * `threads` (Int, default=1)

### Outputs

  * `html` (File)
  * `txt` (File)
  * `tagged` (File)
  * `tagged_filter` (File)
