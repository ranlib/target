#!/bin/bash

tar czvf  contamination/bbduk_contamination.tar.gz \
    contamination/Escherichia_coli_gca_001606525.ASM160652v1.dna.toplevel.fa.gz \
    contamination/NZ_CP008889.1.fa.gz \
    contamination/NZ_CP008889.1_plasmid.fa.gz

tar czvf  contamination/bbduk_contamination_polyA.tar.gz \
    contamination/polyA.fa.gz
