version 1.0

import "./task_concatenate_csv_files.wdl" as concat_csv

workflow wf_concatenate_csv_files {
  input {
    Array[File] input_files
  }

  call concat_csv.task_concatenate_csv_files {
    input: 
    input_files = input_files
  }

  output {
    File? csv = task_concatenate_csv_files.csv
  }
}
