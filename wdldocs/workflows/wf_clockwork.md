
## VariantCallingWorkflow

### Inputs

#### Required

  * `outputPrefix` (String, **required**)
  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `reference` (String, **required**)
  * `sampleName` (String, **required**)

#### Defaults

  * `VariantCall.threads` (Int, default=10)

### Outputs

  * `outputs` (Array[File]?)

## VariantCall

### Inputs

#### Required

  * `outputPrefix` (String, **required**)
  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `reference` (String, **required**)
  * `sampleName` (String, **required**)

#### Defaults

  * `threads` (Int, default=10)

### Outputs

  * `outputs` (Array[File]?)
