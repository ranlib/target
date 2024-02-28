
## task_depth_of_coverage

### Inputs

#### Required

  * `bam` (File, **required**)
  * `intervals` (File, **required**)
  * `reference` (File, **required**)

#### Defaults

  * `docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `lower_coverage` (Int, default=10)
  * `memory` (String, default="8GB")
  * `min_base_quality` (Int, default=20)
  * `outputPrefix` (String, default="depth_of_coverage")

### Outputs

  * `outputs` (Array[File])
