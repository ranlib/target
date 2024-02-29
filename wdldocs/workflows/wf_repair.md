
## wf_repair

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## Repair reads in paired end fastq files

### Inputs

#### Required

  * `read1` (File, **required**); **description**: Input fastq file with forward reads; **category**: required
  * `read2` (File, **required**); **description**: Input fastq file with reverse reads; **category**: required
  * `samplename` (String, **required**); **description**: Sample name; **category**: required

#### Defaults

  * `task_repair.docker` (String, default="staphb/bbtools:39.01")
  * `task_repair.memory` (String, default="8GB")

### Outputs

  * `repaired_read1` (File)
  * `repaired_read2` (File)
  * `repaired_singletons` (File)
