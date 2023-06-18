version 1.0

task task_tbprofiler {
  input {
    File read1
    File? read2
    String samplename
    String tbprofiler_docker_image = "staphb/tbprofiler:4.4.2"
    String mapper = "bwa"
    String caller = "bcftools"
    Int min_depth = 10
    Float min_af = 0.1
    Float min_af_pred = 0.1
    Int cov_frac_threshold = 1
    Int cpu = 1
    Boolean no_trim = false
  }
  command {
    tb-profiler profile \
    ~{true="--no_trim" false="" no_trim} \
    --read1 ~{read1} \
    --read2 ~{read2} \
    --threads ~{cpu} \
    --prefix ~{samplename} \
    --mapper ~{mapper} \
    --caller ~{caller} \
    --min_depth ~{min_depth} \
    --af ~{min_af} \
    --reporting_af ~{min_af_pred} \
    --coverage_fraction_threshold ~{cov_frac_threshold} \
    --csv --txt

    #Collate results
    #tb-profiler collate --prefix ~{samplename}
  }
  output {
    File csv = "./results/~{samplename}.results.csv"
    File tsv = "./results/~{samplename}.results.txt"
    File bam = "./bam/~{samplename}.bam"
    File bai = "./bam/~{samplename}.bam.bai"
    File vcf = "./vcf/~{samplename}.targets.csq.vcf.gz"
    File bcf = "./vcf/~{samplename}.delly.bcf"
  }
  runtime {
    docker: "~{tbprofiler_docker_image}"
    memory: "16 GB"
    cpu: cpu
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

