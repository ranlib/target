version 1.0

task FilterMutectCalls {
    input {
        File referenceFasta
        File referenceFastaFai
        File referenceFastaDict
        File unfilteredVcf
        File unfilteredVcfIndex
        String outputVcf
        Int uniqueAltReadCount = 4
        File mutect2Stats

        File? contaminationTable
        File? mafTumorSegments
        File? artifactPriors

        String javaXmx = "12G"
        String memory = "13G"
        Int timeMinutes = 60
        String dockerImage = "broadinstitute/gatk:4.4.0.0"
    }

    command {
        set -e
        mkdir -p "$(dirname ~{outputVcf})"
        gatk --java-options '-Xmx~{javaXmx} -XX:ParallelGCThreads=1' \
        FilterMutectCalls \
        -R ~{referenceFasta} \
        -V ~{unfilteredVcf} \
        -O ~{outputVcf} \
        ~{"--contamination-table " + contaminationTable} \
        ~{"--tumor-segmentation " + mafTumorSegments} \
        ~{"--ob-priors " + artifactPriors} \
        ~{"--unique-alt-read-count " + uniqueAltReadCount} \
        ~{"-stats " + mutect2Stats} \
        --filtering-stats "filtering.stats" \
        --showHidden
    }

    output {
        File filteredVcf = outputVcf
        File filteredVcfIndex = outputVcf + ".tbi"
        File filteringStats = "filtering.stats"
    }

    runtime {
        memory: memory
        time_minutes: timeMinutes
        docker: dockerImage
    }
}

task mutect2 {
    input {
        Array[File]+ inputBams
        Array[File]+ inputBamsIndex
        File referenceFasta
        File referenceFastaDict
        File referenceFastaFai
        String outputVcf
        Array[File]+ intervals
        String javaXmx = "4G"
        String memory = "5G"
        Int timeMinutes = 240
        String dockerImage =  "broadinstitute/gatk:4.4.0.0"
    }

    command {
        set -ex
        mkdir -p "$(dirname ~{outputVcf})"
        gatk --java-options '-Xmx~{javaXmx} -XX:ParallelGCThreads=1' \
        Mutect2 \
        -R ~{referenceFasta} \
        -I ~{sep=" -I " inputBams} \
        -O ~{outputVcf} \
        -L ~{sep=" -L " intervals}
    }

    output {
      File vcfFile = outputVcf
      File vcfFileIndex = outputVcf + ".idx"
      File stats = outputVcf + ".stats"
    }

    runtime {
        memory: memory
        time_minutes: timeMinutes
        docker: dockerImage
    }

}

