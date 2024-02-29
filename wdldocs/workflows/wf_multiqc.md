
## wf_multiqc

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## Multi QC workflow 

 Produce QC reports for a number of tasks

### Inputs

#### Required

  * `inputFiles` (Array[File], **required**); **description**: List of input files to run QC on.; **category**: required
  * `outputPrefix` (String, **required**); **description**: output prefix.; **category**: required

#### Defaults

  * `task_multiqc.docker` (String, default="multiqc/multiqc:v1.21")
  * `task_multiqc.memory` (String, default="8GB")

### Outputs

  * `report` (File)
