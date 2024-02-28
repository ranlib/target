
## task_centrifuge

### Inputs

#### Required

  * `indexFiles` (Array[File]+, **required**); **description**: The files of the index for the reference genomes.; **category**: required
  * `read1` (File, **required**); **description**: Fastq file with forward reads.; **category**: required
  * `read2` (File, **required**); **description**: Fastq file with reverse reads.; **category**: required
  * `samplename` (String, **required**); **description**: Name of sample.; **category**: required

#### Defaults

  * `disk_size` (Int, default=100); **description**: Disk size in GB needed for this job; **category**: advanced
  * `docker` (String, default="dbest/centrifuge:v1.0.4"); **description**: The docker image used for this task. Changing this may result in errors which the developers may choose not to address.; **category**: advanced
  * `memory` (String, default="20GB"); **description**: The amount of memory available to the job.; **category**: advanced
  * `threads` (Int, default=1); **description**: The number of threads to be used.; **category**: advanced

### Outputs

  * `classificationTSV` (File)
  * `summaryReportTSV` (File)
