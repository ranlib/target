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
SAMPL=ERR552797

FASTQ=$HOME/Analysis/varpipe4/data
R1=$FASTQ/ERR552797_30percent_1.fq.gz
R2=$FASTQ/ERR552797_30percent_2.fq.gz
NAME="NC_000962.3"
REF="../references/NC_000962.3/NC_000962.3.fasta"
#CONFIG=snp.config
CONFIG=snp_home.config
SNPEFF_DB=$HOME/Analysis/varpipe4/snpEff_database/snpEff.zip
SNPEFF_CONFIG=$HOME/Analysis/varpipe4/snpEff_database/snpEff.config

if [ "$MODE" = "conda" ] ; then
    time ../tools/Varpipeline.py \
	 --fastq $R1 --fastq2 $R2 \
	 --reference $REF \
	 --genome $NAME \
	 --name $SAMPL \
	 --outdir $SAMPL \
	 --config $CONFIG \
	 --annotation \
	 --database $SNPEFF_DB \
	 --snpEff_config $SNPEFF_CONFIG \
	 --verbose \
	 --threads 4 \
	 --whole_genome
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

SNPEFF=$HOME/Analysis/varpipe4/snpEff_database
SNPEFF_C=/mnt/snpEff_database
SNPEFF_CONFIG_C=$SNPEFF_C/snpEff.config
SNPEFF_ZIP_C=$SNPEFF_C/snpEff.zip

DATA=$HOME/Analysis/varpipe4/tests
WRK=/mnt/data

if [ "$MODE" = "docker" ] ; then
    time docker run --rm -u $(id -u):$(id -u) -v $FASTQ:$FSQ -v $REFERENCE:$REF -v $CONFIG:$CFG -v $SNPEFF:$SNPEFF_C -v $DATA:$WRK -w $WRK dbest/varpipe4:v2.0.0 Varpipeline.py \
	   --fastq $R1 --fastq2 $R2 \
	   --reference $FASTA \
	   --genome $NAME \
	   --name $SAMPL \
	   --outdir $SAMPL \
	   --config $CONF \
	   --database $SNPEFF_ZIP_C \
	   --snpEff_config $SNPEFF_CONFIG_C \
	   --verbose --annotation --threads 4 \
	   --keepfiles --no_trim --whole_genome
    
    #docker run --rm -v $FASTQ:$FSQ -v $REFERENCE:$REF -v $CONFIG:$CFG -v $DATA:$WRK -w $WRK -it dbest/varpipe4:latest
fi

#
# run WDL script via miniwdl
#
if [ "$MODE" = "wdl" ] ; then
    time miniwdl run --debug --dir varpipe ../scripts/wf_varpipe.wdl -i ../scripts/wf_varpipe.json
fi

#
# run WDL script via cromwell
#
if [ "$MODE" = "cromwell" ] ; then
    #time java -jar $HOME/Software/cromwell-85.jar run ../scripts/wf_varpipe.wdl -i ../scripts/wf_varpipe.json
    time java -Dconfig.file=cromwell.config -jar $HOME/Software/cromwell-85.jar run ../scripts/wf_varpipe.wdl -i ../scripts/wf_varpipe.json
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
#java -jar ~/Software/cromwell-85.jar run wf_concatenate_fastq.wdl -i wf_concatenate_fastq.json

#
# run Multiple QC
#
if [ "$MODE" = "QC" ] ; then
    # make json file from yaml file
    #python -c 'import sys, yaml, json; from yaml import Loader; print(json.dumps(yaml.load(sys.stdin.read(), Loader=Loader),indent=4))' < wf_collect_multiple_metrics.yaml > wf_collect_multiple_metrics.json
    miniwdl run ../scripts/wf_collect_multiple_metrics.wdl --verbose -i ../scripts/wf_collect_multiple_metrics.json

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

if [ "$MODE" = "fastqc" ] ; then
    docker run --rm -u $(id -u):$(id -u) -v $PWD:/mnt -w /mnt staphb/fastqc fastqc ERR552797_30percent_1.fq.gz ERR552797_30percent_2.fq.gz --outdir fastqc_dir --extract -t 4 
fi

exit 0

