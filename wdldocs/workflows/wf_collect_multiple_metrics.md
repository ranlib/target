
## wf_collect_multiple_metrics

### Inputs

#### Required

  * `bam` (File, **required**)
  * `reference` (File, **required**)

#### Defaults

  * `task_collect_multiple_metrics.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_collect_multiple_metrics.memory` (String, default="8GB")
  * `task_collect_multiple_metrics.outputBasename` (String, default="multiple_metrics")

### Outputs

  * `collectMetricsOutput` (Array[File])
