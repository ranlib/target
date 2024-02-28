
## wf_delly

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: Workflow to run Delly structural variant caller on multiple BAM files

### Inputs

#### Required

  * `bamFiles` (Array[File]+, **required**); **description**: List of bam files to process.; **category**: required
  * `bamIndices` (Array[File]+, **required**); **description**: List of index bam files, one index per bam file.; **category**: required
  * `reference` (File, **required**); **description**: The reference fasta file also used for mapping.; **category**: required
  * `svType` (String, **required**); **description**: Type of structural variant to look for.; **category**: common

#### Defaults

  * `task_delly.docker` (String, default="dbest/delly:v1.0.0")
  * `task_delly.memory` (String, default="32GB")

### Outputs

  * `vcfFiles` (Array[File?])
