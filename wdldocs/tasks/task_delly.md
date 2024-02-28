
## task_delly

### Inputs

#### Required

  * `bamFile` (File, **required**); **description**: The bam file to process.; **category**: required
  * `bamIndex` (File, **required**); **description**: The index bam file.; **category**: required
  * `reference` (File, **required**); **description**: The reference fasta file also used for mapping.; **category**: required

#### Defaults

  * `docker` (String, default="dbest/delly:v1.0.0"); **description**: The docker image used for this task.; **category**: advanced
  * `memory` (String, default="32GB"); **description**: The memory required to run the programs.; **category**: advanced
  * `svType` (String, default="DEL"); **description**: Type of structural variant to look for.; **category**: common

### Outputs

  * `vcfFile` (File?)
