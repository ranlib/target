
## wf_repair

### Inputs

#### Required

  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `samplename` (String, **required**)

#### Defaults

  * `task_repair.docker` (String, default="staphb/bbtools:39.01")
  * `task_repair.memory` (String, default="8GB")

### Outputs

  * `repaired_read1` (File)
  * `repaired_read2` (File)
  * `repaired_singletons` (File)
