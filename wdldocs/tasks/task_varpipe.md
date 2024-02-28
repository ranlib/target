
## task_varpipe

### Inputs

#### Required

  * `config` (File, **required**)
  * `genome` (String, **required**)
  * `outdir` (String, **required**)
  * `read1` (File, **required**)
  * `read2` (File, **required**)
  * `reference` (File, **required**)
  * `samplename` (String, **required**)
  * `snpEff_config` (File, **required**)
  * `snpEff_database` (File, **required**)

#### Defaults

  * `disk_size` (Int, default=100)
  * `docker` (String, default="dbest/varpipe4:v2.0.3")
  * `keep` (Boolean, default=true)
  * `memory` (String, default="32GB")
  * `no_trim` (Boolean, default=true)
  * `threads` (Int, default=1)
  * `verbose` (Boolean, default=true)
  * `whole_genome` (Boolean, default=true)

### Outputs

  * `DR_loci_annotation` (File)
  * `DR_loci_Final_annotation` (File)
  * `DR_loci_raw_annotation` (File)
  * `full_annotation` (File)
  * `full_Final_annotation` (File)
  * `full_raw_annotation` (File)
  * `genome_region_coverage` (File)
  * `interpretation` (File)
  * `lineage_report` (File)
  * `Lineage` (File)
  * `log` (File)
  * `bai` (File)
  * `bam` (File)
  * `stats` (File)
  * `structural_variants` (File)
  * `summary` (File)
  * `target_region_coverage` (File)
  * `trim_log` (File?)
  * `snpEff_summary_targets` (File)
  * `snpEff_summary_full` (File?)
  * `mark_duplicates_metrics` (File)
  * `qc_log` (File)
  * `pipeline_date` (String)
