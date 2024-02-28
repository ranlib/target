
## task_trimmomatic

### Inputs

#### Required

  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `samplename` (String, **required**)

#### Defaults

  * `disk_size` (Int, default=100)
  * `docker` (String, default="staphb/trimmomatic:0.39")
  * `memory` (String, default="8GB")
  * `threads` (Int, default=4)
  * `trimmomatic_minlen` (Int, default=40)
  * `trimmomatic_quality_trim_score` (Int, default=15)
  * `trimmomatic_window_size` (Int, default=4)

### Outputs

  * `read1_trimmed` (File)
  * `read2_trimmed` (File)
  * `trim_stats` (File)
  * `trim_log` (File)
  * `trim_err` (File)
  * `version` (String)
  * `pipeline_date` (String)
