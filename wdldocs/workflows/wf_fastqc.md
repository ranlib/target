
## wf_fastqc

### Inputs

#### Required

  * `forwardReads` (File, **required**); **description**: fastq file with forward reads.; **category**: required
  * `reverseReads` (File, **required**); **description**: fastq file with reverse reads.; **category**: required

#### Optional

  * `adapters` (File?); **description**: tsv file with adapter names in column 1 and sequences in column 2.; **category**: optional
  * `contaminants` (File?); **description**: tsv file with adapter names in column 1 and sequences in column 2.; **category**: optional
  * `limits` (File?); **description**: File with a set of warn/error limits for the various modules; **category**: optional

#### Defaults

  * `threads` (Int, default=1); **description**: Number of cpus for this process.; **category**: optional
  * `task_fastqc.docker` (String, default="staphb/fastqc:0.12.1")
  * `task_fastqc.memory` (String, default="8GB")

### Outputs

  * `forwardHtml` (File)
  * `reverseHtml` (File)
  * `forwardZip` (File)
  * `reverseZip` (File)
  * `forwardSummary` (File)
  * `reverseSummary` (File)
  * `forwardData` (File)
  * `reverseData` (File)
  * `numberForwardReads` (Int)
  * `numberReverseReads` (Int)
