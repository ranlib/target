version 1.0

import "./task_insilicoseq.wdl" as iss

workflow wf_insilicoseq {
  input {
    File genomes
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
  
  call iss.task_insilicoseq {
    input:
    genomes = genomes,
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
