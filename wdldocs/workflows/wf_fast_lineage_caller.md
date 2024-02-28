
## wf_fast_lineage_caller

### Inputs

#### Required

  * `input_vcfs` (Array[File]+, **required**)

#### Defaults

  * `output_directory` (String, default=".")
  * `task_concatenate_tsv_files.docker` (String, default="dbest/lims_report:v1.0.4")
  * `task_concatenate_tsv_files.output_file_name` (String, default="concatenated.tsv")
  * `task_fast_lineage_caller.docker` (String, default="dbest/fast_lineage_caller:v1.0.0")

### Outputs

  * `result_files` (Array[File])
  * `lineage_types` (Array[String])
  * `tsv` (File?)
