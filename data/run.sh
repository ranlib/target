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
    ../tools/Varpipeline.py -q $R1 -q2 $R2 -r $REF -g $NAME -n $SAMPL -o $SAMPL -a -v -t 8 -k -c $CONFIG
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

exit 0

