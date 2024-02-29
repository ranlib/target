version 1.0

task task_freebayes {
  input {
    File ? freebayes

    File reference
    File reference_idx

    File ? intervals

    String sample_id
    File bam_file
    File bam_idx_file

    String userString = "-4 -q 15 -F 0.03"

    Array[String] modules = []
    Float memory = 12
    Int cpu = 1

    String output_filename = sample_id + '.freebayes.vcf'
  }

  command {
    set -Eeuxo pipefail;
    freebayes \
      -f ~{reference} \
      ~{"-t " + intervals} \
      ~{bam_file} \
      ~{userString} \
      -v ~{output_filename}
  }

  output {
    File vcf_file = "~{output_filename}"
  }

  runtime {
    docker: "bmslab/freebayes:latest"
    memory: memory + " GB"
    cpu: cpu
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Variant calling with freebayes"
  }

  parameter_meta {
    reference: "Reference sequence file."
    reference_idx: "Reference sequence index (.fai)."
    intervals: "One or more genomic intervals over which to operate."
    bam_file: "Sorted BAM file."
    bam_idx_file: "Sorted BAM index file."
    userString: "An optional parameter which allows the user to specify additions to the command line at run time."
    memory: "GB of RAM to use at runtime."
    cpu: "Number of CPUs to use at runtime."
  }

}
