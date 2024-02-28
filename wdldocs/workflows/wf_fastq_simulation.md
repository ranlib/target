
## fastq_simulation

### Inputs

#### Required

  * `infile` (File, **required**)
  * `model` (String, **required**)
  * `n_reads` (String, **required**)
  * `output_basename` (String, **required**)
  * `output_prefix` (String, **required**)

#### Optional

  * `abundance` (String?)
  * `abundance_file` (File?)
  * `coverage` (String?)
  * `coverage_file` (File?)
  * `draft` (File?)
  * `n_genomes` (Int?)
  * `n_genomes_ncbi` (Array[Int]?)
  * `ncbi` (Array[String]?)

#### Defaults

  * `assembly` (String, default="Unknown")
  * `cpus` (Int, default=1)
  * `debug` (Boolean, default=false)
  * `deletion` (Float, default=0)
  * `deletionBlock` (Int, default=1)
  * `deletionMaxLength` (Int, default=2)
  * `deletionMinLength` (Int, default=1)
  * `duplication` (Float, default=0)
  * `duplicationBlock` (Int, default=1)
  * `duplicationMaxLength` (Int, default=2)
  * `duplicationMinLength` (Int, default=1)
  * `gc_bias` (Boolean, default=false)
  * `insert` (Float, default=0)
  * `insertBlock` (Int, default=1)
  * `insertMaxLength` (Int, default=2)
  * `insertMinLength` (Int, default=1)
  * `inversion` (Float, default=0)
  * `inversionBlock` (Int, default=1)
  * `inversionMaxLength` (Int, default=3)
  * `inversionMinLength` (Int, default=2)
  * `mnp` (Float, default=0)
  * `mnpBlock` (Int, default=1)
  * `mnpMaxLength` (Int, default=1)
  * `mnpMinLength` (Int, default=1)
  * `mode` (String, default="kde")
  * `quiet` (Boolean, default=false)
  * `sample` (String, default="Unknown")
  * `seed` (Int, default=12345)
  * `snp` (Float, default=0)
  * `snpBlock` (Int, default=1)
  * `species` (String, default="Unknown")
  * `transitionsTransversions` (Float, default=1)
  * `translocation` (Float, default=0)
  * `translocationBlock` (Int, default=1)
  * `translocationMaxLength` (Int, default=2)
  * `translocationMinLength` (Int, default=1)
  * `task_insilicoseq.quiet` (Boolean, default=false)

### Outputs

  * `simulated_output` (Array[File]?)
  * `generated_reads` (Array[File]?)
