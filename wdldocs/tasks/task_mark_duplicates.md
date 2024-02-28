
## task_mark_duplicates

### Inputs

#### Required

  * `bam` (File, **required**)

#### Optional

  * `marked_bam` (String?)
  * `reference` (File?)

#### Defaults

  * `do_add_pg_tag_to_read` (Boolean, default=false)
  * `do_remove_duplicates` (Boolean, default=false)
  * `do_remove_sequencing_duplicates` (Boolean, default=false)
  * `docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `memory` (String, default="8GB")
  * `metrics_txt` (String, default="mark_duplicates_metrics.txt")

### Outputs

  * `output_marked_bam` (File)
  * `output_marked_metrics_txt` (File)
