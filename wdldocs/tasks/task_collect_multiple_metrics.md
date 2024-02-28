
## task_collect_multiple_metrics

### Inputs

#### Required

  * `bam` (File, **required**)
  * `reference` (File, **required**)

#### Defaults

  * `docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `memory` (String, default="8GB")
  * `outputBasename` (String, default="multiple_metrics")

### Outputs

  * `collectMetricsOutput` (Array[File])
