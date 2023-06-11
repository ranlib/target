#!/bin/bash

if [ $# -eq 0 ] ; then
    echo "Usage: run.sh <MODE>"
    echo "MODE = conda | docker | wdl"
    exit 1
fi
MODE=$1

#
# run varpipe
#
#FASTQ=$HOME/Analysis/wgs_pipeline/data/
FASTQ=$PWD
R1=$FASTQ/ERR552797_30percent_1.fq.gz
R2=$FASTQ/ERR552797_30percent_2.fq.gz
SAMPL=ERR552797
NAME="NC_000962.3"
REF="../references/NC_000962.3/NC_000962.3.fasta"
CONFIG="../configuration/snp.config"

if [ "$MODE" = "conda" ] ; then
    ../tools/Varpipeline.py -q $R1 -q2 $R2 -r $REF -g $NAME -n $SAMPL -o $SAMPL -a -v -t 4 -k -c $CONFIG
fi

#
# run Docker varpipe
#
FASTQ=$HOME/Analysis/varpipe4/data
FSQ=/mnt/fastq
R1=$FSQ/ERR552797_30percent_1.fq.gz
R2=$FSQ/ERR552797_30percent_2.fq.gz

REFERENCE=$HOME/Analysis/varpipe4/references/NC_000962.3
REF=/mnt/ref
FASTA=$REF/NC_000962.3.fasta

CONFIG=$HOME/Analysis/varpipe4/configuration
CFG=/mnt/config
CONF=$CFG/snp_docker.config

DATA=$HOME/Analysis/varpipe4/data
WRK=/mnt/data

if [ "$MODE" = "docker" ] ; then
    docker run --rm -v $FASTQ:$FSQ -v $REFERENCE:$REF -v $CONFIG:$CFG -v $DATA:$WRK -w $WRK dbest/varpipe4:latest Varpipeline.py -q $R1 -q2 $R2 -r $FASTA -g $NAME -n $SAMPL -o $SAMPL -v -a -t 8 -k -c $CONF
    #docker run --rm -v $FASTQ:$FSQ -v $REFERENCE:$REF -v $CONFIG:$CFG -v $DATA:$WRK -w $WRK -it dbest/varpipe4:latest
fi

#
# run WDL script via miniwdl
#
if [ "$MODE" = "wdl" ] ; then
    miniwdl run varpipe.wdl -i varpipe.yaml
fi

#
# run WDL script via cromwell
#
if [ "$MODE" = "cromwell" ] ; then
    java -jar $HOME/Software/cromwell-85.jar run varpipe.wdl -i varpipe.json
fi

#
# run WGS QC
#
#miniwdl run wf_collect_wgs_metrics.wdl --verbose -i wf_collect_wgs_metrics.yaml

#
# split fastq files
#
#fastqsplitter -i ERR552797_30percent_1.fq.gz -o 1_1.fq.gz -o 2_1.fq.gz -o 3_1.fq.gz
#fastqsplitter -i ERR552797_30percent_2.fq.gz -o 1_2.fq.gz -o 2_2.fq.gz -o 3_2.fq.gz

#
# concatenate fastq files
#
# generate sample json file for inputs
#java -jar ~/Software/womtool-85.jar inputs wf_concatenate_fastq.wdl
# check wdl syntax
#java -jar ~/Software/womtool-85.jar validate wf_concatenate_fastq.wdl
#miniwdl check wf_concatenate_fastq.wdl --suppress CommandShellCheck
# convert json --> yaml
#python -c 'import sys, yaml, json; print(yaml.dump(json.loads(sys.stdin.read())))' < wf_concatenate_fastq.json
# run concatentation
#miniwdl run wf_concatenate_fastq.wdl -i wf_concatenate_fastq.json

#
# run Multiple QC
#
if [ "$MODE" = "QC" ] ; then
    # make json file from yaml file
    #python -c 'import sys, yaml, json; from yaml import Loader; print(json.dumps(yaml.load(sys.stdin.read(), Loader=Loader),indent=4))' < wf_collect_multiple_metrics.yaml > wf_collect_multiple_metrics.json
    miniwdl run wf_collect_multiple_metrics.wdl --verbose -i wf_collect_multiple_metrics.yaml

    # inputBam="/home/dieterbest/Analysis/varpipe4/data/ERR552797_conda_before/ERR552797_sdrcsm.bam"
    # reference="/home/dieterbest/Analysis/varpipe4/references/NC_000962.3/NC_000962.3.fasta"
    # outputBasename="multiple_metrics"
    
    # gatk CollectMultipleMetrics \
    # 	 -I ${inputBam} \
    # 	 -R ${reference} \
    # 	 -O ${outputBasename} \
    # 	 --PROGRAM CollectAlignmentSummaryMetrics \
    # 	 --PROGRAM CollectInsertSizeMetrics \
    # 	 --PROGRAM QualityScoreDistribution \
    # 	 --PROGRAM MeanQualityByCycle \
    # 	 --PROGRAM CollectBaseDistributionByCycle \
    # 	 --PROGRAM CollectGcBiasMetrics \
    # 	 --PROGRAM CollectSequencingArtifactMetrics \
    # 	 --PROGRAM CollectQualityYieldMetrics
fi

exit 0

