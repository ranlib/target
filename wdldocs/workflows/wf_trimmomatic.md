
## wf_trimmomatic

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## Read base quality trimming

### Inputs

#### Required

  * `read1_files` (Array[File]+, **required**); **description**: List of fastq files with forward reads.; **category**: required
  * `read2_files` (Array[File]+, **required**); **description**: List of fastq files with reverse reads.; **category**: required
  * `samplenames` (Array[String]+, **required**); **description**: List of sample names.; **category**: required

#### Defaults

  * `task_trimmomatic.disk_size` (Int, default=100)
  * `task_trimmomatic.docker` (String, default="staphb/trimmomatic:0.39")
  * `task_trimmomatic.memory` (String, default="8GB")
  * `task_trimmomatic.threads` (Int, default=4)
  * `task_trimmomatic.trimmomatic_minlen` (Int, default=40)
  * `task_trimmomatic.trimmomatic_quality_trim_score` (Int, default=15)
  * `task_trimmomatic.trimmomatic_window_size` (Int, default=4)

### Outputs

  * `read1_trimmed_files` (Array[File])
  * `read2_trimmed_files` (Array[File])
  * `stats_files` (Array[File])
  * `log_files` (Array[File])
  * `err_files` (Array[File])
  * `versions` (Array[String])
  * `pipeline_dates` (Array[String])
