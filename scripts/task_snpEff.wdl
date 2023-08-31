version 1.0

task task_snpEff {
    input {
      File vcf
      File config
      File dataDir
      String genome
      String outputPath = "./snpeff.vcf"
      Boolean hgvs = true
      Boolean lof = true
      Boolean noDownstream = false
      Boolean noIntergenic = false
      Boolean noShiftHgvs = false
      Int? upDownStreamLen
      
      String memory = "9G"
      String javaXmx = "8G"
      String docker = "quay.io/biocontainers/snpeff:5.1d--hdfd78af_0"
    }
    
    command {
      set -ex
      mkdir -p "$(dirname ~{outputPath})"
      unzip ~{dataDir}
      snpEff ann -Xmx~{javaXmx} -XX:ParallelGCThreads=1 \
      -verbose \
      -noDownload \
      -noLog \
      -config ~{config} \
      -dataDir "$PWD"/data \
      ~{true="-hgvs" false="-noHgvs" hgvs} \
      ~{true="-lof" false="-noLof" lof} \
      ~{true="-no-downstream" false="" noDownstream} \
      ~{true="-no-intergenic" false="" noIntergenic} \
      ~{true="-noShiftHgvs" false="" noShiftHgvs} \
      ~{"-upDownStreamLen " + upDownStreamLen} \
      ~{genome} \
      ~{vcf} \
      > ~{outputPath}
      rm -r "$PWD"/data
    }
    
    output {
      File outputVcf = outputPath
    }

    runtime {
      docker: docker
      memory: memory
    }
    
}
