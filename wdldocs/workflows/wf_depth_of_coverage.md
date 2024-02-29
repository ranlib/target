
## wf_depth_of_coverage

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## Calculate Depth of Coverage using GATK's DepthOfCoverage tool.

### Inputs

#### Required

  * `bam` (File, **required**); **description**: Input BAM file.; **category**: required
  * `bed` (File, **required**)
  * `lowerCoverageThreshold` (Int, **required**)
  * `outputPrefix` (String, **required**); **description**: Output prefix for the coverage analysis.; **category**: required
  * `reference` (File, **required**); **description**: Reference genome file.; **category**: required

#### Defaults

  * `task_depth_of_coverage.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_depth_of_coverage.memory` (String, default="8GB")
  * `task_depth_of_coverage.min_base_quality` (Int, default=20)

### Outputs

  * `coverageOutputs` (Array[File])
