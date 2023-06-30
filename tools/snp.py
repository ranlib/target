#!/usr/bin/env python
"""
determine variants
"""
import os
import subprocess
import csv
from datetime import datetime

class Snp:
    """get variants"""

    def __init__(self, read1, outdir, reference, reference_name, name, paired, read2, verbose, threads, whole_genome, cfg, argString):
        self.name = name  # sample name

        self.fOut = outdir
        self.read1 = read1
        self.read2 = read2
        self.paired = paired

        self.whole_genome = whole_genome
        self.verbose = verbose
        self.reference = reference
        self.reference_name = reference_name
        self.reference_dict = ""
        
        # Create the output directory, and start the log file.
        self.__logged = False
        self.__CallCommand("mkdir", ["mkdir", "-p", self.fOut])

        self.tmp = os.path.join(self.fOut, "tmp") # for SortSam
        self.qlog = os.path.join(self.fOut, "QC")
        self.__CallCommand("mkdir", ["mkdir", "-p", self.qlog])

        self.trimmomatic = os.path.join(self.fOut, "trimmomatic")
        self.__CallCommand("mkdir", ["mkdir", "-p", self.trimmomatic])

        self.bwaOut = os.path.join(self.fOut, "bwa")
        self.__CallCommand("mkdir", ["mkdir", "-p", self.bwaOut])

        self.GATKdir = os.path.join(self.fOut, "GATK")
        self.__CallCommand("mkdir", ["mkdir", "-p", self.GATKdir])

        self.samDir = os.path.join(self.fOut, "SamTools")
        self.__CallCommand("mkdir", ["mkdir", "-p", self.samDir])

        self.__lineage = os.path.join(self.fOut, self.name + ".lineage_report.txt")
        self.__finalVCF = os.path.join(self.GATKdir, self.name + "_filter.vcf")
        self.__fullVCF = os.path.join(self.GATKdir, self.name + "_full_filter.vcf")
        self.__annotation = os.path.join(self.fOut, self.name + "_DR_loci_raw_annotation.vcf")
        self.__full_annotation = os.path.join(self.fOut, self.name + "_full_raw_annotation.vcf")
        self.__full_final_annotation = os.path.join(self.fOut, self.name + "_full_Final_annotation.txt")
        self.__finalBam = os.path.join(self.fOut, self.name + "_sdrcsm.bam")

        self.__snpeff_stats_targets = os.path.join(self.fOut, self.name + "_snpEff_summary_targets.csv")
        self.__snpeff_html_targets = os.path.join(self.fOut, self.name + "_snpEff_summary_targets.html")

        self.__snpeff_stats_full = os.path.join(self.fOut, self.name + "_snpEff_summary_full.csv")
        self.__snpeff_html_full = os.path.join(self.fOut, self.name + "_snpEff_summary_full.html")

        self.__qlog = os.path.join(self.qlog, "QC.log")
        self.__log = os.path.join(self.fOut, self.name + ".log")
        self.__logFH = open(self.__log, "w")
        self.__logFH.write(argString + "\n\n")
        self.__logged = True

        self.__exception = ""
        self.__threads = threads
        self.__ranBWA = False

        # Configuration
        self.__parser = cfg["scripts"]["parser"]
        self.__creater = cfg["scripts"]["creater"]
        self.__interpreter = cfg["scripts"]["interpreter"]
        self.__stats_estimator = cfg["scripts"]["stats_estimator"]
        self.__genome_stats_estimator = cfg["scripts"]["genome_stats_estimator"]
        self.__target_estimator = cfg["scripts"]["target_coverage_estimator"]
        self.__genome_coverage_estimator = cfg["scripts"]["genome_coverage_estimator"]
        self.__lineage_parser = cfg["scripts"]["lineage_parser"]
        self.__lineages = cfg["scripts"]["lineages"]
        self.__structparser = cfg["scripts"]["struct_parser"]
        self.__create_report = cfg["scripts"]["create_report"]
        self.__print_report = cfg["scripts"]["print_report"]

        self.__snpeff_database = cfg["scripts"]["snpeff_database"]

        self.mutationloci = cfg["scripts"]["mutationloci"]
        self.__included = cfg["scripts"]["included"]
        self.__reported = cfg["scripts"]["reported"]
        self.__bedlist_amp = cfg["scripts"]["bedlist_amp"]
        self.__bedlist_one = cfg["scripts"]["bedlist_one"]
        self.__bedlist_two = cfg["scripts"]["bedlist_two"]
        self.__bedstruct = cfg["scripts"]["bedstruct"]

        # load cuts
        # Note: keys have to be in header of stats.txt file!
        # need to tie together in the future
        self.cuts = { k:float(v) for k, v in cfg.items("cuts") }
              

    def __CallCommand(self, program, command):
        """Allows execution of a simple command."""
        out = ""
        err = ""
        p = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out, err = p.communicate()

        if isinstance(program, list):
            o = open(program[1], "wt")
            o.write(out.decode())
            o.close()
            out = ""
            program = program[0]

        if self.__logged:
            self.__logFH.write("---[ " + program + " ]---\n")
            self.__logFH.write("Command: \n" + " ".join(command) + "\n\n")
            if out:
                self.__logFH.write("Standard Output: \n" + out.decode() + "\n\n")
            if err:
                self.__logFH.write("Standard Error: \n" + err.decode() + "\n\n")
        return err

    def runTrimmomatic(self):
        """QC Trimmomatic"""
        self.__ifVerbose("Performing trimmomatic trimming.")
        #trimlog = os.path.join(self.trimmomatic, "trimLog.txt")
        trimlog = os.path.join(self.fOut, "trimLog.txt")
        trimerr = os.path.join(self.fOut, "trimErr.txt")
        if self.paired:
            paired1 = os.path.join(self.trimmomatic, self.name + "_paired_1.fastq.gz")
            paired2 = os.path.join(self.trimmomatic, self.name + "_paired_2.fastq.gz")
            unpaired1 = os.path.join(self.trimmomatic, self.name + "_unpaired_1.fastq.gz")
            unpaired2 = os.path.join(self.trimmomatic, self.name + "_unpaired_2.fastq.gz")
            command = f"trimmomatic PE -threads {self.__threads} -trimlog {trimlog} {self.read1} {self.read2} {paired1} {unpaired1} {paired2} {unpaired2} LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:40"
            self.__CallCommand("trimmomatic", command.split())
            # self.__CallCommand("rm", ["rm", self.trimmomatic + "/" + self.name + "_unpaired_1.fastq.gz", self.trimmomatic + "/" + self.name + "_unpaired_2.fastq.gz"])
            self.read1 = paired1
            self.read2 = paired2
        else:
            trimmed = os.path.join(self.trimmomatic, self.name + "_paired.fastq.gz")
            command = f"trimmomatic SE -threads {self.__threads} -trimlog {trimlog} {self.read1} {trimmed} LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:40"
            self.__CallCommand("trimmomatic", command.split())
            self.read1 = trimmed

    def runBWA(self):
        """Align reads against the reference using bwa."""
        self.__ranBWA = True
        self.__ifVerbose("Running BWA.")
        self.__logFH.write("########## Running BWA. ##########\n")
        self.__ifVerbose("   Building BWA index.")
        self.__bwaIndex()
        self.__bwaLongReads()
        self.__ifVerbose("   Process Alignments")
        self.__processAlignment()

    def __bwaIndex(self):
        """Make an index of the given reference genome."""
        self.__CallCommand("mkdir", ["mkdir", "-p", self.bwaOut + "/index"])
        self.__CallCommand("cp", ["cp", self.reference, self.bwaOut +  "/index/ref.fa"])
        self.reference = self.bwaOut + "/index/ref.fa"
        self.__CallCommand("bwa index", ["bwa", "index", self.reference])
        self.reference_dict = self.bwaOut + "/index/ref.dict"
        if os.path.exists(self.reference_dict):
            os.remove(self.reference_dict)
        command = f"gatk CreateSequenceDictionary -R {self.reference} -O {self.reference_dict}"
        self.__CallCommand("CreateSequenceDictionary", command.split())
        self.__CallCommand("samtools faidx", ["samtools", "faidx", self.reference])

    def __bwaLongReads(self):
        """Make use of bwa mem"""
        self.__alnSam = self.bwaOut + "/bwa.sam"
        read_group = "@RG\\tID:" + self.name + "\\tSM:" + self.name + "\\tPL:ILLUMINA"
        if self.paired:
            self.__ifVerbose("   Running BWA mem on paired end reads.")
            command = f"bwa mem -t {str(self.__threads)} -K 10000000 -c 100 -M -T 50 -R {read_group} -o {self.__alnSam} {self.reference} {self.read1} {self.read2}"
            self.__CallCommand("bwa mem", command.split())
        else:
            self.__ifVerbose("   Running BWA mem on single end reads.")
            command = f"bwa mem -t {str(self.__threads)} -K 10000000 -c 100 -M -T 50 -R {read_group} -o {self.__alnSam} {self.reference} {self.read1}"
            self.__CallCommand("bwa mem", command.split())

    def __processAlignment(self):
        """Filter alignment using GATK and Picard-Tools"""
        self.__ifVerbose("Filtering alignment with GATK and Picard-Tools.")
        self.__logFH.write("########## Filtering alignment with GATK and Picard-Tools. ##########\n")

        bam_file = os.path.join(self.GATKdir, self.name + ".bam")
        #bam_file_sorted = os.path.join(self.GATKdir, self.name + "_s.bam")
        bam_file_sorted = os.path.join(self.fOut, self.name + "_s.bam")

        # Convert SAM to BAM
        if self.__ranBWA:
            self.__ifVerbose("   Running SamFormatConverter.")
            command = f"gatk SamFormatConverter -INPUT {self.__alnSam} -VALIDATION_STRINGENCY LENIENT -OUTPUT {bam_file}"
            self.__CallCommand("SamFormatConverter", command.split())
            #command = f"rm {self.__alnSam}"
            #self.__CallCommand("rm sam file", command.split())
            os.remove(self.__alnSam)
        else:
            self.__CallCommand("cp", ["cp", self.__alnSam, bam_file])

        # Run mapping Report and Mark duplicates using Picard-Tools
        self.__ifVerbose("   Running SortSam.")
        command = f"gatk SortSam -INPUT {bam_file} -SORT_ORDER coordinate -OUTPUT {bam_file_sorted} -VALIDATION_STRINGENCY LENIENT -CREATE_INDEX true"
        self.__CallCommand("SortSam", command.split())
        
        self.__ifVerbose("   Running MarkDuplicates.")
        bam_deduplicated = self.GATKdir + '/GATK_sdr.bam'
        deduplication_metrics = self.fOut + '/MarkDupes.metrics'
        command = f"gatk MarkDuplicates -INPUT {bam_file_sorted} -OUTPUT {bam_deduplicated} -METRICS_FILE {deduplication_metrics} -ASSUME_SORTED true -REMOVE_DUPLICATES false -VALIDATION_STRINGENCY LENIENT"
        self.__CallCommand("MarkDuplicates", command.split())

        self.__ifVerbose("   Running BuildBamIndex.")
        self.__CallCommand("BuildBamIndex", ["gatk", "BuildBamIndex", "-INPUT", self.GATKdir + "/GATK_sdr.bam", "-VALIDATION_STRINGENCY", "LENIENT"])
        self.__CallCommand("samtools view", ["samtools", "view", "-c", "-o", self.samDir + "/unmapped.txt", self.GATKdir + "/GATK_sdr.bam"])

        """ Filter out unmapped reads """
        self.__ifVerbose("   Running samtools view.")
        self.__CallCommand("samtools view", ["samtools", "view", "-bhF", "4", "-o", self.__finalBam, self.GATKdir + "/GATK_sdr.bam"])
        self.__ifVerbose("   Running BuildBamIndex.")
        self.__CallCommand("BuildBamIndex", ["gatk", "BuildBamIndex", "-INPUT", self.__finalBam, "-VALIDATION_STRINGENCY", "LENIENT"])
        self.__ifVerbose("   Running samtools view")
        #self.__CallCommand("rm", ["rm", "-r", self.tmp])
        self.__CallCommand("samtools view", ["samtools", "view", "-c", "-o", self.samDir + "/mapped.txt", self.__finalBam])

    def runCoverage(self):
        """Run genome Coverage Statistics"""

        self.__ifVerbose("Running target Coverage Statistics")
        #samDir = self.outdir + "/SamTools"
        #samDir = os.path.join(self.fOut, "SamTools")

        self.__CallCommand("samtools depth", ["samtools", "depth", "-o", self.samDir + "/coverage.txt", "-a", self.__finalBam])
        self.__CallCommand(["bedtools coverage", self.samDir + "/bed_amp_coverage.txt"], ["bedtools", "coverage", "-b", self.__finalBam, "-a", self.__bedlist_amp])
        self.__CallCommand(["sort", self.samDir + "/bed_amp_sorted_coverage.txt"], ["sort", "-nk", "6", self.samDir + "/bed_amp_coverage.txt"])
        self.__CallCommand(["bedtools coverage", self.samDir + "/bed_1_coverage.txt"], ["bedtools", "coverage", "-b", self.__finalBam, "-a", self.__bedlist_one])
        self.__CallCommand(["bedtools coverage", self.samDir + "/bed_2_coverage.txt"], ["bedtools", "coverage", "-b", self.__finalBam, "-a", self.__bedlist_two])
        self.__CallCommand(["sort", self.samDir + "/bed_1_sorted_coverage.txt"], ["sort", "-nk", "6", self.samDir + "/bed_1_coverage.txt"])
        self.__CallCommand(["sort", self.samDir + "/bed_2_sorted_coverage.txt"], ["sort", "-nk", "6", self.samDir + "/bed_2_coverage.txt"])
        self.__CallCommand(["target region coverage estimator", self.samDir + "/target_region_coverage_amp.txt"], [self.__target_estimator, self.__bedlist_amp, self.samDir + "/coverage.txt", self.name])

        self.__CallCommand(["sort", self.fOut + "/" + self.name + "_target_region_coverage.txt"], ["sort", "-nk", "3", self.samDir + "/target_region_coverage_amp.txt"])
        self.__CallCommand(["genome stats estimator", self.samDir + "/" + self.name + "_genome_stats.txt"], [self.__genome_stats_estimator, self.samDir + "/coverage.txt", self.name])

        self.__CallCommand(["genome coverage estimator", self.samDir + "/genome_region_coverage_1.txt"], [self.__genome_coverage_estimator, self.samDir + "/bed_1_sorted_coverage.txt", self.samDir + "/coverage.txt", self.name])
        self.__CallCommand(["genome coverage estimator", self.samDir + "/genome_region_coverage_2.txt"], [self.__genome_coverage_estimator, self.samDir + "/bed_2_sorted_coverage.txt", self.samDir + "/coverage.txt", self.name])
        self.__CallCommand(["cat", self.samDir + "/genome_region_coverage.txt"], ["cat", self.samDir + "/genome_region_coverage_1.txt", self.samDir + "/genome_region_coverage_2.txt"])
        self.__CallCommand(["sort", self.fOut + "/" + self.name + "_genome_region_coverage.txt"], ["sort", "-nk", "3", self.samDir + "/genome_region_coverage.txt"])
        self.__CallCommand("sed", ["sed", "-i", "1d", self.fOut + "/" + self.name + "_genome_region_coverage.txt"])
        self.__CallCommand(["structural variant detector", self.fOut + "/" + self.name + "_structural_variants.txt"], [self.__structparser, self.__bedstruct, self.fOut + "/" + self.name + "_genome_region_coverage.txt", self.samDir + "/coverage.txt", self.name])

        statsOut = os.path.join(self.fOut, self.name + "_stats.txt")
        targetCoverage = os.path.join(self.fOut, self.name + "_target_region_coverage.txt")
        genomeStats = os.path.join(self.samDir, self.name + "_genome_stats.txt")
        command = f"{self.__stats_estimator} {self.samDir + '/unmapped.txt'} {self.samDir + '/mapped.txt'} {targetCoverage} {self.name} {genomeStats}"
        self.__CallCommand(["stats estimator", statsOut], command.split())

        #
        # write QC log file
        #
        failure_reason = { x : False for x in list(self.cuts.keys()) }
        header = ["sample_name", "date", "time", "qc_status"]
        header.extend(list(self.cuts.keys()))
        with open(self.__qlog, "w") as qc_log: 
            writer = csv.DictWriter(qc_log, header)
            writer.writeheader()
            with open(statsOut, "r") as stats_file:
                reader = csv.DictReader(stats_file, delimiter="\t")
                for row in reader:
                    for item in self.cuts.keys():
                        failure_reason[item] = float(row[item]) < self.cuts[item]

                    message = []
                    message.append(row["sample_name"])
                    message.append(datetime.now().strftime("%Y/%m/%d"))
                    message.append(datetime.now().strftime("%H:%M:%S"))
                    if any(list(failure_reason.keys())):
                        message.append("failed")
                    else:
                        message.append("passed")

                    message.extend([ str(x) for x in failure_reason.values() ] )
                    writer.writerow(dict(zip(header, message)))
                

    def runGATK(self):
        """Variant Callers"""
        if os.path.isfile(self.__finalBam):
            self.__ifVerbose("Calling SNPs/InDels with GATK.")
            self.__logFH.write("########## Calling SNPs/InDels with Mutect2. ##########\n")

            # gatk mutect for entire genome
            #mutect_vcf_full = os.join.path(self.GATKdir, 'full_mutect.vcf')
            #mutect_vcf_full_aligned = os.join.path(self.GATKdir, "full_gatk_mutect.vcf")
            #mutect2_full = f"gatk Mutect2 -R {self.reference} -I {self.__finalBam} -O {mutect_vcf_full} --max-mnp-distance 2"
            #align_variants_full = f"gatk LeftAlignAndTrimVariants -R {self.reference} -V {mutect_vcf_full} -O {mutext_vcf_full_aligned} --split-multi-allelics"
            #filter_full = f"gatk FilterMutectCalls -R {self.reference} -V {mutect_vcf_full_aligned} --min-reads-per-strand 1 --min-median-read-position 10 --min-allele-fraction 0.01 --microbial-mode true -O {self.__fullVCF}"

            # gatk mutect for target regions
            # could get rid of this, just run on entire genomes, then intersect vcf with bedfile
            #target_intervals =  os.path.join(self.GATKdir, 'target.intervals')
            #command=f"gatk BedToIntervalList -I {self.__bedlist_amp} -O {target_intervals} -SD {self.reference_dict}"
            #self.__CallCommand("BedToIntervalsList", command.split())
            
            #mutect_vcf_final = os.join.path(self.GATKdir, 'mutect.vcf')
            #mutect_vcf_final_aligned = os.join.path(self.GATKdir, 'gatk_mutect.vcf')
            #mutect2_final = f"gatk Mutect2 -R {self.reference} -I {self.__finalBam} -O {mutect_vcf_final} --max-mnp-distance 2 -L {self.__included}"
            #align_variants_final = f"gatk LeftAlignAndTrimVariants -R {self.reference} -V {mutect_vcf_final} -O {mutect_vcf_final_aligned} --split-multi-allelics"
            #filter_final = f"gatk FilterMutectCalls -R {self.reference} -V {mutect_vcf_final_aligned} --min-reads-per-strand 1 --min-median-read-position 10 --min-allele-fraction 0.01 --microbial-mode true -O {self.__finalVCF}"
            
            # GATK for target regions
            self.__CallCommand("Mutect2", ["gatk", "Mutect2", "-R", self.reference, "-I", self.__finalBam, "-O", self.GATKdir + "/mutect.vcf", "--max-mnp-distance", "2", "-L", self.__included])
            #self.__CallCommand("Mutect2", ["gatk", "Mutect2", "-R", self.reference, "-I", self.__finalBam, "-O", self.GATKdir + "/mutect.vcf", "--max-mnp-distance", "2", "-L", target_intervals])
            self.__CallCommand("LeftAlignAndTrimVariants", ["gatk", "LeftAlignAndTrimVariants", "-R", self.reference, "-V", self.GATKdir + "/mutect.vcf", "-O", self.GATKdir + "/gatk_mutect.vcf", "--split-multi-allelics"])
            self.__CallCommand("mv", ["mv", self.GATKdir + "/gatk_mutect.vcf", self.GATKdir + "/mutect.vcf"])
            self.__CallCommand("FilterMutectCalls", ["gatk", "FilterMutectCalls", "-R", self.reference, "-V", self.GATKdir + "/mutect.vcf", "--min-reads-per-strand", "1", "--min-median-read-position", "10", "--min-allele-fraction", "0.01", "--microbial-mode", "true", "-O", self.__finalVCF])

            if self.whole_genome:
                # GATK for entire genome
                self.__CallCommand("Mutect2", ["gatk", "Mutect2", "-R", self.reference, "-I", self.__finalBam, "-O", self.GATKdir + "/full_mutect.vcf", "--max-mnp-distance", "2"])
                self.__CallCommand("LeftAlignAndTrimVariants", ["gatk", "LeftAlignAndTrimVariants", "-R", self.reference, "-V", self.GATKdir + "/full_mutect.vcf", "-O", self.GATKdir + "/full_gatk_mutect.vcf", "--split-multi-allelics"])
                self.__CallCommand("mv", ["mv", self.GATKdir + "/full_gatk_mutect.vcf", self.GATKdir + "/full_mutect.vcf"])
                self.__CallCommand("FilterMutectCalls", ["gatk", "FilterMutectCalls", "-R", self.reference, "-V", self.GATKdir + "/full_mutect.vcf", "--min-reads-per-strand", "1", "--min-median-read-position", "10", "--min-allele-fraction", "0.01", "--microbial-mode", "true", "-O", self.__fullVCF])

        else:
            print("<E> no bam file found")

    def annotateVCF(self):
        """
        Annotate the final VCF file
        Here too: just run on full vcfl file, then intersect with target bed file 
        """
        #if self.__finalVCF:
        self.__ifVerbose("Annotating final VCF.")
        command = f"snpEff -nodownload -noLog -csvStats {self.__snpeff_stats_targets} -stats {self.__snpeff_html_targets} -config {self.__snpeff_database} {self.reference_name} {self.__finalVCF}"
        self.__CallCommand(["SnpEff", self.__annotation], command.split())
    
        self.__ifVerbose("Parsing final Annotation.")
        # translate vcf -> tsv file
        self.__CallCommand(["create annotation", self.fOut + "/" + self.name + "_DR_loci_annotation.txt"], [self.__creater, self.__annotation, self.name])
        # vcf -> tsv + some manipulation
        self.__CallCommand(["parse annotation", self.fOut + "/" + self.name + "_DR_loci_Final_annotation.txt"], [self.__parser, self.__annotation, self.mutationloci, self.name])

        #if self.__fullVCF:
        if self.whole_genome:
            self.__ifVerbose("Annotating full VCF.")
            command = f"snpEff -nodownload -noLog -csvStats {self.__snpeff_stats_full} -stats {self.__snpeff_html_full} -config {self.__snpeff_database} {self.reference_name} {self.__fullVCF}"
            self.__CallCommand(["SnpEff", self.__full_annotation], command.split())

            self.__ifVerbose("Parsing full Annotation.")
            self.__CallCommand(["create annotation", self.fOut + "/" + self.name + "_full_annotation.txt"], [self.__creater, self.__full_annotation, self.name])
            self.__CallCommand(["parse annotation", self.fOut + "/" + self.name + "_full_Final_annotation.txt"], [self.__parser, self.__full_annotation, self.mutationloci, self.name])
        #else:
        #    self.__ifVerbose("Use SamTools, GATK, or Freebayes to annotate the final VCF.")


    def runLineage(self):
        """Run lineage Analysis"""
        self.__ifVerbose("Running Lineage Analysis")
        self.__CallCommand(["lineage parsing", self.fOut + "/" + self.name + "_Lineage.txt"], [self.__lineage_parser, self.__lineages, self.__full_final_annotation, self.__lineage, self.name])

    def runPrint(self):
        """
        Create and print analysis report
        run interpretation
        """
        self.__ifVerbose("Printing report")

        stats_file = os.path.join(self.fOut, self.name + "_stats.txt")
        target_region_coverage = os.path.join(self.fOut, self.name + "_target_region_coverage.txt")
        DR_loci_Final_annotation = os.path.join(self.fOut + "/" + self.name + "_DR_loci_Final_annotation.txt")

        summary = os.path.join(self.fOut, self.name + "_summary.txt")
        run_summary = f"{self.__create_report} {stats_file} {target_region_coverage} {DR_loci_Final_annotation}"
        self.__CallCommand(["create summary report", summary], run_summary.split())
        
        SVs = os.path.join(self.fOut, self.name + "_structural_variants.txt")
        DR_loci_annotation = os.path.join(self.fOut, self.name + "_DR_loci_annotation.txt")
        target_region_coverage = os.path.join(self.fOut, self.name + "_target_region_coverage.txt")

        interpretation = os.path.join(self.fOut, self.name + "_interpretation.txt")
        run_interpretation = f"{self.__interpreter} {self.__reported} {summary} {SVs} {DR_loci_annotation} {target_region_coverage} {self.name}"
        self.__CallCommand(["run interpretation report", interpretation], run_interpretation.split() ) 

        self.__CallCommand("print pdf report", [self.__print_report, summary, self.fOut + "/" + self.name + "_report.pdf"])

    def cleanUp(self):
        """Clean up the temporary files, and move them to a proper folder."""
        #cwd = os.getcwd()
        #self.__CallCommand("rm", ["rm", "-r", self.outdir])
        #self.__CallCommand("rm", ["rm", self.fOut + "/" + self.name + "_sdrcsm.bai"])
        #self.__CallCommand("rm", ["rm", self.__finalBam])
        #self.__CallCommand("rm", ["rm", "-r", self.trimmomatic])

        if os.path.isfile(self.__log):
            self.__logFH.close()
            self.__logged = False

        with open(self.__log, "r") as logfile:
            for line in logfile:
                lines = line.rstrip("\r\n")
                if "Exception" in lines:
                    self.__exception = "positive"

        # if self.__exception == "positive":
        #     self.__qlogFH.write(datetime.now().strftime("%Y/%m/%d %H:%M:%S") + "\t" + "Input:" + "\t" + self.name + "\t" + "Exception in analysis\n")
        #     self.__CallCommand("mv", ["mv", self.fOut, self.qlog])

        # if os.path.isfile(self.fOut + "/" + self.name + "_stats.txt"):
        #     if os.path.getsize(self.fOut + "/" + self.name + "_stats.txt") < 1:
        #         self.__qlogFH.write(datetime.now().strftime("%Y/%m/%d %H:%M:%S") + "\t" + "Input:" + "\t" + self.name + "\t" + "Exception in analysis\n")
        #         self.__CallCommand("mv", ["mv", self.fOut, self.qlog])

    def removeFiles(self):
        """
        Clean up the temporary files
        """
        # shutil.rmtree(self.trimmomatic)
        # shutil.rmtree(self.bwaOut)
        # shutil.rmtree(self.samDir)
        # shutil.rmtree(self.GATKdir)
        self.__CallCommand("rm", ["rm", "-r", self.trimmomatic])
        self.__CallCommand("rm", ["rm", "-r", self.bwaOut])
        self.__CallCommand("rm", ["rm", "-r", self.samDir])
        self.__CallCommand("rm", ["rm", "-r", self.GATKdir])

    def __ifVerbose(self, msg):
        """If verbose print a given message"""
        if self.verbose:
            print(msg)
