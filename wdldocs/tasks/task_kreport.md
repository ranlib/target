
## task_kreport

### Inputs

#### Required

  * `classificationTSV` (File, **required**)
  * `indexFiles` (Array[File]+, **required**)
  * `samplename` (String, **required**)

#### Defaults

  * `disk_size` (Int, default=100)
  * `docker` (String, default="dbest/centrifuge:v1.0.4")
  * `memory` (String, default="20GB")

### Outputs

  * `krakenStyleTSV` (File)
