
## task_lineage

### Inputs

#### Required

  * `lineage_markers` (File, **required**)
  * `samplename` (String, **required**)
  * `vcf` (File, **required**)

#### Defaults

  * `docker` (String, default="dbest/lineage:v1.0.0")
  * `lineage_report_name` (String, default="lineage.tsv")

### Outputs

  * `lineage_report` (File)
