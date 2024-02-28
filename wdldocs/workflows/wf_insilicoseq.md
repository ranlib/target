
## wf_insilicoseq

### Inputs

#### Required

  * `genomes` (File, **required**)
  * `model` (String, **required**)
  * `n_reads` (String, **required**)
  * `output_basename` (String, **required**)

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

  * `cpus` (Int, default=1)
  * `debug` (Boolean, default=false)
  * `gc_bias` (Boolean, default=false)
  * `mode` (String, default="kde")
  * `quiet` (Boolean, default=false)
  * `seed` (Int, default=12345)
  * `task_insilicoseq.quiet` (Boolean, default=false)

### Outputs

  * `generated_reads` (Array[File])
