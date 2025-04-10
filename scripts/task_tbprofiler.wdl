version 1.0

task task_tbprofiler {
  input {
    File read1
    File? read2
    String samplename
    String docker = "staphb/tbprofiler:4.4.2"
    String memory = "16GB"
    String mapper = "bwa"
    String caller = "freebayes"
    Int min_depth = 10
    Float min_af = 0.1
    Float min_af_pred = 0.1
    Int cov_frac_threshold = 1
    Int threads = 1
    Boolean no_trim = false
  }
  command {
    tb-profiler profile \
    ~{true="--no_trim" false="" no_trim} \
    --read1 ~{read1} \
    --read2 ~{read2} \
    --threads ~{threads} \
    --prefix ~{samplename} \
    --mapper ~{mapper} \
    --caller ~{caller} \
    --min_depth ~{min_depth} \
    --af ~{min_af} \
    --reporting_af ~{min_af_pred} \
    --coverage_fraction_threshold ~{cov_frac_threshold} \
    --csv --txt

    gunzip "./vcf/~{samplename}.targets.csq.vcf.gz"
    #Collate results
    #tb-profiler collate --prefix ~{samplename}
  }
  output {
    File json = "./results/~{samplename}.results.json"
    File csv = "./results/~{samplename}.results.csv"
    File tsv = "./results/~{samplename}.results.txt"
    File bam = "./bam/~{samplename}.bam"
    File bai = "./bam/~{samplename}.bam.bai"
    File vcf = "./vcf/~{samplename}.targets.csq.vcf"
    File bcf = "./vcf/~{samplename}.delly.bcf"
  }
  runtime {
    docker: docker
    memory: memory
    cpu: threads
  }
  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "London TB profiler"
  }
  parameter_meta {
    # Inputs:
    read1: "Forward reads in read pair"
    read2: "Reverse reads in read pair"
    samplename: "Sample name"
  }
}

