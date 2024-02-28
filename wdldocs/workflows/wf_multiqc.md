
## wf_multiqc

### Inputs

#### Required

  * `inputFiles` (Array[File], **required**)
  * `outputPrefix` (String, **required**)

#### Defaults

  * `task_multiqc.docker` (String, default="multiqc/multiqc:v1.21")
  * `task_multiqc.memory` (String, default="8GB")

### Outputs

  * `report` (File)
