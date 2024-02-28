
## wf_lineage

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## lineage caller 
 Determinate TB lineage based on SNPs.

### Inputs

#### Required

  * `lineage_markers` (File, **required**); **description**: tsv file with columns Lineage, Position, Ref, Alt; **category**: required
  * `samplename` (String, **required**); **description**: sample name.; **category**: required
  * `vcf` (File, **required**); **description**: vcf file or compressed vcf file (suffix vcf.gz); **category**: required

#### Defaults

  * `lineage_docker` (String, default="dbest/lineage:v1.0.0"); **description**: docker image to be used for CDC lineage caller; **category**: optional
  * `lineage_report_name` (String, default="lineage_report.tsv"); **description**: filename for output lineage report; **category**: optional
  * `snpit_docker` (String, default="valleema/snpit:1.1"); **description**: docker image to be used for snpit lineage caller; **category**: optional

### Outputs

  * `lineage_report` (File)
  * `snpit_log` (File)
