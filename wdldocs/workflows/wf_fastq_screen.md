
## wf_fastq_screen

### Inputs

#### Required

  * `configuration` (File, **required**)
  * `contaminants` (File, **required**)
  * `reads` (File, **required**)

#### Defaults

  * `task_fastq_screen.aligner` (String, default="bwa")
  * `task_fastq_screen.docker` (String, default="dbest/fastq_screen:v0.15.3")
  * `task_fastq_screen.memory` (String, default="10GB")
  * `task_fastq_screen.subset` (Int, default=100000)
  * `task_fastq_screen.threads` (Int, default=1)

### Outputs

  * `html` (File)
  * `txt` (File)
  * `tagged` (File)
  * `tagged_filter` (File)
