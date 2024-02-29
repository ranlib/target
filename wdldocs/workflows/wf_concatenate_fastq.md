
## wf_concatenate_fastq

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## Concatenate fastq files

### Inputs

#### Required

  * `forwardFastqFiles` (Array[File]+, **required**); **description**: List of fastq files with forward reads.; **category**: required
  * `outputForward` (String, **required**); **description**: Output fastq file with forward reads.
  * `outputReverse` (String, **required**); **description**: Output fastq file with reverse reads.
  * `reverseFastqFiles` (Array[File]+, **required**); **description**: List of fastq files with reverse reads.; **category**: required

### Outputs

  * `concatenatedForwardFastq` (File)
  * `concatenatedReverseFastq` (File)
