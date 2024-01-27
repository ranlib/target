#!/bin/bash
#
# Note: sequence names cannot contain spacers!
# zcat adapters.fa.gz | sed 's| |_|g' | gzip > temp.fa.gz
#
# 2nd row indicates whether contamination (1) or not (0)
#
(zcat contamination/clockwork_contaminants_cdc.fa.gz | sed 's| |_|g' | awk -F\> 'BEGIN{OFS="\t"}/^>/{print $2,1,$2}'; \
 zcat contamination/Escherichia_coli_gca_001606525.ASM160652v1.dna.toplevel.fa.gz | sed 's| |_|g' | awk -F\> 'BEGIN{OFS="\t"}/^>/{print $2,1,$2}'; \
 zcat contamination/NZ_CP008889.1.fa.gz | sed 's| |_|g' | awk -F\> 'BEGIN{OFS="\t"}/^>/{print $2,1,$2}'; \
 zcat contamination/NZ_CP008889.1_plasmid.fa.gz | sed 's| |_|g' | awk -F\> 'BEGIN{OFS="\t"}/^>/{print $2,1,$2}'; \
 printf "reference\t0\tNC_000962.3") > contamination/clockwork_contaminants_metadata_cdc_v2.tsv

# contaminants multi-fasta
(zcat contamination/clockwork_contaminants_cdc.fa.gz | sed 's| |_|g' ; \
 zcat contamination/Escherichia_coli_gca_001606525.ASM160652v1.dna.toplevel.fa.gz | sed 's| |_|g' ; \
 zcat contamination/NZ_CP008889.1.fa.gz | sed 's| |_|g' ; \
 zcat contamination/NZ_CP008889.1_plasmid.fa.gz | sed 's| |_|g' ; \
 cat ~/Analysis/varpipe4/references/NC_000962.3/NC_000962.3.fasta) | gzip > contamination/clockwork_contaminants_cdc_v2.fa.gz

exit 0

