
## wf_structural_variants

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: Structural variants workflow

### Inputs

#### Required

  * `bai` (File, **required**)
  * `bam` (File, **required**)
  * `config` (File, **required**)
  * `dataDir` (File, **required**)
  * `genome` (String, **required**)
  * `reference` (File, **required**)

#### Defaults

  * `delly_docker` (String, default="dbest/delly:v1.0.0")
  * `delly_memory` (String, default="32GB")
  * `hgvs` (Boolean, default=true)
  * `lof` (Boolean, default=true)
  * `noDownstream` (Boolean, default=false)
  * `noIntergenic` (Boolean, default=false)
  * `noShiftHgvs` (Boolean, default=false)
  * `output_vcf_name` (String, default="structural_variants.vcf")
  * `snpEff_docker` (String, default="dbest/snpeff:v5.2a")
  * `snpEff_memory` (String, default="9G")
  * `svType` (String, default="DEL")
  * `upDownStreamLen` (Int, default=5000)
  * `task_snpEff.csvStats` (String, default="snpEff_summary.csv")
  * `task_snpEff.stats` (String, default="snpEff_summary.html")

### Outputs

  * `vcf` (File?)
  * `vcf_annotated` (File?)
