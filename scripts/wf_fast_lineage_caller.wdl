version 1.0

import "./task_fast_lineage_caller.wdl" as flc
import "./task_concatenate_tsv_files.wdl" as concat_tsv

workflow wf_fast_lineage_caller {
  input {
    Array[File]+ input_vcfs
    String output_directory = "."
  }

  scatter (input_vcf in input_vcfs) {
    call flc.task_fast_lineage_caller {
      input:
        input_vcf = input_vcf,
        output_filename = "${output_directory}/results_${basename(input_vcf, '.vcf')}.tsv"
    }
  }

  call concat_tsv.task_concatenate_tsv_files {
    input: 
    input_files = task_fast_lineage_caller.results_tsv
  }

  output {
    Array[File] result_files = task_fast_lineage_caller.results_tsv
    Array[String] lineage_types = task_fast_lineage_caller.lineage_type
    File? tsv = task_concatenate_tsv_files.tsv
  }
}
