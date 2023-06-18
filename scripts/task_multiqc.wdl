version 1.0

task task_multiqc {
  input {
    Array[File]? inputFiles
    String outputPrefix
  }

  command {
    for file in ~{sep=' ' inputFiles}; do
        if [ -e $file ] ; then
           cp $file .
        fi
    done
    multiqc --force --no-data-dir -n ~{outputPrefix}.multiqc .
  }

  output {
    File report = "${outputPrefix}.multiqc.html"
  }

  runtime {
    docker: "ewels/multiqc:latest"
  }
}

