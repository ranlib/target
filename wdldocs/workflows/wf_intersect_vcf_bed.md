
## wf_intersect_vcf_bed

### Inputs

#### Required

  * `bed` (File, **required**)
  * `vcf` (File, **required**)

#### Defaults

  * `task_intersect_vcf_bed.docker` (String, default="staphb/bedtools:2.31.0")
  * `task_intersect_vcf_bed.intersected_vcf` (String, default="intersected.vcf")

### Outputs

  * `intersected_vcf` (File)
