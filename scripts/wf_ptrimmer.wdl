version 1.0

import "./task_ptrimmer.wdl" as ptrimmer

workflow wf_ptrimmer {
  input {
    Boolean keep
    String seqtype
    File ampfile
    File read1
    File read2
    String trim1
    String trim2
    String summary = "Summary.ampcount"
    Int minqual
    Int kmer
    Int mismatch
  }
  
  call ptrimmer.task_ptrimmer {
    input:
    keep = keep,
    seqtype = seqtype,
    ampfile = ampfile,
    read1 = read1,
    trim1 = trim1,
    read2 = read2,
    trim2 = trim2,
    summary = summary,
    minqual = minqual,
    kmer = kmer,
    mismatch = mismatch
  }
  
  output {
    File trimmedRead1 = task_ptrimmer.trimmedRead1
    File trimmedRead2 =  task_ptrimmer.trimmedRead2
    File trimmingSummary =  task_ptrimmer.trimmingSummary
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## primer trimming workflow."
  }
  
  parameter_meta {
    read1: {
      description: "Input fastq files with forward reads. Can be gzipped or not.",
      category: "required"
    }
    read2: {
      description: "Input fastq files with reverse reads. Can be gzipped or not.",
      category: "required"
    }
    trim1: {
      description: "Name of output fastq files with forward reads. Must have suffix .gz",
      category: "required"
    }
    trim2: {
      description: "Name of output fastq files with reverse reads. Must have suffix .gz",
      category: "required"
    }
    keep: {
      description: "Keep the reads with no primer sequence [default: discard reads]",
      category: "required"
    }
    seqtype: {
      description: "The sequencing type [single|pair]",
      category: "required"
    }
    ampfile: {
      description: "Input primer file"
      category: "required"
    }
    summary: {
      description: "Trimming information of each amplicon [default: Summary.ampcount]",
      category: "optional"
    }
    minqual: {
      description: "the minimum average quality to keep after triming [20]",
      category: "optional"
    }
    kmer: {
      description: "kmer length for indexing [8]",
      category: "optional"
    }
    mismatch: {
      description: "Maximum number of mismatches allowed for primer sequence [3]",
      category: "optional"
    }

    # output
    trimmedRead1: {description: "Output fastq file with forward reads, gzipped, primer sequences removed"}
    trimmedRead2: {description: "Output fastq file with reverse reads, gzipped, primer sequences removed"}
    trimmingSummary: {description: "Trimming information of each amplicon"}
  }

}
