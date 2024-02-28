
## task_fastqc

### Inputs

#### Required

  * `forwardReads` (File, **required**); **description**: fastq file with forward reads.; **category**: required
  * `reverseReads` (File, **required**); **description**: fastq file with reverse reads.; **category**: required

#### Optional

  * `adapters` (File?); **description**: tsv file with adapter names in column 1 and sequences in column 2.; **category**: optional
  * `contaminants` (File?); **description**: tsv file with adapter names in column 1 and sequences in column 2.; **category**: optional
  * `limits` (File?); **description**: File with a set of warn/error limits for the various modules; **category**: optional

#### Defaults

  * `docker` (String, default="staphb/fastqc:0.12.1"); **description**: The docker image used for this task.; **category**: advanced
  * `memory` (String, default="8GB"); **description**: The amount of memory this job will use.; **category**: advanced
  * `threads` (Int, default=1); **description**: Number of cpus for this process.; **category**: optional

### Outputs

  * `forwardHtml` (File)
  * `reverseHtml` (File)
  * `forwardZip` (File)
  * `reverseZip` (File)
  * `forwardData` (File)
  * `reverseData` (File)
  * `forwardSummary` (File)
  * `reverseSummary` (File)
  * `numberForwardReads` (Int)
  * `numberReverseReads` (Int)
