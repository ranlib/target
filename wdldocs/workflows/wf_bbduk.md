
## wf_bbduk

### Inputs

#### Required

  * `forwardReads` (File, **required**)
  * `reverseReads` (File, **required**)
  * `samplename` (String, **required**)

#### Optional

  * `contamination` (File?)

#### Defaults

  * `disk_size` (Int, default=100)
  * `memory` (String, default="6GB")
  * `threads` (Int, default=1)
  * `task_bbduk.docker` (String, default="staphb/bbtools:39.01")
  * `task_bbduk.keep` (Boolean, default=true)
  * `task_bbduk.number_of_retries` (Int, default=1)

### Outputs

  * `read1_clean` (File)
  * `read2_clean` (File)
  * `adapter_stats` (File?)
  * `phiX_stats` (File?)
  * `Covid19_stats` (File?)
  * `polyA_stats` (File?)
  * `Ecoli_stats` (File?)
  * `NZ_CP008889_stats` (File?)
  * `NZ_CP008889_plasmid_stats` (File?)
  * `pipeline_date` (String)
