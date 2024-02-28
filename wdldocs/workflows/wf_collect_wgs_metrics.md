
## wf_collect_wgs_metrics

### Inputs

#### Required

  * `bam` (File, **required**)
  * `reference` (File, **required**)

#### Optional

  * `bed` (File?)

#### Defaults

  * `task_collect_wgs_metrics.coverage_cap` (Int, default=250)
  * `task_collect_wgs_metrics.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_collect_wgs_metrics.memory` (String, default="8GB")
  * `task_collect_wgs_metrics.minBaseQuality` (Int, default=20)
  * `task_collect_wgs_metrics.minMappingQuality` (Int, default=20)
  * `task_collect_wgs_metrics.outputFile` (String, default="collect_wgs_metrics.txt")
  * `task_collect_wgs_metrics.read_length` (Int, default=150)
  * `task_collect_wgs_metrics.sample_size` (Int, default=10000)
  * `task_collect_wgs_metrics.sensitivityFile` (String, default="collect_wgs_sensitivity_metrics.txt")
  * `task_collect_wgs_metrics.use_fast_algorithm` (Boolean, default=true)

### Outputs

  * `collectMetricsOutput` (File)
  * `collectMetricsSensitivity` (File)
