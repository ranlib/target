version 1.0

import "./task_collect_hs_metrics.wdl" as hs
import "./task_mark_duplicates.wdl" as md

workflow wf_collect_hs_metrics {
  input {
    File bam
    File reference
    File bait_bed
    File target_bed
  }

  call md.task_mark_duplicates {
    input:
    reference = reference,
    bam = bam
  }

  call hs.task_collect_hs_metrics {
    input:
      bam = task_mark_duplicates.output_marked_bam,
      reference = reference,
      bait_bed = bait_bed,
      target_bed = target_bed
  }

  output {
    File collect_hs_metrics = task_collect_hs_metrics.collect_hs_metrics
    File output_marked_bam = task_mark_duplicates.output_marked_bam
    File output_marked_metrics_txt = task_mark_duplicates.output_marked_metrics_txt
  }

}
