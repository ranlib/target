version 1.0

import "./task_mutation_simulator.wdl" as ms
import "./task_insilicoseq.wdl" as iss

workflow fastq_simulation {
  input {
    # ms
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
    # iss
    File? draft
    Int? n_genomes
    Array[String]? ncbi
    Array[Int]? n_genomes_ncbi
    String? abundance
    File? abundance_file
    String? coverage
    File? coverage_file
    String n_reads
    Int cpus = 1
    Int seed = 12345
    String mode = "kde"
    String model
    Boolean quiet = false
    Boolean debug = false
    Boolean gc_bias = false
    String output_basename
  }

  call ms.task_mutation_simulator {
    input:
    infile = infile,
    output_prefix = output_prefix,
    snp = snp,
    snpBlock = snpBlock,
    mnp = mnp,
    mnpBlock = mnpBlock,
    mnpMinLength = mnpMinLength,
    mnpMaxLength = mnpMaxLength,
    transitionsTransversions = transitionsTransversions,
    insert = insert,
    insertMinLength = insertMinLength,
    insertMaxLength = insertMaxLength,
    insertBlock = insertBlock,
    deletion = deletion,
    deletionMinLength = deletionMinLength,
    deletionMaxLength = deletionMaxLength,
    deletionBlock = deletionBlock,
    inversion = inversion,
    inversionMinLength = inversionMinLength,
    inversionMaxLength = inversionMaxLength,
    inversionBlock = inversionBlock,
    duplication = duplication,
    duplicationMinLength = duplicationMinLength,
    duplicationMaxLength = duplicationMaxLength,
    duplicationBlock = duplicationBlock,
    translocation = translocation,
    translocationMinLength = translocationMinLength,
    translocationMaxLength = translocationMaxLength,
    translocationBlock = translocationBlock,
    assembly = assembly,
    species = species,
    sample = sample
  }

  call iss.task_insilicoseq {
    input:
    genomes = task_mutation_simulator.output_files[0],
    mode = mode,
    model = model,
    draft = draft,
    n_genomes = n_genomes,
    ncbi = ncbi,
    n_genomes_ncbi = n_genomes_ncbi,
    abundance = abundance,
    abundance_file = abundance_file,
    coverage = coverage,
    coverage_file = coverage_file,
    n_reads = n_reads,
    cpus = cpus,
    seed = seed,
    debug = debug,
    gc_bias = gc_bias,
    output_basename = output_basename
  }

  output {
    Array[File] generated_reads = task_insilicoseq.output_files
  }
}
