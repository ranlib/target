version 1.0

task task_fastqc {
  input {
    File forwardReads
    File reverseReads
    File? adapters
    File? contaminants
    Int threads = 1
    String docker = "staphb/fastqc:0.12.1"
  }

  String forwardName = sub(sub(basename(forwardReads),".fastq.gz$",""),".fq.gz$","")
  String reverseName = sub(sub(basename(reverseReads),".fastq.gz$",""),".fq.gz$","")
  String tempForwardData = forwardName + "_fastqc/fastqc_data.txt"
  String tempReverseData = reverseName + "_fastqc/fastqc_data.txt"
  
  Int do_adapters = if defined(adapters) then 1 else 0
  Int do_contaminants = if defined(contaminants) then 1 else 0

  command <<<
    set -x
    if (( ~{do_adapters} && ~{do_contaminants} )) ; then
    # assume adapters input file is a gzipped fasta file
    zcat ~{adapters} | awk 'BEGIN{RS=">"; OFS="\t"}{print $1,$2}' > adapters.tsv 
    # assume contaminants input file is a gzipped fasta file
    zcat ~{contaminants} | awk 'BEGIN{RS=">";OFS="\t"}{print $1,$2}' > contaminants.tsv 
    fastqc ~{forwardReads} ~{reverseReads} --outdir "." --extract --threads ~{threads} --adapters ~{adapters} --contaminants ~{contaminants}

    elif (( ~{do_adapters} )) ; then
    # assume adapters input file is a gzipped fasta file
    zcat ~{adapters} | awk 'BEGIN{RS=">"; OFS="\t"}{print $1,$2}' > adapters.tsv 
    fastqc ~{forwardReads} ~{reverseReads} --outdir "." --extract --threads ~{threads} adapters.tsv 

    elif (( ~{do_contaminants} )) ; then
    # assume contaminants input file is a gzipped fasta file
    zcat ~{contaminants} | awk 'BEGIN{RS=">";OFS="\t"}{print $1,$2}' > contaminants.tsv 
    fastqc ~{forwardReads} ~{reverseReads} --outdir "." --extract --threads ~{threads} --contaminants contaminants.tsv

    else
    fastqc ~{forwardReads} ~{reverseReads} --outdir "." --extract --threads ~{threads}
    fi

    grep 'Total Sequences' "~{tempForwardData}" | cut -f 2 1> NUMBER_FORWARD_SEQUENCES
    grep 'Total Sequences' "~{tempReverseData}" | cut -f 2 1> NUMBER_REVERSE_SEQUENCES
  >>>

  output {
    File forwardHtml = forwardName + "_fastqc.html"
    File reverseHtml = reverseName + "_fastqc.html"
    File forwardZip = forwardName + "_fastqc.zip"
    File reverseZip = reverseName + "_fastqc.zip"
    File forwardData = forwardName + "_fastqc/fastqc_data.txt"
    File reverseData = reverseName + "_fastqc/fastqc_data.txt"
    File forwardSummary = forwardName + "_fastqc/summary.txt"
    File reverseSummary = reverseName + "_fastqc/summary.txt"
    Int numberForwardReads = read_int("NUMBER_FORWARD_SEQUENCES")
    Int numberReverseReads = read_int("NUMBER_REVERSE_SEQUENCES")
  }
  
  runtime {
    docker: "~{docker}"
    cpu: threads
  }
  
}


