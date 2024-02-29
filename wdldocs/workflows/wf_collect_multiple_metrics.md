
## wf_collect_multiple_metrics

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## Collect multiple QC metrics from bam alignment file

### Inputs

#### Required

  * `bam` (File, **required**); **description**: Input bam alignemnt file.; **category**: required
  * `reference` (File, **required**); **description**: Reference genome; **category**: required

#### Defaults

  * `task_collect_multiple_metrics.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_collect_multiple_metrics.memory` (String, default="8GB")
  * `task_collect_multiple_metrics.outputBasename` (String, default="multiple_metrics")

### Outputs

  * `collectMetricsOutput` (Array[File])
