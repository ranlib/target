
## task_collect_wgs_metrics

### Inputs

#### Required

  * `bam` (File, **required**)
  * `reference` (File, **required**)

#### Optional

  * `bed` (File?)

#### Defaults

  * `coverage_cap` (Int, default=250)
  * `docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `memory` (String, default="8GB")
  * `minBaseQuality` (Int, default=20)
  * `minMappingQuality` (Int, default=20)
  * `outputFile` (String, default="collect_wgs_metrics.txt")
  * `read_length` (Int, default=150)
  * `sample_size` (Int, default=10000)
  * `sensitivityFile` (String, default="collect_wgs_sensitivity_metrics.txt")
  * `use_fast_algorithm` (Boolean, default=true)

### Outputs

  * `collectMetricsOutput` (File)
  * `collectMetricsSensitivity` (File)
