
## task_collect_targeted_pcr_metrics

### Inputs

#### Required

  * `amplicon_bed` (File, **required**)
  * `bam` (File, **required**)
  * `reference` (File, **required**)
  * `target_bed` (File, **required**)

#### Defaults

  * `clip_overlapping_reads` (Boolean, default=true)
  * `coverage_cap` (Int, default=250)
  * `docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `memory` (String, default="8GB")
  * `minBaseQuality` (Int, default=20)
  * `minMappingQuality` (Int, default=20)
  * `outputMetrics` (String, default="collect_targeted_pcr_metrics.txt")
  * `sample_size` (Int, default=10000)
  * `sensitivityFile` (String, default="collect_targeted_pcr_sensitivity_metrics.txt")
  * `target_coverage_file` (String, default="collect_targeted_pcr_target_coverage.txt")

### Outputs

  * `metrics` (File?)
  * `collectMetricsSensitivity` (File?)
  * `target_coverage` (File?)
