
## task_variant_interpretation

### Inputs

#### Required

  * `bai` (File, **required**)
  * `bam` (File, **required**)
  * `bed` (File, **required**)
  * `json` (File, **required**)
  * `samplename` (String, **required**)
  * `vcf` (File, **required**)

#### Defaults

  * `debug` (Boolean, default=true)
  * `docker` (String, default="dbest/variant_interpretation:v1.4.0")
  * `filter_genes` (Boolean, default=true)
  * `filter_variants` (Boolean, default=false)
  * `memory` (String, default="8GB")
  * `minimum_allele_percentage` (Float, default=10)
  * `minimum_coverage` (Int, default=10)
  * `minimum_total_depth` (Int, default=10)
  * `minimum_variant_depth` (Int, default=10)
  * `report` (String, default="variant_interpretation.tsv")
  * `verbose` (Boolean, default=false)

### Outputs

  * `interpretation_report` (File)
  * `interpretation_log` (File)
