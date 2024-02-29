
## wf_lims_report

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## LIMS report

### Inputs

#### Required

  * `lab_report` (File, **required**); **description**: Input laboratorian csv report; **category**: required
  * `lims_report_name` (String, **required**); **description**: Name for output LIMS report csv file; **category**: required
  * `operator` (String, **required**)

#### Optional

  * `lineage_report` (File?); **description**: Input lineage report; **category**: optional

#### Defaults

  * `task_lims_report.docker` (String, default="dbest/lims_report:v1.0.4")

### Outputs

  * `lims_report` (File)
