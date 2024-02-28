
## wf_snpEff

### Inputs

#### Required

  * `config` (File, **required**)
  * `dataDir` (File, **required**)
  * `genome` (String, **required**)
  * `vcf` (File, **required**)

#### Optional

  * `task_snpEff.upDownStreamLen` (Int?)

#### Defaults

  * `task_snpEff.csvStats` (String, default="snpEff_summary.csv")
  * `task_snpEff.docker` (String, default="dbest/snpeff:v5.2a")
  * `task_snpEff.hgvs` (Boolean, default=true)
  * `task_snpEff.lof` (Boolean, default=true)
  * `task_snpEff.memory` (String, default="9G")
  * `task_snpEff.noDownstream` (Boolean, default=false)
  * `task_snpEff.noIntergenic` (Boolean, default=false)
  * `task_snpEff.noShiftHgvs` (Boolean, default=false)
  * `task_snpEff.outputPath` (String, default="./snpeff.vcf")
  * `task_snpEff.stats` (String, default="snpEff_summary.html")

### Outputs

  * `outputVcf` (File)
  * `snpEff_summary_csv` (File)
  * `snpEff_summary_html` (File)
