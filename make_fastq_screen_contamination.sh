#!/bin/bash

tar czvf fastq_screen_contamination.tar.gz \
    contamination/adapters.fa.gz* \
    contamination/Covid19_ref.fa.gz* \
    contamination/phix174_ill.ref.fa.gz* \
    contamination/polyA.fa.gz* \
    contamination/UniVec.fa.gz* \
    contamination/Escherichia_coli_gca_001606525.ASM160652v1.dna.toplevel.fa.gz* \
    references/NC_000962.3/NC_000962.3.fasta*
