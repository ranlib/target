
## task_collect_hs_metrics

### Inputs

#### Required

  * `bait_bed` (File, **required**)
  * `bam` (File, **required**)
  * `reference` (File, **required**)
  * `target_bed` (File, **required**)

#### Defaults

  * `docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `hs_metrics` (String, default="collect_hs_metrics.txt")
  * `memory` (String, default="8GB")

### Outputs

  * `collect_hs_metrics` (File)
