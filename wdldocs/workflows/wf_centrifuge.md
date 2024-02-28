
## wf_centrifuge

### Inputs

#### Required

  * `indexFiles` (Array[File]+, **required**)
  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `samplename` (String, **required**)

#### Defaults

  * `disk_multiplier` (Int, default=20)
  * `disk_size` (Int, default=100)
  * `memory` (String, default="20GB")
  * `threads` (Int, default=1)
  * `task_centrifuge.docker` (String, default="dbest/centrifuge:v1.0.4")
  * `task_kreport.docker` (String, default="dbest/centrifuge:v1.0.4")

### Outputs

  * `classificationTSV` (File)
  * `summaryReportTSV` (File)
  * `krakenStyleTSV` (File)
