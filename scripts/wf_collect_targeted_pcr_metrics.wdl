version 1.0

import "./task_collect_targeted_pcr_metrics.wdl" as tpcrm
import "./task_mark_duplicates.wdl" as md

workflow wf_collect_targeted_pcr_metrics {
  input {
    File bam
    File reference
    File amplicon_bed
    File target_bed
  }

  call md.task_mark_duplicates {
    input:
    reference = reference,
    bam = bam
  }


  call tpcrm.task_collect_targeted_pcr_metrics {
    input:
    bam = task_mark_duplicates.output_marked_bam,
    reference = reference,
    amplicon_bed = amplicon_bed,
    target_bed = target_bed
  }
  
  output {
    File? output_metrics = task_collect_targeted_pcr_metrics.metrics
    File? target_coverage = task_collect_targeted_pcr_metrics.target_coverage
    File? sensitivity_metrics = task_collect_targeted_pcr_metrics.collectMetricsSensitivity
    File output_marked_bam = task_mark_duplicates.output_marked_bam
    File output_marked_metrics_txt = task_mark_duplicates.output_marked_metrics_txt
  }
}
