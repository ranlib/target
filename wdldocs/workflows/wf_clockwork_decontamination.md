
## wf_clockwork_decontamination

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## clockwork decontamination workflow 
 This is from the clockwork TB profiler: https://github.com/iqbal-lab-org/clockwork.

### Inputs

#### Required

  * `input_reads_1` (File, **required**); **description**: fastq file with forward reads.; **category**: required
  * `input_reads_2` (File, **required**); **description**: fastq file with reverse reads.; **category**: required
  * `metadata_file` (File, **required**); **description**: tsv file with information about contaminants to check against, for example: 
 https://raw.githubusercontent.com/CDCgov/NCHHSTP-DTBE-Varpipe-WGS/master/tools/clockwork-0.11.3/OUT/remove_contam_metadata.tsv; **category**: required
  * `reference` (File, **required**); **description**: Multi-fasta file of sequences that could be contaminants.; **category**: required
  * `samplename` (String, **required**); **description**: Name of the sample.; **category**: required

#### Defaults

  * `disk_size` (Int, default=100)
  * `memory` (String, default="64GB")
  * `output_bam` (String, default=samplename + "_clockwork_decontamination.bam"); **description**: Name for output alignement file of alignment procedure, aligner is minimap2.; **category**: optional
  * `output_file` (String, default=samplename + "_clockwork_decontamination_stats.txt"); **description**: Name for file with decontamination statistics.; **category**: optional
  * `output_reads_1` (String, default=samplename + "_clockwork_cleaned_1.fq.gz"); **description**: Name of cleaned output fastq file for forward reads.; **category**: optional
  * `output_reads_2` (String, default=samplename + "_clockwork_cleaned_2.fq.gz"); **description**: Name of cleaned output fastq file for reverse reads.; **category**: optional
  * `threads` (Int, default=1)
  * `map_reads.disk_size` (Int, default=100)
  * `map_reads.docker` (String, default="dbest/clockwork:v1.0.0")
  * `remove_contam.disk_size` (Int, default=100)
  * `remove_contam.docker` (String, default="dbest/clockwork:v1.0.0")

### Outputs

  * `stats` (File)
  * `clean_reads_1` (File)
  * `clean_reads_2` (File)
