
## wf_collect_hs_metrics

### Inputs

#### Required

  * `bait_bed` (File, **required**)
  * `bam` (File, **required**)
  * `reference` (File, **required**)
  * `target_bed` (File, **required**)

#### Optional

  * `task_mark_duplicates.marked_bam` (String?)

#### Defaults

  * `task_collect_hs_metrics.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_collect_hs_metrics.hs_metrics` (String, default="collect_hs_metrics.txt")
  * `task_collect_hs_metrics.memory` (String, default="8GB")
  * `task_mark_duplicates.do_add_pg_tag_to_read` (Boolean, default=false)
  * `task_mark_duplicates.do_remove_duplicates` (Boolean, default=false)
  * `task_mark_duplicates.do_remove_sequencing_duplicates` (Boolean, default=false)
  * `task_mark_duplicates.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_mark_duplicates.memory` (String, default="8GB")
  * `task_mark_duplicates.metrics_txt` (String, default="mark_duplicates_metrics.txt")

### Outputs

  * `collect_hs_metrics` (File)
  * `output_marked_bam` (File)
  * `output_marked_metrics_txt` (File)
