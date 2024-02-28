
## wf_mutation_simulator

### Inputs

#### Required

  * `infile` (File, **required**)
  * `output_prefix` (String, **required**)

#### Defaults

  * `assembly` (String, default="Unknown")
  * `deletion` (Float, default=0)
  * `deletionBlock` (Int, default=1)
  * `deletionMaxLength` (Int, default=2)
  * `deletionMinLength` (Int, default=1)
  * `duplication` (Float, default=0)
  * `duplicationBlock` (Int, default=1)
  * `duplicationMaxLength` (Int, default=2)
  * `duplicationMinLength` (Int, default=1)
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
  * `sample` (String, default="Unknown")
  * `snp` (Float, default=0)
  * `snpBlock` (Int, default=1)
  * `species` (String, default="Unknown")
  * `transitionsTransversions` (Float, default=1)
  * `translocation` (Float, default=0)
  * `translocationBlock` (Int, default=1)
  * `translocationMaxLength` (Int, default=2)
  * `translocationMinLength` (Int, default=1)

### Outputs

  * `simulated_output` (Array[File])
