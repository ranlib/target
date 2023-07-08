version 1.0

task task_mutation_simulator {
  input {
    File infile
    String output_prefix
    Float snp = 0
    Int snpBlock = 1
    Float mnp = 0
    Int mnpBlock = 1
    Int mnpMinLength = 1
    Int mnpMaxLength = 1
    Float transitionsTransversions = 1
    Float insert = 0
    Int insertMinLength = 1
    Int insertMaxLength = 2
    Int insertBlock = 1
    Float deletion = 0
    Int deletionMinLength = 1
    Int deletionMaxLength = 2
    Int deletionBlock = 1
    Float inversion = 0
    Int inversionMinLength = 2
    Int inversionMaxLength = 3
    Int inversionBlock = 1
    Float duplication = 0
    Int duplicationMinLength = 1
    Int duplicationMaxLength = 2
    Int duplicationBlock = 1
    Float translocation = 0
    Int translocationMinLength = 1
    Int translocationMaxLength = 2
    Int translocationBlock = 1
    String assembly = "Unknown"
    String species = "Unknown"
    String sample = "Unknown"
  }

  command <<<
    mutation_simulator --output ~{output_prefix} ~{infile} args \
      -sn ~{snp} \
      -snb ~{snpBlock} \
      -mn ~{mnp} \
      -mnb ~{mnpBlock} \
      -mnpmin ~{mnpMinLength} \
      -mnpmax ~{mnpMaxLength} \
      -titv ~{transitionsTransversions} \
      -in ~{insert} \
      -inmin ~{insertMinLength} \
      -inmax ~{insertMaxLength} \
      -inb ~{insertBlock} \
      -de ~{deletion} \
      -demin ~{deletionMinLength} \
      -demax ~{deletionMaxLength} \
      -deb ~{deletionBlock} \
      -iv ~{inversion} \
      -ivmin ~{inversionMinLength} \
      -ivmax ~{inversionMaxLength} \
      -ivb ~{inversionBlock} \
      -du ~{duplication} \
      -dumin ~{duplicationMinLength} \
      -dumax ~{duplicationMaxLength} \
      -dub ~{duplicationBlock} \
      -tl ~{translocation} \
      -tlmin ~{translocationMinLength} \
      -tlmax ~{translocationMaxLength} \
      -tlb ~{translocationBlock} \
      -a ~{assembly} \
      -s ~{species} \
      -n ~{sample}
  >>>

  output {
    Array[File] output_files = glob("${output_prefix}*")
  }

  runtime {
    docker: "dbest/mutation_simulator:v4.0.0"
  }
}
