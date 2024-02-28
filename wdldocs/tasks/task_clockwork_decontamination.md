
## map_reads

### Inputs

#### Required

  * `input_reads_1` (File, **required**)
  * `input_reads_2` (File, **required**)
  * `output_bam` (String, **required**)
  * `reference` (File, **required**)
  * `samplename` (String, **required**)

#### Defaults

  * `disk_size` (Int, default=100)
  * `docker` (String, default="dbest/clockwork:v1.0.0")
  * `memory` (String, default="32GB")
  * `threads` (Int, default=1)

### Outputs

  * `bam_file` (File)

## remove_contam

### Inputs

#### Required

  * `input_bam` (File, **required**)
  * `metadata_file` (File, **required**)
  * `output_file` (String, **required**)
  * `output_reads_1` (String, **required**)
  * `output_reads_2` (String, **required**)

#### Defaults

  * `disk_size` (Int, default=100)
  * `docker` (String, default="dbest/clockwork:v1.0.0")
  * `memory` (String, default="32GB")

### Outputs

  * `removed_contam_file` (File)
  * `cleaned_reads_1` (File)
  * `cleaned_reads_2` (File)
