#!/usr/bin/env python
"""
Varpipeline
"""
import sys
import os
import argparse
import configparser
import snp

if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog="Varpipeline", conflict_handler="resolve", description="Varpipeline - Call SNPs and InDels")
    group1 = parser.add_argument_group("Input", "")
    group1.add_argument("-q", "--fastq", required=True, type=str, help="Input FASTQ file")
    group1.add_argument("-q2", "--fastq2", type=str, default="", help="Second paired-end FASTQ file")
    group1.add_argument("-r", "--reference", required=True, type=str, help="Reference genome in FASTA format")
    group1.add_argument("-g", "--genome", required=True, type=str, help="Name of the reference genome")
    group1.add_argument("-n", "--name", required=True, type=str, help="Sample name to be used as a prefix")
    group1.add_argument("-t", "--threads", type=int, default=1, help="Specify how many threads to use")
    group1.add_argument("-c", "--configuration", required=True, type=str, default="snp.config", help="Configuration file")

    group2 = parser.add_argument_group("Output", "")
    group2.add_argument("-o", "--outdir", required=True, type=str, help="Output directory")
    group2.add_argument("-k", "--keepfiles", action="store_true", help="Keep intermediate files")

    group5 = parser.add_argument_group("Annotation", "Use snpEff to annotate VCF file")
    group5.add_argument("-a", "--annotation", action="store_true", help="Run snpEff functional annotation")

    group6 = parser.add_argument_group("Optional", "")
    group6.add_argument("-v", "--verbose", action="store_true", help="Produce status updates of the run")
    group6.add_argument("-h", "--help", action="help", help="Show this help message and exit")
    group6.add_argument("-V", "--version", action="version", version="%(prog)s_wgs v1.0.2", help="Show program's version number and exit")
    group6.add_argument("--no_trim", action="store_true", help="Don't trim files using trimmomatic")

    if len(sys.argv) == 1:
        parser.print_usage()
        sys.exit(1)

    args = parser.parse_args()

    # Verify input FASTQ file exists
    if not os.path.isfile(args.fastq):
        print(f"Please check if input {args.fastq} exists, then try again.")
        sys.exit(2)

    # Check paired end, and verify exists
    if args.fastq2:
        if not os.path.isfile(args.fastq2):
            print(f"Please check that {args.fastq2} exists, then try again.")
            sys.exit(2)
        else:
            paired = True
    else:
        paired = False

    # Verify reference file exists
    if not os.path.isfile(args.reference):
        print(f"Please check if reference {args.reference} exists, then try again.")
        sys.exit(2)

    # Verify configuration file exists
    if not os.path.isfile(args.configuration):
        print(f"Please check if reference {args.configuration} exists, then try again.")
        sys.exit(2)

    # read in configuraton
    config = configparser.ConfigParser()
    config.read(args.configuration)
    # check configuration
    for sect in config.sections():
        print("Section:", sect)
        for k, v in config.items(sect):
            print(f" {k} = {v}")
        print()

    for k, v in config.items("scripts"):
        print(f" {k} = {v}")
        if not os.path.exists(v):
            print(f"<E> input file {v} does not exist. Exiting.")
            sys.exit(2)

    if args.verbose:
        print(" ".join(sys.argv))
        print("")

    # all is well let's get started!
    s = snp.Snp(args.fastq, args.outdir, args.reference, args.genome, args.name, paired, args.fastq2, args.verbose, args.threads, config, " ".join(sys.argv))

    # run Trimmomatic timmer
    if not args.no_trim:
        s.runTrimmomatic()

    # Run the aligner
    s.runBWA()

    # Perform Coverage statistics Analysis
    s.runCoverage()

    # If asked, run SNP callers
    #if args.gatk:
    s.runGATK()

    # Annotate Final VCF
    s.annotateVCF()

    # Perform Lineage Analysis
    s.runLineage()

    # Print final reports
    s.runPrint()

    # By default clean up intermediate files
    s.cleanUp()
    if not args.keepfiles:
        s.removeFiles()
