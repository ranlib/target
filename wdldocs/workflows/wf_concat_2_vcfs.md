
## wf_concat_2_vcfs

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: Concatentate 2 vcf files

### Inputs

#### Required

  * `vcf1` (File, **required**)
  * `vcf2` (File, **required**)

#### Defaults

  * `output_vcf_name` (String, default="output.vcf")
  * `task_concat_2_vcfs.docker` (String, default="staphb/bcftools:1.17")

### Outputs

  * `vcf` (File)
