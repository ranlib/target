version 1.0

task task_bracken {
    input {
      File kraken_report
      File database
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
      tar -C ${PWD}/kraken -xvf ~{database}
      if [ -s ~{kraken_report} ]
      then
          for alevel in P C O F G S S1
          do
              bracken -d ${PWD}/kraken -i ~{kraken_report} -o ~{samplename}.${alevel}.bracken.report -r ~{read_length} -l ${alevel} -t ~{threshold} &>2
          done
      else
          touch ~{samplename}.bracken.report
      fi
    >>>

    output {
      Array[File] bracken_report = glob("${samplename}.*.bracken.report")
    }
    
    runtime {
      docker: docker
      memory: memory
      disks: "local-disk " + disk_size + " SSD"
    }
}

