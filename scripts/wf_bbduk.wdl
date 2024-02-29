version 1.0

import "./task_bbduk.wdl" as bbduk

workflow wf_bbduk {
  input {
    File forwardReads
    File reverseReads
    File? contamination
    String samplename
    String memory = "6GB"
    Int disk_size = 100
    Int threads = 1
  }

  call bbduk.task_bbduk {
    input:
    read1_trimmed = forwardReads,
    read2_trimmed = reverseReads,
    contamination = contamination,
    samplename = samplename,
    disk_size = disk_size,	
    threads = threads,
    memory = memory
  }

  output {
    File read1_clean = task_bbduk.read1_clean
    File read2_clean = task_bbduk.read2_clean
    File? adapter_stats = task_bbduk.adapter_stats
    File? phiX_stats = task_bbduk.phiX_stats
    File? Covid19_stats = task_bbduk.Covid19_stats
    File? polyA_stats = task_bbduk.polyA_stats
    File? Ecoli_stats = task_bbduk.Ecoli_stats
    File? NZ_CP008889_stats = task_bbduk.NZ_CP008889_stats
    File? NZ_CP008889_plasmid_stats = task_bbduk.NZ_CP008889_plasmid_stats
    String pipeline_date = task_bbduk.pipeline_date
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## Decontamination with bbduk"
  }

  parameter_meta {
    ## inputs
    forwardReads: {description: "fastq file with forward reads.", category: "required"}
    reverseReads: {description: "fastq file with reverse reads.", category: "required"}
    contamination: {description: "Input gzipped tar file with fasta files of reference genomes for species considered contaminants.", category: "optional"}

    ## outputs
    read1_clean: {description: "Cleaned output fastq file for forward reads."}
    read2_clean: {description: "Cleaned output fastq file for reverse reads."}
  }
}
