version 1.0

task VariantCall {
  input {
    String sampleName
    String reference
    String outputPrefix
    File read1
    File read2
    Int threads = 10
  }
  
  command {
    clockwork reference_prepare --outdir Ref.H37Rv ~{reference}
    clockwork variant_call_one_sample --debug --force --threads \
    --sample_name ${sampleName} Ref.H37Rv ${outputPrefix} \
    ${read1} ${read2}
  }

  output {
    Array[File]? outputs = glob("${outputPrefix}/*")
  }

  runtime {
    docker: "dbest/clockwork:v1.0.0"
    memory: "10GB"
    cpu: threads
  }
}

workflow VariantCallingWorkflow {
  input {
    String sampleName
    String reference
    String outputPrefix
    File read1
    File read2
  }

  call VariantCall {
    input:
    sampleName = sampleName,
    reference = reference,
    outputPrefix = outputPrefix,
    read1 = read1,
    read2 = read2
  }

  output {
    Array[File]? outputs = VariantCall.outputs
  }
}
