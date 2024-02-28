
## task_snpEff

### Inputs

#### Required

  * `config` (File, **required**)
  * `dataDir` (File, **required**)
  * `genome` (String, **required**)
  * `vcf` (File, **required**)

#### Optional

  * `upDownStreamLen` (Int?)

#### Defaults

  * `csvStats` (String, default="snpEff_summary.csv")
  * `docker` (String, default="dbest/snpeff:v5.2a")
  * `hgvs` (Boolean, default=true)
  * `lof` (Boolean, default=true)
  * `memory` (String, default="9G")
  * `noDownstream` (Boolean, default=false)
  * `noIntergenic` (Boolean, default=false)
  * `noShiftHgvs` (Boolean, default=false)
  * `outputPath` (String, default="./snpeff.vcf")
  * `stats` (String, default="snpEff_summary.html")

### Outputs

  * `outputVcf` (File)
  * `snpEff_summary_csv` (File)
  * `snpEff_summary_html` (File)
