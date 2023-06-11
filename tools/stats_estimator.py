#!/usr/bin/env python
"""
Accepts target_coverage and genome coverage text files and sample
name, generates stats output file
"""
import sys
from datetime import datetime

input1 = sys.argv[3]
input2 = sys.argv[4]
input3 = input2.split("-")[0]
input4 = sys.argv[5]
input5 = sys.argv[1]
input6 = sys.argv[2]

low_cov_count = 0

with open(input1, encoding="utf-8") as fh1:
    for lines in fh1:
        if lines.startswith("SAMPLE_ID"):
            continue
        lined = lines.rstrip("\r\n").split("\t")
        if lined[6] == "Review":
            low_cov_count += 1

with open(input4, encoding="utf-8") as fh3:
    for lines in fh3:
        if lines.startswith("SAMPLE_ID"):
            continue
        lined = lines.rstrip("\r\n").split("\t")
        genome_cov = lined[1]
        genome_width = lined[2]

with open(input5, encoding="utf-8") as fh5:
    for lines in fh5:
        unmapped = int(lines.rstrip("\r\n"))

with open(input6, encoding="utf-8") as fh6:
    for lines in fh6:
        mapped = int(lines.rstrip("\r\n"))

percent_mapped = (float(mapped) / float(unmapped)) * 100.00
str_percent_mapped = f"{percent_mapped:.2f}"

header = [
    "sample_id",
    "sample_name",
    "percent_reads_mapped",
    "average_genome_coverage_depth",
    "percent_reference_genome_covered",
    "coverage_drop",
    "pipeline_version",
    "date",
]
data = [
    input2,
    input3,
    str_percent_mapped,
    genome_cov,
    genome_width,
    str(low_cov_count),
    "Varpipe4",
    datetime.now().strftime("%Y/%m/%d %H:%M:%S"),
]
print("\t".join(header))
print("\t".join(data))
