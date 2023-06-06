version 1.0

task RunVarpipeline {
  input {
    File R1
    File R2
    File REF
    File config
    String SAMPL
    String outdir
    String genome = "NC_000962.3"
    Int threads = 1
  }
  command {
    Varpipeline.py -q ${R1} -q2 ${R2} -r ${REF} -g ${genome} -n ${SAMPL} -t ${threads} -o ${outdir} -v -a -k -c ${config}
  }
  runtime {
    docker: "dbest/varpipe4:latest"
    cpu: 8
    memory: "10 GB"
  }
}

workflow WfVarPipeline {
  input {
    File R1
    File R2
    File REF
    File config
    String SAMPL
    String outdir
    String genome = "NC_000962"
    Int threads = 1
  }
  call RunVarpipeline {
    input:
    R1 = R1,
    R2 = R2,
    REF = REF,
    SAMPL = SAMPL,
    config = config,
    outdir = outdir,
    genome = genome,
    threads = threads
  }
}
