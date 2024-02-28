
## task_bbduk

### Inputs

#### Required

  * `read1_trimmed` (File, **required**)
  * `read2_trimmed` (File, **required**)
  * `samplename` (String, **required**)

#### Optional

  * `contamination` (File?)

#### Defaults

  * `disk_size` (Int, default=100)
  * `docker` (String, default="staphb/bbtools:39.01")
  * `keep` (Boolean, default=true)
  * `memory` (String, default="8GB")
  * `number_of_retries` (Int, default=1)
  * `threads` (Int, default=1)

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
