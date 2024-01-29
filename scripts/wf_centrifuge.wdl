version 1.0

task RunCentrifuge {
  input {
    File R1
    File R2
    String samplename
    Int threads
    String docker = "dbest/centrifuge:v1.0.4"
  }
  command <<<
    set -x
    centrifuge -x hpvc --threads ~{threads} -1 ~{R1} -2 ~{R2} --report-file ~{samplename}.centrifuge.summary.report.tsv -S ~{samplename}.centrifuge.classification.tsv
  >>>
  output {
    File classificationTSV = "${samplename}.centrifuge.classification.tsv"
    File summaryReportTSV = "${samplename}.centrifuge.summary.report.tsv"
  }
  runtime {
    docker: docker
    cpu: threads
  }
}

workflow CentrifugeWorkflow {
  input {
    File R1
    File R2
    String samplename
    Int threads
  }
  call RunCentrifuge {
    input:
      R1 = R1,
      R2 = R2,
      samplename = samplename,
      threads = threads
  }
  output {
    File classificationTSV = RunCentrifuge.classificationTSV
    File summaryReportTSV = RunCentrifuge.summaryReportTSV
  }
}
