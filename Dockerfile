FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

RUN apt-get update -y && apt-get install -y --no-install-recommends \
wget \
unzip \
python3 python3-pip python-is-python3 \
r-base-core \
default-jre \
samtools \
bwa \
bedtools \
&& rm -rf /var/lib/apt/lists/*

RUN pip install pyyaml fpdf

RUN wget -q https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip && unzip Trimmomatic-0.39.zip Trimmomatic-0.39/trimmomatic-0.39.jar && rm Trimmomatic-0.39.zip
RUN printf '#!/bin/bash \njava -jar /Trimmomatic-0.39/trimmomatic-0.39.jar "$@"\n' > /usr/local/bin/trimmomatic && chmod ogu+x /usr/local/bin/trimmomatic

RUN wget -q https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip && unzip snpEff_latest_core.zip snpEff/snpEff.jar && rm snpEff_latest_core.zip
RUN printf '#!/bin/bash \njava -jar /snpEff/snpEff.jar "$@"\n' > /usr/local/bin/snpEff && chmod ogu+x /usr/local/bin/snpEff

RUN wget -q https://github.com/broadinstitute/gatk/releases/download/4.2.4.1/gatk-4.2.4.1.zip && unzip gatk-4.2.4.1.zip gatk-4.2.4.1/gatk-package-4.2.4.1-local.jar gatk-4.2.4.1/gatk && rm gatk-4.2.4.1.zip

COPY ./tools /varpipe/tools
COPY ./intervals /varpipe/intervals

ENV PATH=$PATH:/varpipe/tools:/gatk-4.2.4.1
