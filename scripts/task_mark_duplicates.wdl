version 1.0

task task_mark_duplicates {
  input {
    File bam
    File? reference
    String? marked_bam
    String metrics_txt = "mark_duplicates_metrics.txt"
    String docker = "broadinstitute/gatk:4.4.0.0"
    String memory = "8GB"
    Boolean do_remove_duplicates = false # default
    Boolean do_remove_sequencing_duplicates = false # default
    Boolean do_add_pg_tag_to_read = false # not default
  }

  String output_bam = if defined(marked_bam) then select_first([marked_bam]) else sub(basename(bam),".bam","") + "_marked.bam"
  
  command {
    gatk MarkDuplicates \
    --INPUT ~{bam} \
    --OUTPUT ~{output_bam} \
    --REMOVE_DUPLICATES ~{do_remove_duplicates} \
    --REMOVE_SEQUENCING_DUPLICATES ~{do_remove_sequencing_duplicates} \
    --ADD_PG_TAG_TO_READS ~{do_add_pg_tag_to_read} \
    ~{true="--REFERENCE_SEQUENCE" false="" defined(reference)} ~{reference} \
    --METRICS_FILE ~{metrics_txt}
  }

  output {
    File output_marked_bam = "${output_bam}"
    File output_marked_metrics_txt = "${metrics_txt}"
  }

  runtime {
    docker: docker
    memory: memory
  }
}
