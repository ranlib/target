#!/bin/bash
#
# Note: sequence names cannot contain spacers!
# zcat adapters.fa.gz | sed 's| |_|g' | gzip > temp.fa.gz
#
# 2nd row indicates whether contamination (1) or not (0)
#
(zcat contamination/adapters.fa.gz | sed 's| |_|g' | \
     awk -F\> 'BEGIN{OFS="\t"}/^>/{print $2,1,$2}'; printf "reference\t0\tNC_000962.3") \
    > contamination/clockwork_contaminants_metadata.tsv

# contaminants multi-fasta
(zcat contamination/adapters.fa.gz | sed 's| |_|g' ; \
 cat ~/Analysis/varpipe4/references/NC_000962.3/NC_000962.3.fasta) \
    | gzip > contamination/clockwork_contaminants.fa.gz

exit 0

