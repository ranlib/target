
## wf_varpipe

author
: Dieter Best

email
: Dieter.Best@cdph.ca.gov

description
: ## variant pipeline 
 This is the CDC TB profiler: https://github.com/CDCgov/NCHHSTP-DTBE-Varpipe-WGS.

 This also runs fastq QC, decontamination, and alignment QC.

### Inputs

#### Required

  * `bed` (File, **required**); **description**: bed file with genomic intervals of interest. Note: reference name in case of London TB profiler is 'Chromosome', make sure to use correct bed file.; **category**: required
  * `clockwork_contaminants` (File, **required**); **description**: Multifasta file with reference genomes of sources of contamination.; **category**: required
  * `clockwork_decontamination_metadata` (File, **required**); **description**: tsv file, 1st column = name of contamination group; 2nd column = 1 or 0, 1 for contamination, 0 for reference; 3rd column = name of genome.; **category**: required
  * `config` (File, **required**); **description**: Configuration file with parameters for the pipeline.; **category**: required
  * `fastq_screen_configuration` (File, **required**); **description**: fastq_screen configuration file.; **category**: required
  * `fastq_screen_contaminants` (File, **required**); **description**: gzipped tar file of gzipped fasta genome files.; **category**: required
  * `indexFiles` (Array[File]+, **required**); **description**: Array of index files for centrifuge.; **category**: required
  * `json` (File, **required**); **description**: json file with drug information for variants.; **category**: required
  * `lineage_markers` (File, **required**); **description**: Input tsv file for SNP-based lineage determination.; **category**: required
  * `outdir` (String, **required**); **description**: Alphanumeric name of output directory.; **category**: required
  * `read1` (Array[File]+, **required**); **description**: List of fastq files with forward reads. Must have suffix fastq.gz or fq.gz.; **category**: required
  * `read2` (Array[File]+, **required**); **description**: List of fastq files with reverse reads. Must have suffix fastq.gz or fq.gz.; **category**: required
  * `reference` (File, **required**); **description**: Reference sequence to align to in fasta format.; **category**: required
  * `samplename` (String, **required**); **description**: Alphanumeric name of the sample.; **category**: required
  * `snpEff_config` (File, **required**); **description**: Configuration file for snpEff.; **category**: required
  * `snpEff_data_dir` (File, **required**); **description**: Directory with snpEff data.; **category**: required

#### Optional

  * `disk_size` (Int?)
  * `task_bbduk.contamination` (File?)
  * `task_fastqc.adapters` (File?)
  * `task_fastqc.contaminants` (File?)
  * `task_fastqc.limits` (File?)
  * `task_fastqc_after_cleanup.adapters` (File?)
  * `task_fastqc_after_cleanup.contaminants` (File?)
  * `task_fastqc_after_cleanup.limits` (File?)
  * `wf_collect_targeted_pcr_metrics.task_mark_duplicates.marked_bam` (String?)

#### Defaults

  * `ampfile` (File, default="primers.tsv")
  * `disk_multiplier` (Int, default=20)
  * `genome` (String, default="NC_000962.3"); **description**: Alphanumeric name of reference genome.; **category**: optional
  * `keep` (Boolean, default=false); **description**: Flag if temporary output files should be kept, for debugging purposes.; **category**: optional
  * `kmer` (Int, default=10)
  * `minNumberReads` (Int, default=10000); **description**: Minimum number of reads required to run the pipeline.; **category**: optional
  * `minqual` (Int, default=20)
  * `mismatch` (Int, default=3)
  * `no_trim` (Boolean, default=true)
  * `output_vcf_name` (String, default="all_variants.vcf")
  * `ptrimmer_keep` (Boolean, default=true)
  * `ptrimmer_summary` (String, default="Summary.ampcount")
  * `run_bamQC` (Boolean, default=true); **description**: Flag for performing alignment bam QC.; **category**: optional
  * `run_centrifuge` (Boolean, default=true)
  * `run_clockwork_decontamination` (Boolean, default=true)
  * `run_decontamination` (Boolean, default=true); **description**: Flag, turn on if decontamination of fastq files should be run.; **category**: optional
  * `run_delly` (Boolean, default=true); **description**: Flag, turn on if delly for structural variant calling should be run.; **category**: optional
  * `run_fastq_screen` (Boolean, default=true)
  * `run_fastqc_after_cleanup` (Boolean, default=true)
  * `run_ptrimmer` (Boolean, default=true)
  * `run_variant_interpretation` (Boolean, default=true)
  * `seqtype` (String, default="pair")
  * `verbose` (Boolean, default=false); **description**: Flag for additional debugging output written to log file.; **category**: optional
  * `whole_genome` (Boolean, default=true); **description**: Flag if variant calls should be performed on entire genome, not only intervals of interest.; **category**: optional
  * `task_bbduk.docker` (String, default="staphb/bbtools:39.01")
  * `task_bbduk.keep` (Boolean, default=true); **description**: Flag if temporary output files should be kept, for debugging purposes.; **category**: optional
  * `task_bbduk.memory` (String, default="8GB")
  * `task_bbduk.number_of_retries` (Int, default=1)
  * `task_bbduk.threads` (Int, default=1)
  * `task_collect_multiple_metrics.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_collect_multiple_metrics.memory` (String, default="8GB")
  * `task_collect_multiple_metrics.outputBasename` (String, default="multiple_metrics"); **description**: Prefix for the output files of the alignment QC.; **category**: optional
  * `task_collect_wgs_metrics.coverage_cap` (Int, default=250)
  * `task_collect_wgs_metrics.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_collect_wgs_metrics.memory` (String, default="8GB")
  * `task_collect_wgs_metrics.minBaseQuality` (Int, default=20)
  * `task_collect_wgs_metrics.minMappingQuality` (Int, default=20)
  * `task_collect_wgs_metrics.outputFile` (String, default="collect_wgs_metrics.txt")
  * `task_collect_wgs_metrics.read_length` (Int, default=150)
  * `task_collect_wgs_metrics.sample_size` (Int, default=10000)
  * `task_collect_wgs_metrics.sensitivityFile` (String, default="collect_wgs_sensitivity_metrics.txt")
  * `task_collect_wgs_metrics.use_fast_algorithm` (Boolean, default=true)
  * `task_concat_2_vcfs.docker` (String, default="staphb/bcftools:1.17")
  * `task_depth_of_coverage.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `task_depth_of_coverage.lower_coverage` (Int, default=10)
  * `task_depth_of_coverage.memory` (String, default="8GB")
  * `task_depth_of_coverage.min_base_quality` (Int, default=20)
  * `task_depth_of_coverage.outputPrefix` (String, default="depth_of_coverage")
  * `task_fastq_screen.aligner` (String, default="bwa")
  * `task_fastq_screen.docker` (String, default="dbest/fastq_screen:v0.15.3")
  * `task_fastq_screen.memory` (String, default="10GB")
  * `task_fastq_screen.subset` (Int, default=100000)
  * `task_fastq_screen.threads` (Int, default=1)
  * `task_fastqc.docker` (String, default="staphb/fastqc:0.12.1")
  * `task_fastqc.memory` (String, default="8GB")
  * `task_fastqc.threads` (Int, default=1)
  * `task_fastqc_after_cleanup.docker` (String, default="staphb/fastqc:0.12.1")
  * `task_fastqc_after_cleanup.memory` (String, default="8GB")
  * `task_fastqc_after_cleanup.threads` (Int, default=1)
  * `task_multiqc.docker` (String, default="multiqc/multiqc:v1.21")
  * `task_multiqc.memory` (String, default="8GB")
  * `task_ptrimmer.docker` (String, default="dbest/ptrimmer:v1.3.4")
  * `task_repair.docker` (String, default="staphb/bbtools:39.01")
  * `task_repair.memory` (String, default="8GB")
  * `task_trimmomatic.docker` (String, default="staphb/trimmomatic:0.39")
  * `task_trimmomatic.memory` (String, default="8GB")
  * `task_trimmomatic.threads` (Int, default=4)
  * `task_trimmomatic.trimmomatic_minlen` (Int, default=40)
  * `task_trimmomatic.trimmomatic_quality_trim_score` (Int, default=15)
  * `task_trimmomatic.trimmomatic_window_size` (Int, default=4)
  * `task_varpipe.docker` (String, default="dbest/varpipe4:v2.0.3")
  * `task_varpipe.memory` (String, default="32GB")
  * `task_varpipe.threads` (Int, default=1)
  * `wf_centrifuge.disk_multiplier` (Int, default=20)
  * `wf_centrifuge.disk_size` (Int, default=100)
  * `wf_centrifuge.memory` (String, default="20GB")
  * `wf_centrifuge.threads` (Int, default=1)
  * `wf_clockwork_decontamination.memory` (String, default="64GB")
  * `wf_clockwork_decontamination.output_bam` (String, default=samplename + "_clockwork_decontamination.bam")
  * `wf_clockwork_decontamination.output_file` (String, default=samplename + "_clockwork_decontamination_stats.txt")
  * `wf_clockwork_decontamination.output_reads_1` (String, default=samplename + "_clockwork_cleaned_1.fq.gz")
  * `wf_clockwork_decontamination.output_reads_2` (String, default=samplename + "_clockwork_cleaned_2.fq.gz")
  * `wf_clockwork_decontamination.threads` (Int, default=1)
  * `wf_interpretation.debug` (Boolean, default=true)
  * `wf_interpretation.filter_genes` (Boolean, default=true)
  * `wf_interpretation.filter_variants` (Boolean, default=true)
  * `wf_interpretation.interpretation_docker` (String, default="dbest/variant_interpretation:v1.4.0")
  * `wf_interpretation.interpretation_memory` (String, default="8GB")
  * `wf_interpretation.interpretation_report` (String, default="variant_interpretation.tsv"); **description**: Output tsv file from variant interpretation.
  * `wf_interpretation.lims_docker` (String, default="dbest/lims_report:v1.0.4")
  * `wf_interpretation.lims_operator` (String, default="DB")
  * `wf_interpretation.lims_report_name` (String, default="lims_report.tsv")
  * `wf_interpretation.minimum_allele_percentage` (Float, default=10.0)
  * `wf_interpretation.minimum_coverage` (Int, default=10)
  * `wf_interpretation.minimum_total_depth` (Int, default=10)
  * `wf_interpretation.minimum_variant_depth` (Int, default=10)
  * `wf_interpretation.verbose` (Boolean, default=false); **description**: Flag for additional debugging output written to log file.; **category**: optional
  * `wf_lineage.lineage_docker` (String, default="dbest/lineage:v1.0.0")
  * `wf_lineage.lineage_report_name` (String, default="lineage_report.tsv")
  * `wf_lineage.snpit_docker` (String, default="valleema/snpit:1.1")
  * `wf_structural_variants.delly_docker` (String, default="dbest/delly:v1.0.0")
  * `wf_structural_variants.delly_memory` (String, default="32GB")
  * `wf_structural_variants.hgvs` (Boolean, default=true)
  * `wf_structural_variants.lof` (Boolean, default=true)
  * `wf_structural_variants.noDownstream` (Boolean, default=false)
  * `wf_structural_variants.noIntergenic` (Boolean, default=false)
  * `wf_structural_variants.noShiftHgvs` (Boolean, default=false)
  * `wf_structural_variants.output_vcf_name` (String, default="structural_variants.vcf")
  * `wf_structural_variants.snpEff_docker` (String, default="dbest/snpeff:v5.2a")
  * `wf_structural_variants.snpEff_memory` (String, default="9G")
  * `wf_structural_variants.svType` (String, default="DEL")
  * `wf_structural_variants.upDownStreamLen` (Int, default=5000)
  * `wf_centrifuge.task_centrifuge.docker` (String, default="dbest/centrifuge:v1.0.4")
  * `wf_centrifuge.task_kreport.docker` (String, default="dbest/centrifuge:v1.0.4")
  * `wf_clockwork_decontamination.map_reads.disk_size` (Int, default=100)
  * `wf_clockwork_decontamination.map_reads.docker` (String, default="dbest/clockwork:v1.0.0")
  * `wf_clockwork_decontamination.remove_contam.disk_size` (Int, default=100)
  * `wf_clockwork_decontamination.remove_contam.docker` (String, default="dbest/clockwork:v1.0.0")
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.clip_overlapping_reads` (Boolean, default=true)
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.coverage_cap` (Int, default=250)
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.memory` (String, default="8GB")
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minBaseQuality` (Int, default=20)
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minMappingQuality` (Int, default=20)
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.outputMetrics` (String, default="collect_targeted_pcr_metrics.txt")
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sample_size` (Int, default=10000)
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sensitivityFile` (String, default="collect_targeted_pcr_sensitivity_metrics.txt")
  * `wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.target_coverage_file` (String, default="collect_targeted_pcr_target_coverage.txt")
  * `wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_add_pg_tag_to_read` (Boolean, default=false)
  * `wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_duplicates` (Boolean, default=false)
  * `wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_sequencing_duplicates` (Boolean, default=false)
  * `wf_collect_targeted_pcr_metrics.task_mark_duplicates.docker` (String, default="broadinstitute/gatk:4.5.0.0")
  * `wf_collect_targeted_pcr_metrics.task_mark_duplicates.memory` (String, default="8GB")
  * `wf_collect_targeted_pcr_metrics.task_mark_duplicates.metrics_txt` (String, default="mark_duplicates_metrics.txt")
  * `wf_structural_variants.task_snpEff.csvStats` (String, default="snpEff_summary.csv")
  * `wf_structural_variants.task_snpEff.stats` (String, default="snpEff_summary.html")

### Outputs

  * `centrifuge_classification` (File?)
  * `centrifuge_kraken_style` (File?)
  * `centrifuge_summary` (File?)
  * `trim_err` (File?)
  * `trim_stats` (File?)
  * `DR_loci_annotation` (File?)
  * `DR_loci_Final_annotation` (File?)
  * `DR_loci_raw_annotation` (File?)
  * `full_annotation` (File?)
  * `full_Final_annotation` (File?)
  * `full_raw_annotation` (File?)
  * `genome_region_coverage` (File?)
  * `interpretation` (File?)
  * `lineage_report` (File?)
  * `Lineage` (File?)
  * `log` (File?)
  * `bai` (File?)
  * `bam` (File?)
  * `stats` (File?)
  * `structural_variants` (File?)
  * `summary` (File?)
  * `target_region_coverage` (File?)
  * `mark_duplicates_metrics` (File?)
  * `snpEff_summary_targets` (File?)
  * `snpEff_summary_full` (File?)
  * `qc_log` (File?)
  * `pipeline_date` (String?)
  * `multiple_metrics_outputs` (Array[File]?)
  * `depth_of_coverage_outputs` (Array[File]?)
  * `collect_wgs_output_metrics` (File?)
  * `collect_targeted_pcr_metrics` (File?)
  * `collect_targeted_pcr_sensitivity` (File?)
  * `collect_targeted_pcr_target_coverage` (File?)
  * `fastq_screen_html` (File?)
  * `fastq_screen_txt` (File?)
  * `fastq_screen_tagged` (File?)
  * `fastq_screen_tagged_filter` (File?)
  * `forwardHtml` (File)
  * `reverseHtml` (File)
  * `forwardZip` (File)
  * `reverseZip` (File)
  * `forwardSummary` (File)
  * `reverseSummary` (File)
  * `forwardData` (File)
  * `reverseData` (File)
  * `forwardHtml_cleaned` (File?)
  * `reverseHtml_cleaned` (File?)
  * `forwardZip_cleaned` (File?)
  * `reverseZip_cleaned` (File?)
  * `forwardSummary_cleaned` (File?)
  * `reverseSummary_cleaned` (File?)
  * `forwardData_cleaned` (File?)
  * `reverseData_cleaned` (File?)
  * `adapter_stats` (File?)
  * `phiX_stats` (File?)
  * `polyA_stats` (File?)
  * `Covid19_stats` (File?)
  * `Ecoli_stats` (File?)
  * `dermacoccus_stats` (File?)
  * `dermacoccus_plasmid_stats` (File?)
  * `clockwork_decontamination_stats` (File?)
  * `ptrimmer_stats` (File?)
  * `vcf_structural_variants` (File?)
  * `vcf` (File?)
  * `snpit_log` (File?)
  * `lineage_report_cdc` (File?)
  * `lab_log` (File?)
  * `lab_report` (File?)
  * `lims_report` (File?)
  * `multiqc_report` (File?)
