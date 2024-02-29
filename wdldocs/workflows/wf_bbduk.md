
## wf_bbduk

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## Decontamination with bbduk

### Inputs

#### Required

  * `forwardReads` (File, **required**); **description**: fastq file with forward reads.; **category**: required
  * `reverseReads` (File, **required**); **description**: fastq file with reverse reads.; **category**: required
  * `samplename` (String, **required**)

#### Optional

  * `contamination` (File?); **description**: Input gzipped tar file with fasta files of reference genomes for species considered contaminants.; **category**: optional

#### Defaults

  * `disk_size` (Int, default=100)
  * `memory` (String, default="6GB")
  * `threads` (Int, default=1)
  * `task_bbduk.docker` (String, default="staphb/bbtools:39.01")
  * `task_bbduk.keep` (Boolean, default=true)
  * `task_bbduk.number_of_retries` (Int, default=1)

### Outputs

  * `read1_clean` (File)
  * `read2_clean` (File)
  * `adapter_stats` (File?)
  * `phiX_stats` (File?)
  * `Covid19_stats` (File?)
  * `polyA_stats` (File?)
  * `Ecoli_stats` (File?)
  * `NZ_CP008889_stats` (File?)
  * `NZ_CP008889_plasmid_stats` (File?)
  * `pipeline_date` (String)
