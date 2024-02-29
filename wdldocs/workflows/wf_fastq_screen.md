
## wf_fastq_screen

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## QC screen for fastq files

### Inputs

#### Required

  * `configuration` (File, **required**); **description**: configuration file.; **category**: optional
  * `contaminants` (File, **required**); **description**: tsv file with adapter names in column 1 and sequences in column 2.; **category**: optional
  * `reads` (File, **required**); **description**: fastq file; **category**: required

#### Defaults

  * `task_fastq_screen.aligner` (String, default="bwa")
  * `task_fastq_screen.docker` (String, default="dbest/fastq_screen:v0.15.3")
  * `task_fastq_screen.memory` (String, default="10GB")
  * `task_fastq_screen.subset` (Int, default=100000)
  * `task_fastq_screen.threads` (Int, default=1)

### Outputs

  * `html` (File)
  * `txt` (File)
  * `tagged` (File)
  * `tagged_filter` (File)
