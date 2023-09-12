version 1.0

import "./task_concatenate_tsv_files.wdl" as concat_tsv

workflow wf_concatenate_tsv_files {
  input {
    Array[File] input_files
  }

  call concat_tsv.task_concatenate_tsv_files {
    input: 
    input_files = input_files
  }

  output {
    File? tsv = task_concatenate_tsv_files.tsv
  }
}
