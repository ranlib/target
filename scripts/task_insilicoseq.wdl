version 1.0

task task_insilicoseq {
  input {
    File genomes
    String mode = "kde"
    String model
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
    Boolean debug = false
    Boolean quiet = false
    Boolean gc_bias = false
    String output_basename
  }
  #
  #  --n_genomes ${n_genomes} \
  #    ${"--ncbi " + ncbi.join(" ") if ncbi else ""} \
  #    ${"--n_genomes_ncbi " + n_genomes_ncbi.join(" ") if n_genomes_ncbi else ""} \
  #    ${"--abundance " + abundance if abundance else ""} \
  #    ${"--abundance_file " + abundance_file if abundance_file else ""} \
  #    ${"--coverage " + coverage if coverage else ""} \
  #    ${"--coverage_file " + coverage_file if coverage_file else ""} \
  #    

  command {
    iss generate \
    --genomes ${genomes} \
    --mode ${mode} \
    --model ${model} \
    --n_reads ${n_reads} \
    --cpus ${cpus} \
    --seed ${seed} \
    --compress \
    ${true="--debug" false="" debug} \
    ${true="--quiet" false="" quiet} \
    ${true="--gc_bias" false="" gc_bias} \
    --output ${output_basename}
  }

  output {
    Array[File] output_files = glob("${output_basename}*.fastq.gz")
  }

  runtime {
    docker: "hadrieng/insilicoseq"
  }
}
