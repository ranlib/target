
## wf_interpretation

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## interpretation 
 This is the interpretation workflow.



### Inputs

#### Required

  * `bai` (File, **required**); **description**: bam index file output from CDC/London TB profiler pipeline.; **category**: required
  * `bam` (File, **required**); **description**: bam file output from CDC/London TB profiler pipeline.; **category**: required
  * `bed` (File, **required**); **description**: bed file with genomic intervals of interest. Note: reference name in case of London TB profiler is 'Chromosome', make sure to use correct bed file; **category**: required
  * `json` (File, **required**); **description**: json file with drug information for variants.; **category**: required
  * `lineage_information` (File, **required**)
  * `samplename` (String, **required**); **description**: sample name.; **category**: required
  * `vcf` (File, **required**); **description**: vcf file or compressed vcf file (suffix vcf.gz) output from CDC/London TB profiler pipeline.; **category**: required

#### Defaults

  * `debug` (Boolean, default=true)
  * `filter_genes` (Boolean, default=true); **description**: if true, only genes interest are written to the output tsv report.; **category**: optional
  * `filter_variants` (Boolean, default=true); **description**: if true, only variants with a PASS in the vcf filter columns are considered.; **category**: optional
  * `interpretation_docker` (String, default="dbest/variant_interpretation:v1.4.0")
  * `interpretation_memory` (String, default="8GB")
  * `interpretation_report` (String, default="variant_interpretation.tsv"); **description**: name for variant interpretation output tsv file; **category**: optional
  * `lims_docker` (String, default="dbest/lims_report:v1.0.4")
  * `lims_operator` (String, default="DB")
  * `lims_report_name` (String, default="lims_report.tsv")
  * `minimum_allele_percentage` (Float, default=10.0)
  * `minimum_coverage` (Int, default=10); **description**: minimum coverage requirement.; **category**: optional
  * `minimum_total_depth` (Int, default=10); **description**: minimum total number of reads that cover a variant requirement.; **category**: optional
  * `minimum_variant_depth` (Int, default=10); **description**: minimum number of reads that support a variant requirement.; **category**: optional
  * `verbose` (Boolean, default=false)

### Outputs

  * `lab_log` (File)
  * `lab_report` (File)
  * `lims_report` (File)
