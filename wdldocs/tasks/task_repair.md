
## task_repair

### Inputs

#### Required

  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `samplename` (String, **required**)

#### Defaults

  * `docker` (String, default="staphb/bbtools:39.01")
  * `memory` (String, default="8GB")

### Outputs

  * `repaired_out1` (File)
  * `repaired_out2` (File)
  * `repaired_singletons` (File)
