
## wf_variant_interpretation

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## variant interpretation 
 This is the variant interpretation workflow.

 This also runs as a task in the CDC TB profiler workflow.

### Inputs

#### Required

  * `bai` (File, **required**); **description**: bam index file output from CDC/London TB profiler pipeline.; **category**: required
  * `bam` (File, **required**); **description**: bam file output from CDC/London TB profiler pipeline.; **category**: required
  * `bed` (File, **required**); **description**: bed file with genomic intervals of interest. Note: reference name in case of London TB profiler is 'Chromosome', make sure to use correct bed file; **category**: required
  * `json` (File, **required**); **description**: json file with drug information for variants.; **category**: required
  * `samplename` (String, **required**); **description**: sample name.; **category**: required
  * `vcf` (File, **required**); **description**: vcf file or compressed vcf file (suffix vcf.gz) output from CDC/London TB profiler pipeline.; **category**: required

#### Defaults

  * `docker` (String, default="dbest/variant_interpretation:v1.4.0")
  * `filter_genes` (Boolean, default=false); **description**: if true, only genes interest are written to the output tsv report.; **category**: optional
  * `filter_variants` (Boolean, default=true); **description**: if true, only variants with a PASS in the vcf filter columns are considered.; **category**: optional
  * `filtered_vcf` (String, default="filtered_vcf.vcf")
  * `memory` (String, default="8GB")
  * `minimum_coverage` (Int, default=10); **description**: minimum coverage requirement.; **category**: optional
  * `minimum_total_depth` (Int, default=0); **description**: minimum total number of reads that cover a variant requirement.; **category**: optional
  * `minimum_variant_depth` (Int, default=0); **description**: minimum number of reads that support a variant requirement.; **category**: optional
  * `report` (String, default="variant_interpretation.tsv"); **description**: name for output tsv file.; **category**: optional
  * `verbose` (Boolean, default=false)
  * `task_variant_interpretation.debug` (Boolean, default=true)
  * `task_variant_interpretation.minimum_allele_percentage` (Float, default=10)

### Outputs

  * `interpretation_report` (File)
  * `interpretation_log` (File)
