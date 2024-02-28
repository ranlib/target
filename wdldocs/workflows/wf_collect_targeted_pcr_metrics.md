
## wf_collect_targeted_pcr_metrics

### Inputs

#### Required

  * `amplicon_bed` (File, **required**)
  * `bam` (File, **required**)
  * `reference` (File, **required**)
  * `target_bed` (File, **required**)

#### Optional

  * `task_mark_duplicates.marked_bam` (String?)

#### Defaults

  * `task_collect_targeted_pcr_metrics.clip_overlapping_reads` (Boolean, default=true)
  * `task_collect_targeted_pcr_metrics.coverage_cap` (Int, default=250)
  * `task_collect_targeted_pcr_metrics.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_collect_targeted_pcr_metrics.memory` (String, default="8GB")
  * `task_collect_targeted_pcr_metrics.minBaseQuality` (Int, default=20)
  * `task_collect_targeted_pcr_metrics.minMappingQuality` (Int, default=20)
  * `task_collect_targeted_pcr_metrics.outputMetrics` (String, default="collect_targeted_pcr_metrics.txt")
  * `task_collect_targeted_pcr_metrics.sample_size` (Int, default=10000)
  * `task_collect_targeted_pcr_metrics.sensitivityFile` (String, default="collect_targeted_pcr_sensitivity_metrics.txt")
  * `task_collect_targeted_pcr_metrics.target_coverage_file` (String, default="collect_targeted_pcr_target_coverage.txt")
  * `task_mark_duplicates.do_add_pg_tag_to_read` (Boolean, default=false)
  * `task_mark_duplicates.do_remove_duplicates` (Boolean, default=false)
  * `task_mark_duplicates.do_remove_sequencing_duplicates` (Boolean, default=false)
  * `task_mark_duplicates.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_mark_duplicates.memory` (String, default="8GB")
  * `task_mark_duplicates.metrics_txt` (String, default="mark_duplicates_metrics.txt")

### Outputs

  * `output_metrics` (File?)
  * `target_coverage` (File?)
  * `sensitivity_metrics` (File?)
  * `output_marked_bam` (File)
  * `output_marked_metrics_txt` (File)
