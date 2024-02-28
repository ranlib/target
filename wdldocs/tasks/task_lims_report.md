
## task_lims_report

### Inputs

#### Required

  * `lab_report` (File, **required**)
  * `lims_report_name` (String, **required**)
  * `operator` (String, **required**)

#### Optional

  * `lineage_report` (File?)

#### Defaults

  * `docker` (String, default="dbest/lims_report:v1.0.4")

### Outputs

  * `lims_report` (File)
