
## task_freebayes

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## Variant calling with freebayes

### Inputs

#### Required

  * `bam_file` (File, **required**): Sorted BAM file.
  * `bam_idx_file` (File, **required**): Sorted BAM index file.
  * `reference` (File, **required**): Reference sequence file.
  * `reference_idx` (File, **required**): Reference sequence index (.fai).
  * `sample_id` (String, **required**)

#### Optional

  * `freebayes` (File?)
  * `intervals` (File?): One or more genomic intervals over which to operate.

#### Defaults

  * `cpu` (Int, default=1): Number of CPUs to use at runtime.
  * `memory` (Float, default=12): GB of RAM to use at runtime.
  * `modules` (Array[String], default=[])
  * `output_filename` (String, default=sample_id + '.freebayes.vcf')
  * `userString` (String, default="-4 -q 15 -F 0.03"): An optional parameter which allows the user to specify additions to the command line at run time.

### Outputs

  * `vcf_file` (File)
