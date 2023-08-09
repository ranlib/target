version 1.0

task task_bbduk {
  input {
    File read1_trimmed
    File read2_trimmed
    File? contamination
    String samplename
    String docker = "staphb/bbtools:39.01"
    String memory = "8GB"
    Boolean keep = false
    Int threads = 1
  }

  String java_mem = "-Xmx" + sub(memory,"GB","g")
  
  command <<<
    set -ex
    date | tee DATE

    repair.sh ~{java_mem} \
    in1=~{read1_trimmed} in2=~{read2_trimmed} \
    out1=~{samplename}_paired_1.fastq.gz out2=~{samplename}_paired_2.fastq.gz

    # adapters
    bbduk.sh ~{java_mem} threads=~{threads} \
    in1=~{samplename}_paired_1.fastq.gz in2=~{samplename}_paired_2.fastq.gz \
    out1=~{samplename}_no_adapter_1.fastq.gz out2=~{samplename}_no_adapter_2.fastq.gz \
    ref=/opt/bbmap/resources/adapters.fa \
    stats=~{samplename}_adapters.stats.txt \
    ktrim=r k=23 mink=11 hdist=1 tpe tbo

    # phix
    bbduk.sh ~{java_mem} threads=~{threads} \
    in1=~{samplename}_no_adapter_1.fastq.gz in2=~{samplename}_no_adapter_2.fastq.gz \
    out1=~{samplename}_no_phix_1.fastq.gz out2=~{samplename}_no_phix_2.fastq.gz \
    outm=~{samplename}_matched_phix.fq.gz \
    ref=/opt/bbmap/resources/phix174_ill.ref.fa.gz \
    k=31 hdist=1 \
    stats=~{samplename}_phix.stats.txt

    # covid
    bbduk.sh ~{java_mem} threads=~{threads} \
    in1=~{samplename}_no_phix_1.fastq.gz in2=~{samplename}_no_phix_2.fastq.gz \
    out1=~{samplename}_no_covid_1.fastq.gz out2=~{samplename}_no_covid_2.fastq.gz \
    outm=~{samplename}_matched_covid.fq.gz \
    ref=/opt/bbmap/resources/Covid19_ref.fa \
    k=31 hdist=1 \
    stats=~{samplename}_Covid19.stats.txt

    # polyA
    bbduk.sh ~{java_mem} threads=~{threads} \
    in1=~{samplename}_no_covid_1.fastq.gz in2=~{samplename}_no_covid_2.fastq.gz \
    out1=~{samplename}_no_polyA_1.fastq.gz out2=~{samplename}_no_polyA_2.fastq.gz \
    outm=~{samplename}_matched_polyA.fq.gz \
    ref=/opt/bbmap/resources/polyA.fa.gz \
    k=31 hdist=1 \
    stats=~{samplename}_polyA.stats.txt

    # additional contaminants
    if ~{defined(contamination)} ; then

    tar -xvf ~{contamination}

    if [ -f contamination/Escherichia_coli_gca_001606525.ASM160652v1.dna.toplevel.fa.gz ] ; then
    bbduk.sh ~{java_mem} threads=~{threads} \
    in1=~{samplename}_no_polyA_1.fastq.gz in2=~{samplename}_no_polyA_2.fastq.gz \
    out1=~{samplename}_clean_1.fastq.gz out2=~{samplename}_clean_2.fastq.gz \
    outm=~{samplename}_matched_Ecoli.fq.gz \
    ref=contamination/Escherichia_coli_gca_001606525.ASM160652v1.dna.toplevel.fa.gz \
    k=31 hdist=1 \
    stats=~{samplename}_Ecoli.stats.txt
    fi
    
    # cleanup
    if ! ~{keep} ; then
    rm -rv ~{contamination}
    fi

    else
    cp ~{samplename}_no_polyA_1.fastq.gz ~{samplename}_clean_1.fastq.gz
    cp ~{samplename}_no_polyA_2.fastq.gz ~{samplename}_clean_2.fastq.gz 
    fi
    # end of additional contamination
    
    # cleanup
    if ! ~{keep} ; then
    rm -v *no_adapter*.fastq.gz *no_phix*.fastq.gz *no_covid*.fastq.gz *no_polyA*.fastq.gz
    fi
  >>>

  output {
    File read1_clean = "${samplename}_clean_1.fastq.gz"
    File read2_clean = "${samplename}_clean_2.fastq.gz"
    File? phiX_stats = "${samplename}_phix.stats.txt"
    File? polyA_stats = "${samplename}_polyA.stats.txt"
    File? Ecoli_stats = "${samplename}_Ecoli.stats.txt"
    File? adapter_stats = "${samplename}_adapters.stats.txt"
    File? Covid19_stats = "${samplename}_Covid19.stats.txt"
    String pipeline_date = read_string("DATE")
  }

  runtime {
      docker: docker
      memory: memory
      cpu: threads
  }
}
