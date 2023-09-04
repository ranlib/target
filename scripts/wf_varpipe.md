# wf_varpipe
## variant pipeline 
 This is the CDC TB profiler: https://github.com/CDCgov/NCHHSTP-DTBE-Varpipe-WGS.

 This also runs fastq QC, decontamination, and alignment QC.

## Inputs

### Required inputs
<p name="wf_varpipe.bed">
        <b>wf_varpipe.bed</b><br />
        <i>File &mdash; Default: None</i><br />
        bed file with genomic intervals of interest. Note: reference name in case of London TB profiler is 'Chromosome', make sure to use correct bed file
</p>
<p name="wf_varpipe.clockwork_contaminants">
        <b>wf_varpipe.clockwork_contaminants</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.clockwork_decontamination_metadata">
        <b>wf_varpipe.clockwork_decontamination_metadata</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.config">
        <b>wf_varpipe.config</b><br />
        <i>File &mdash; Default: None</i><br />
        Configuration file with parameters for the pipeline.
</p>
<p name="wf_varpipe.fastq_screen_configuration">
        <b>wf_varpipe.fastq_screen_configuration</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.fastq_screen_contaminants">
        <b>wf_varpipe.fastq_screen_contaminants</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.json">
        <b>wf_varpipe.json</b><br />
        <i>File &mdash; Default: None</i><br />
        json file with drug information for variants.
</p>
<p name="wf_varpipe.lineage_markers">
        <b>wf_varpipe.lineage_markers</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.outdir">
        <b>wf_varpipe.outdir</b><br />
        <i>String &mdash; Default: None</i><br />
        Alphanumeric name of output directory.
</p>
<p name="wf_varpipe.read1">
        <b>wf_varpipe.read1</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with forward reads. Must have suffix fastq.gz or fq.gz.
</p>
<p name="wf_varpipe.read2">
        <b>wf_varpipe.read2</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with reverse reads. Must have suffix fastq.gz or fq.gz.
</p>
<p name="wf_varpipe.reference">
        <b>wf_varpipe.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        Reference sequence to align to in fasta format.
</p>
<p name="wf_varpipe.samplename">
        <b>wf_varpipe.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        Alphanumeric name of the sample.
</p>
<p name="wf_varpipe.snpEff_config">
        <b>wf_varpipe.snpEff_config</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.snpEff_data_dir">
        <b>wf_varpipe.snpEff_data_dir</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_varpipe.task_fastqc.docker">
        <b>wf_varpipe.task_fastqc.docker</b><br />
        <i>String &mdash; Default: "staphb/fastqc:0.12.1"</i><br />
        The docker image used for this task.
</p>
<p name="wf_varpipe.task_fastqc.memory">
        <b>wf_varpipe.task_fastqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        The amount of memory this job will use.
</p>
<p name="wf_varpipe.task_fastqc_after_cleanup.docker">
        <b>wf_varpipe.task_fastqc_after_cleanup.docker</b><br />
        <i>String &mdash; Default: "staphb/fastqc:0.12.1"</i><br />
        The docker image used for this task.
</p>
<p name="wf_varpipe.task_fastqc_after_cleanup.memory">
        <b>wf_varpipe.task_fastqc_after_cleanup.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        The amount of memory this job will use.
</p>
</details>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_varpipe.no_trim">
        <b>wf_varpipe.no_trim</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.output_vcf_name">
        <b>wf_varpipe.output_vcf_name</b><br />
        <i>String &mdash; Default: "all_variants.vcf"</i><br />
        ???
</p>
<p name="wf_varpipe.run_clockwork_decontamination">
        <b>wf_varpipe.run_clockwork_decontamination</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.run_fastq_screen">
        <b>wf_varpipe.run_fastq_screen</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.run_fastqc_after_cleanup">
        <b>wf_varpipe.run_fastqc_after_cleanup</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.run_variant_interpretation">
        <b>wf_varpipe.run_variant_interpretation</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.task_bbduk.contamination">
        <b>wf_varpipe.task_bbduk.contamination</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.task_bbduk.docker">
        <b>wf_varpipe.task_bbduk.docker</b><br />
        <i>String &mdash; Default: "staphb/bbtools:39.01"</i><br />
        ???
</p>
<p name="wf_varpipe.task_bbduk.keep">
        <b>wf_varpipe.task_bbduk.keep</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_varpipe.task_bbduk.memory">
        <b>wf_varpipe.task_bbduk.memory</b><br />
        <i>String &mdash; Default: "32GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_bbduk.threads">
        <b>wf_varpipe.task_bbduk.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_multiple_metrics.docker">
        <b>wf_varpipe.task_collect_multiple_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_multiple_metrics.memory">
        <b>wf_varpipe.task_collect_multiple_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_multiple_metrics.outputBasename">
        <b>wf_varpipe.task_collect_multiple_metrics.outputBasename</b><br />
        <i>String &mdash; Default: "multiple_metrics"</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.bed">
        <b>wf_varpipe.task_collect_wgs_metrics.bed</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.coverage_cap">
        <b>wf_varpipe.task_collect_wgs_metrics.coverage_cap</b><br />
        <i>Int &mdash; Default: 250</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.docker">
        <b>wf_varpipe.task_collect_wgs_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.memory">
        <b>wf_varpipe.task_collect_wgs_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.minBaseQuality">
        <b>wf_varpipe.task_collect_wgs_metrics.minBaseQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.minMappingQuality">
        <b>wf_varpipe.task_collect_wgs_metrics.minMappingQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.outputFile">
        <b>wf_varpipe.task_collect_wgs_metrics.outputFile</b><br />
        <i>String &mdash; Default: "collect_wgs_metrics.txt"</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.read_length">
        <b>wf_varpipe.task_collect_wgs_metrics.read_length</b><br />
        <i>Int &mdash; Default: 150</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.sample_size">
        <b>wf_varpipe.task_collect_wgs_metrics.sample_size</b><br />
        <i>Int &mdash; Default: 10000</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.sensitivityFile">
        <b>wf_varpipe.task_collect_wgs_metrics.sensitivityFile</b><br />
        <i>String &mdash; Default: "collect_wgs_sensitivity_metrics.txt"</i><br />
        ???
</p>
<p name="wf_varpipe.task_collect_wgs_metrics.use_fast_algorithm">
        <b>wf_varpipe.task_collect_wgs_metrics.use_fast_algorithm</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.task_concat_2_vcfs.docker">
        <b>wf_varpipe.task_concat_2_vcfs.docker</b><br />
        <i>String &mdash; Default: "staphb/bcftools:1.17"</i><br />
        ???
</p>
<p name="wf_varpipe.task_depth_of_coverage.docker">
        <b>wf_varpipe.task_depth_of_coverage.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.task_depth_of_coverage.lower_coverage">
        <b>wf_varpipe.task_depth_of_coverage.lower_coverage</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_varpipe.task_depth_of_coverage.memory">
        <b>wf_varpipe.task_depth_of_coverage.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_depth_of_coverage.min_base_quality">
        <b>wf_varpipe.task_depth_of_coverage.min_base_quality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_varpipe.task_depth_of_coverage.outputPrefix">
        <b>wf_varpipe.task_depth_of_coverage.outputPrefix</b><br />
        <i>String &mdash; Default: "depth_of_coverage"</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastq_screen.aligner">
        <b>wf_varpipe.task_fastq_screen.aligner</b><br />
        <i>String &mdash; Default: "bwa"</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastq_screen.docker">
        <b>wf_varpipe.task_fastq_screen.docker</b><br />
        <i>String &mdash; Default: "dbest/fastq_screen:v0.15.3"</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastq_screen.memory">
        <b>wf_varpipe.task_fastq_screen.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastq_screen.subset">
        <b>wf_varpipe.task_fastq_screen.subset</b><br />
        <i>Int &mdash; Default: 100000</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastq_screen.threads">
        <b>wf_varpipe.task_fastq_screen.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_varpipe.task_multiqc.docker">
        <b>wf_varpipe.task_multiqc.docker</b><br />
        <i>String &mdash; Default: "ewels/multiqc:v1.14"</i><br />
        ???
</p>
<p name="wf_varpipe.task_multiqc.memory">
        <b>wf_varpipe.task_multiqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_trimmomatic.docker">
        <b>wf_varpipe.task_trimmomatic.docker</b><br />
        <i>String &mdash; Default: "staphb/trimmomatic:0.39"</i><br />
        ???
</p>
<p name="wf_varpipe.task_trimmomatic.memory">
        <b>wf_varpipe.task_trimmomatic.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_trimmomatic.threads">
        <b>wf_varpipe.task_trimmomatic.threads</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
<p name="wf_varpipe.task_trimmomatic.trimmomatic_minlen">
        <b>wf_varpipe.task_trimmomatic.trimmomatic_minlen</b><br />
        <i>Int &mdash; Default: 40</i><br />
        ???
</p>
<p name="wf_varpipe.task_trimmomatic.trimmomatic_quality_trim_score">
        <b>wf_varpipe.task_trimmomatic.trimmomatic_quality_trim_score</b><br />
        <i>Int &mdash; Default: 15</i><br />
        ???
</p>
<p name="wf_varpipe.task_trimmomatic.trimmomatic_window_size">
        <b>wf_varpipe.task_trimmomatic.trimmomatic_window_size</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
<p name="wf_varpipe.task_varpipe.docker">
        <b>wf_varpipe.task_varpipe.docker</b><br />
        <i>String &mdash; Default: "dbest/varpipe4:v1.0.2"</i><br />
        ???
</p>
<p name="wf_varpipe.task_varpipe.memory">
        <b>wf_varpipe.task_varpipe.memory</b><br />
        <i>String &mdash; Default: "32GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_varpipe.threads">
        <b>wf_varpipe.task_varpipe.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_varpipe.wf_clockwork_decontamination.map_reads.docker">
        <b>wf_varpipe.wf_clockwork_decontamination.map_reads.docker</b><br />
        <i>String &mdash; Default: "dbest/clockwork:v1.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_clockwork_decontamination.memory">
        <b>wf_varpipe.wf_clockwork_decontamination.memory</b><br />
        <i>String &mdash; Default: "64GB"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_clockwork_decontamination.remove_contam.docker">
        <b>wf_varpipe.wf_clockwork_decontamination.remove_contam.docker</b><br />
        <i>String &mdash; Default: "dbest/clockwork:v1.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_clockwork_decontamination.threads">
        <b>wf_varpipe.wf_clockwork_decontamination.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.clip_overlapping_reads">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.clip_overlapping_reads</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.coverage_cap">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.coverage_cap</b><br />
        <i>Int &mdash; Default: 250</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.docker">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.memory">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minBaseQuality">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minBaseQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minMappingQuality">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minMappingQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.outputMetrics">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.outputMetrics</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_metrics.txt"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sample_size">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sample_size</b><br />
        <i>Int &mdash; Default: 10000</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sensitivityFile">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sensitivityFile</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_sensitivity_metrics.txt"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.target_coverage_file">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.target_coverage_file</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_target_coverage.txt"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_add_pg_tag_to_read">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_add_pg_tag_to_read</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_duplicates">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_duplicates</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_sequencing_duplicates">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_sequencing_duplicates</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.docker">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.marked_bam">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.marked_bam</b><br />
        <i>String? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.memory">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.metrics_txt">
        <b>wf_varpipe.wf_collect_targeted_pcr_metrics.task_mark_duplicates.metrics_txt</b><br />
        <i>String &mdash; Default: "mark_duplicates_metrics.txt"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_interpretation.interpretation_docker">
        <b>wf_varpipe.wf_interpretation.interpretation_docker</b><br />
        <i>String &mdash; Default: "dbest/variant_interpretation:v1.0.6"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_interpretation.interpretation_memory">
        <b>wf_varpipe.wf_interpretation.interpretation_memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_interpretation.interpretation_report">
        <b>wf_varpipe.wf_interpretation.interpretation_report</b><br />
        <i>String &mdash; Default: "variant_interpretation.tsv"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_interpretation.lims_docker">
        <b>wf_varpipe.wf_interpretation.lims_docker</b><br />
        <i>String &mdash; Default: "dbest/lims_report:v1.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_interpretation.lims_operator">
        <b>wf_varpipe.wf_interpretation.lims_operator</b><br />
        <i>String &mdash; Default: "DB"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_interpretation.lims_report_name">
        <b>wf_varpipe.wf_interpretation.lims_report_name</b><br />
        <i>String &mdash; Default: "lims_report.tsv"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_interpretation.lineage_docker">
        <b>wf_varpipe.wf_interpretation.lineage_docker</b><br />
        <i>String &mdash; Default: "dbest/lineage:v1.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_interpretation.lineage_report_name">
        <b>wf_varpipe.wf_interpretation.lineage_report_name</b><br />
        <i>String &mdash; Default: "lineages.tsv"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_interpretation.verbose">
        <b>wf_varpipe.wf_interpretation.verbose</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.delly_docker">
        <b>wf_varpipe.wf_structural_variants.delly_docker</b><br />
        <i>String &mdash; Default: "dbest/delly:v1.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.delly_memory">
        <b>wf_varpipe.wf_structural_variants.delly_memory</b><br />
        <i>String &mdash; Default: "32GB"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.hgvs">
        <b>wf_varpipe.wf_structural_variants.hgvs</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.lof">
        <b>wf_varpipe.wf_structural_variants.lof</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.noDownstream">
        <b>wf_varpipe.wf_structural_variants.noDownstream</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.noIntergenic">
        <b>wf_varpipe.wf_structural_variants.noIntergenic</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.noShiftHgvs">
        <b>wf_varpipe.wf_structural_variants.noShiftHgvs</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.output_vcf_name">
        <b>wf_varpipe.wf_structural_variants.output_vcf_name</b><br />
        <i>String &mdash; Default: "structural_variants.vcf"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.snpEff_docker">
        <b>wf_varpipe.wf_structural_variants.snpEff_docker</b><br />
        <i>String &mdash; Default: "quay.io/biocontainers/snpeff:5.1d--hdfd78af_0"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.snpEff_javaXmx">
        <b>wf_varpipe.wf_structural_variants.snpEff_javaXmx</b><br />
        <i>String &mdash; Default: "8G"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.snpEff_memory">
        <b>wf_varpipe.wf_structural_variants.snpEff_memory</b><br />
        <i>String &mdash; Default: "9G"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.svType">
        <b>wf_varpipe.wf_structural_variants.svType</b><br />
        <i>String &mdash; Default: "DEL"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_structural_variants.upDownStreamLen">
        <b>wf_varpipe.wf_structural_variants.upDownStreamLen</b><br />
        <i>Int &mdash; Default: 400</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_varpipe.adapter_stats">
        <b>wf_varpipe.adapter_stats</b><br />
        <i>File?</i><br />
        Name file where decontamination procedure writes adapter contamination statistics to.
</p>
<p name="wf_varpipe.bai">
        <b>wf_varpipe.bai</b><br />
        <i>File?</i><br />
        Index file for output alignement file of alignment procedure, aligner is bwa.
</p>
<p name="wf_varpipe.bam">
        <b>wf_varpipe.bam</b><br />
        <i>File?</i><br />
        Output alignement file of alignment procedure, aligner is bwa.
</p>
<p name="wf_varpipe.clockwork_decontamination_stats">
        <b>wf_varpipe.clockwork_decontamination_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.collect_targeted_pcr_metrics">
        <b>wf_varpipe.collect_targeted_pcr_metrics</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.collect_targeted_pcr_sensitivity">
        <b>wf_varpipe.collect_targeted_pcr_sensitivity</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.collect_targeted_pcr_target_coverage">
        <b>wf_varpipe.collect_targeted_pcr_target_coverage</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.collect_wgs_output_metrics">
        <b>wf_varpipe.collect_wgs_output_metrics</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.Covid19_stats">
        <b>wf_varpipe.Covid19_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.depth_of_coverage_outputs">
        <b>wf_varpipe.depth_of_coverage_outputs</b><br />
        <i>Array[File]?</i><br />
        ???
</p>
<p name="wf_varpipe.DR_loci_annotation">
        <b>wf_varpipe.DR_loci_annotation</b><br />
        <i>File?</i><br />
        Ouput text file with annotated variant calls in regions of interest.
</p>
<p name="wf_varpipe.DR_loci_Final_annotation">
        <b>wf_varpipe.DR_loci_Final_annotation</b><br />
        <i>File?</i><br />
        Ouput text file with annotated variant calls in regions of interest with some selection.
</p>
<p name="wf_varpipe.DR_loci_raw_annotation">
        <b>wf_varpipe.DR_loci_raw_annotation</b><br />
        <i>File?</i><br />
        Ouput vcf file with annotated variant calls in regions of interest.
</p>
<p name="wf_varpipe.Ecoli_stats">
        <b>wf_varpipe.Ecoli_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.fastq_screen_html">
        <b>wf_varpipe.fastq_screen_html</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.fastq_screen_tagged">
        <b>wf_varpipe.fastq_screen_tagged</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.fastq_screen_tagged_filter">
        <b>wf_varpipe.fastq_screen_tagged_filter</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.fastq_screen_txt">
        <b>wf_varpipe.fastq_screen_txt</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.forwardData">
        <b>wf_varpipe.forwardData</b><br />
        <i>File</i><br />
        Fastqc output data for forward reads.
</p>
<p name="wf_varpipe.forwardData_cleaned">
        <b>wf_varpipe.forwardData_cleaned</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.forwardHtml">
        <b>wf_varpipe.forwardHtml</b><br />
        <i>File</i><br />
        Fastqc output html file for forward reads.
</p>
<p name="wf_varpipe.forwardHtml_cleaned">
        <b>wf_varpipe.forwardHtml_cleaned</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.forwardSummary">
        <b>wf_varpipe.forwardSummary</b><br />
        <i>File</i><br />
        Fastqc output summary file for forward reads.
</p>
<p name="wf_varpipe.forwardSummary_cleaned">
        <b>wf_varpipe.forwardSummary_cleaned</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.forwardZip">
        <b>wf_varpipe.forwardZip</b><br />
        <i>File</i><br />
        Fastqc output zip file for forward reads.
</p>
<p name="wf_varpipe.forwardZip_cleaned">
        <b>wf_varpipe.forwardZip_cleaned</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.full_annotation">
        <b>wf_varpipe.full_annotation</b><br />
        <i>File?</i><br />
        Ouput text file with annotated variant calls in regions of interest.
</p>
<p name="wf_varpipe.full_Final_annotation">
        <b>wf_varpipe.full_Final_annotation</b><br />
        <i>File?</i><br />
        Ouput text file with annotated variant calls in regions of interest with some selection.
</p>
<p name="wf_varpipe.full_raw_annotation">
        <b>wf_varpipe.full_raw_annotation</b><br />
        <i>File?</i><br />
        Ouput vcf file with annotated variant calls in regions of interest.
</p>
<p name="wf_varpipe.genome_region_coverage">
        <b>wf_varpipe.genome_region_coverage</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.interpretation">
        <b>wf_varpipe.interpretation</b><br />
        <i>File?</i><br />
        Output tsv file from varpipe interpretation.
</p>
<p name="wf_varpipe.lab_log">
        <b>wf_varpipe.lab_log</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.lab_report">
        <b>wf_varpipe.lab_report</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.lims_report">
        <b>wf_varpipe.lims_report</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.Lineage">
        <b>wf_varpipe.Lineage</b><br />
        <i>File?</i><br />
        Varpipe lineage output.
</p>
<p name="wf_varpipe.lineage_report">
        <b>wf_varpipe.lineage_report</b><br />
        <i>File?</i><br />
        Varpipe lineage report.
</p>
<p name="wf_varpipe.log">
        <b>wf_varpipe.log</b><br />
        <i>File?</i><br />
        Varpipe log file.
</p>
<p name="wf_varpipe.mark_duplicates_metrics">
        <b>wf_varpipe.mark_duplicates_metrics</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.multiple_metrics_outputs">
        <b>wf_varpipe.multiple_metrics_outputs</b><br />
        <i>Array[File]?</i><br />
        ???
</p>
<p name="wf_varpipe.multiqc_report">
        <b>wf_varpipe.multiqc_report</b><br />
        <i>File?</i><br />
        Output html file with QC summary report.
</p>
<p name="wf_varpipe.phiX_stats">
        <b>wf_varpipe.phiX_stats</b><br />
        <i>File?</i><br />
        phiX contamination report from bbduk decontamination task.
</p>
<p name="wf_varpipe.pipeline_date">
        <b>wf_varpipe.pipeline_date</b><br />
        <i>String?</i><br />
        ???
</p>
<p name="wf_varpipe.polyA_stats">
        <b>wf_varpipe.polyA_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.qc_log">
        <b>wf_varpipe.qc_log</b><br />
        <i>File?</i><br />
        Varpipe QC report.
</p>
<p name="wf_varpipe.reverseData">
        <b>wf_varpipe.reverseData</b><br />
        <i>File</i><br />
        Fastqc output data for reverse reads.
</p>
<p name="wf_varpipe.reverseData_cleaned">
        <b>wf_varpipe.reverseData_cleaned</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.reverseHtml">
        <b>wf_varpipe.reverseHtml</b><br />
        <i>File</i><br />
        Fastqc output html file for reverse reads.
</p>
<p name="wf_varpipe.reverseHtml_cleaned">
        <b>wf_varpipe.reverseHtml_cleaned</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.reverseSummary">
        <b>wf_varpipe.reverseSummary</b><br />
        <i>File</i><br />
        Fastqc output summary file for reverse reads.
</p>
<p name="wf_varpipe.reverseSummary_cleaned">
        <b>wf_varpipe.reverseSummary_cleaned</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.reverseZip">
        <b>wf_varpipe.reverseZip</b><br />
        <i>File</i><br />
        Fastqc output zip file for reverse reads.
</p>
<p name="wf_varpipe.reverseZip_cleaned">
        <b>wf_varpipe.reverseZip_cleaned</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.snpEff_summary_full">
        <b>wf_varpipe.snpEff_summary_full</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.snpEff_summary_targets">
        <b>wf_varpipe.snpEff_summary_targets</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.stats">
        <b>wf_varpipe.stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.structural_variants">
        <b>wf_varpipe.structural_variants</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.summary">
        <b>wf_varpipe.summary</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.target_region_coverage">
        <b>wf_varpipe.target_region_coverage</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.trim_err">
        <b>wf_varpipe.trim_err</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.trim_stats">
        <b>wf_varpipe.trim_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.vcf">
        <b>wf_varpipe.vcf</b><br />
        <i>File?</i><br />
        Output vcf file, annotated, concatenated from annotated variant valler vcf and annotated strutural variant caller vcf.
</p>
<p name="wf_varpipe.vcf_structural_variants">
        <b>wf_varpipe.vcf_structural_variants</b><br />
        <i>File?</i><br />
        Output vcf file from delly structural variant caller + annotation from snpEff.
</p>

<hr />

> Generated using WDL AID (1.0.0)
