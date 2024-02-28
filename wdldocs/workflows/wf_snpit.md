
## wf_snpit

### Inputs

#### Required

  * `vcfs` (Array[File]+, **required**)

#### Defaults

  * `docker` (String, default="valleema/snpit:1.1")

### Outputs

  * `snpit_log` (Array[File])
  * `snpit_lines_array` (Array[Array[String]])
  * `snpit_species_array` (Array[Array[String]])
  * `snpit_lineage_array` (Array[Array[Array[String]]])

## summary

### Inputs

#### Required

  * `lines` (Array[Array[Array[String]]], **required**)

### Outputs
**None**
