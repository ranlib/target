version 1.0

import "./task_repair.wdl" as repair

workflow wf_repair {
  input {
    File read1
    File read2
    String samplename
  }

  call repair.task_repair {
    input:
      read1 = read1,
      read2 = read2,
      samplename = samplename
  }

  output {
    File repaired_read1 = task_repair.repaired_out1
    File repaired_read2 = task_repair.repaired_out2
    File repaired_singletons = task_repair.repaired_singletons
  }
}
