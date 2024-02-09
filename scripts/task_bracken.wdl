version 1.0

task task_bracken {
    input {
      File kraken_report
      Array[File]+ indexFiles
      String docker = "staphb/bracken"
      String memory = "250GB"
      String samplename
      String level = "S"
      Int read_length = 150
      Int threshold = 10
      Int disk_size= 100
    }

    command <<<
      set -x
      mkdir -p ${PWD}/kraken
      for file in ~{sep=" " indexFiles}
      do
      ln -s ${file} ${PWD}/kraken/"$(basename ${file})"
      done
      if [ -s ~{kraken_report} ]
      then
      bracken -d ${PWD}/kraken -i ~{kraken_report} -o ~{samplename}.bracken.report -r ~{read_length} -l ~{level} -t ~{threshold} &>2
      else
      touch ~{samplename}.bracken.report
      fi
    >>>

    output {
      File bracken_report = "${samplename}.bracken.report"
    }
    
    runtime {
      docker: docker
      memory: memory
      disks: "local-disk " + disk_size + " SSD"
    }
}

