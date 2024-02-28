
## task_tbprofiler

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: London TB profiler

### Inputs

#### Required

  * `read1` (File, **required**): Forward reads in read pair
  * `samplename` (String, **required**): Sample name

#### Optional

  * `read2` (File?): Reverse reads in read pair

#### Defaults

  * `caller` (String, default="freebayes")
  * `cov_frac_threshold` (Int, default=1)
  * `docker` (String, default="staphb/tbprofiler:4.4.2")
  * `mapper` (String, default="bwa")
  * `memory` (String, default="16GB")
  * `min_af` (Float, default=0.1)
  * `min_af_pred` (Float, default=0.1)
  * `min_depth` (Int, default=10)
  * `no_trim` (Boolean, default=false)
  * `threads` (Int, default=1)

### Outputs

  * `json` (File)
  * `csv` (File)
  * `tsv` (File)
  * `bam` (File)
  * `bai` (File)
  * `vcf` (File)
  * `bcf` (File)
