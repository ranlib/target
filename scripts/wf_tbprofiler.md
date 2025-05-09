# wf_tbprofiler
## variant pipeline 
 This is the London TB profiler: https://github.com/jodyphelan/TBProfiler.

 This also runs fastq QC, decontamination, and alignment QC.

## Inputs

### Required inputs
<p name="wf_tbprofiler.bed">
        <b>wf_tbprofiler.bed</b><br />
        <i>File &mdash; Default: None</i><br />
        bed file with genomic intervals of interest. Note: reference name in case of London TB profiler is 'Chromosome', make sure to use correct bed file
</p>
<p name="wf_tbprofiler.clockwork_contaminants">
        <b>wf_tbprofiler.clockwork_contaminants</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.clockwork_decontamination_metadata">
        <b>wf_tbprofiler.clockwork_decontamination_metadata</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.fastq_screen_configuration">
        <b>wf_tbprofiler.fastq_screen_configuration</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.fastq_screen_contaminants">
        <b>wf_tbprofiler.fastq_screen_contaminants</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.json">
        <b>wf_tbprofiler.json</b><br />
        <i>File &mdash; Default: None</i><br />
        json file with drug information for variants.
</p>
<p name="wf_tbprofiler.lineage_markers">
        <b>wf_tbprofiler.lineage_markers</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.read1">
        <b>wf_tbprofiler.read1</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with forward reads.
</p>
<p name="wf_tbprofiler.read2">
        <b>wf_tbprofiler.read2</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with reverse reads.
</p>
<p name="wf_tbprofiler.reference">
        <b>wf_tbprofiler.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        Reference sequence to align to.
</p>
<p name="wf_tbprofiler.samplename">
        <b>wf_tbprofiler.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        Name of the sample.
</p>
<p name="wf_tbprofiler.snpEff_config">
        <b>wf_tbprofiler.snpEff_config</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.snpEff_data_dir">
        <b>wf_tbprofiler.snpEff_data_dir</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_tbprofiler.task_fastqc.docker">
        <b>wf_tbprofiler.task_fastqc.docker</b><br />
        <i>String &mdash; Default: "staphb/fastqc:0.12.1"</i><br />
        The docker image used for this task.
</p>
<p name="wf_tbprofiler.task_fastqc.memory">
        <b>wf_tbprofiler.task_fastqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        The amount of memory this job will use.
</p>
</details>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_tbprofiler.annotated_structural_variants_name">
        <b>wf_tbprofiler.annotated_structural_variants_name</b><br />
        <i>String &mdash; Default: "annotated_structural_variants.vcf"</i><br />
        ???
</p>
<p name="wf_tbprofiler.genome">
        <b>wf_tbprofiler.genome</b><br />
        <i>String &mdash; Default: "Mycobacterium_tuberculosis_h37rv"</i><br />
        ???
</p>
<p name="wf_tbprofiler.minNumberReads">
        <b>wf_tbprofiler.minNumberReads</b><br />
        <i>Int &mdash; Default: 10000</i><br />
        ???
</p>
<p name="wf_tbprofiler.output_vcf_name">
        <b>wf_tbprofiler.output_vcf_name</b><br />
        <i>String &mdash; Default: "concatenated.vcf"</i><br />
        ???
</p>
<p name="wf_tbprofiler.run_clockwork_decontamination">
        <b>wf_tbprofiler.run_clockwork_decontamination</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_tbprofiler.run_fastq_screen">
        <b>wf_tbprofiler.run_fastq_screen</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_bbduk.contamination">
        <b>wf_tbprofiler.task_bbduk.contamination</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_bbduk.docker">
        <b>wf_tbprofiler.task_bbduk.docker</b><br />
        <i>String &mdash; Default: "staphb/bbtools:39.01"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_bbduk.keep">
        <b>wf_tbprofiler.task_bbduk.keep</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_bbduk.memory">
        <b>wf_tbprofiler.task_bbduk.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_bbduk.threads">
        <b>wf_tbprofiler.task_bbduk.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_bcf2vcf.docker">
        <b>wf_tbprofiler.task_bcf2vcf.docker</b><br />
        <i>String &mdash; Default: "staphb/bcftools:1.17"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_multiple_metrics.docker">
        <b>wf_tbprofiler.task_collect_multiple_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_multiple_metrics.memory">
        <b>wf_tbprofiler.task_collect_multiple_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_multiple_metrics.outputBasename">
        <b>wf_tbprofiler.task_collect_multiple_metrics.outputBasename</b><br />
        <i>String &mdash; Default: "multiple_metrics"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.coverage_cap">
        <b>wf_tbprofiler.task_collect_wgs_metrics.coverage_cap</b><br />
        <i>Int &mdash; Default: 250</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.docker">
        <b>wf_tbprofiler.task_collect_wgs_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.memory">
        <b>wf_tbprofiler.task_collect_wgs_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.minBaseQuality">
        <b>wf_tbprofiler.task_collect_wgs_metrics.minBaseQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.minMappingQuality">
        <b>wf_tbprofiler.task_collect_wgs_metrics.minMappingQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.outputFile">
        <b>wf_tbprofiler.task_collect_wgs_metrics.outputFile</b><br />
        <i>String &mdash; Default: "collect_wgs_metrics.txt"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.read_length">
        <b>wf_tbprofiler.task_collect_wgs_metrics.read_length</b><br />
        <i>Int &mdash; Default: 150</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.sample_size">
        <b>wf_tbprofiler.task_collect_wgs_metrics.sample_size</b><br />
        <i>Int &mdash; Default: 10000</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.sensitivityFile">
        <b>wf_tbprofiler.task_collect_wgs_metrics.sensitivityFile</b><br />
        <i>String &mdash; Default: "collect_wgs_sensitivity_metrics.txt"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_wgs_metrics.use_fast_algorithm">
        <b>wf_tbprofiler.task_collect_wgs_metrics.use_fast_algorithm</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_concat_2_vcfs.docker">
        <b>wf_tbprofiler.task_concat_2_vcfs.docker</b><br />
        <i>String &mdash; Default: "staphb/bcftools:1.17"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_depth_of_coverage.docker">
        <b>wf_tbprofiler.task_depth_of_coverage.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_depth_of_coverage.lower_coverage">
        <b>wf_tbprofiler.task_depth_of_coverage.lower_coverage</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_depth_of_coverage.memory">
        <b>wf_tbprofiler.task_depth_of_coverage.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_depth_of_coverage.min_base_quality">
        <b>wf_tbprofiler.task_depth_of_coverage.min_base_quality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_depth_of_coverage.outputPrefix">
        <b>wf_tbprofiler.task_depth_of_coverage.outputPrefix</b><br />
        <i>String &mdash; Default: "depth_of_coverage"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_fastq_screen.aligner">
        <b>wf_tbprofiler.task_fastq_screen.aligner</b><br />
        <i>String &mdash; Default: "bwa"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_fastq_screen.docker">
        <b>wf_tbprofiler.task_fastq_screen.docker</b><br />
        <i>String &mdash; Default: "dbest/fastq_screen:v0.15.3"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_fastq_screen.memory">
        <b>wf_tbprofiler.task_fastq_screen.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_fastq_screen.subset">
        <b>wf_tbprofiler.task_fastq_screen.subset</b><br />
        <i>Int &mdash; Default: 100000</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_fastq_screen.threads">
        <b>wf_tbprofiler.task_fastq_screen.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_multiqc.docker">
        <b>wf_tbprofiler.task_multiqc.docker</b><br />
        <i>String &mdash; Default: "ewels/multiqc:v1.14"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_multiqc.memory">
        <b>wf_tbprofiler.task_multiqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.csvStats">
        <b>wf_tbprofiler.task_snpEff.csvStats</b><br />
        <i>String &mdash; Default: "snpEff_summary.csv"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.docker">
        <b>wf_tbprofiler.task_snpEff.docker</b><br />
        <i>String &mdash; Default: "quay.io/biocontainers/snpeff:5.1d--hdfd78af_0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.hgvs">
        <b>wf_tbprofiler.task_snpEff.hgvs</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.javaXmx">
        <b>wf_tbprofiler.task_snpEff.javaXmx</b><br />
        <i>String &mdash; Default: "8G"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.lof">
        <b>wf_tbprofiler.task_snpEff.lof</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.memory">
        <b>wf_tbprofiler.task_snpEff.memory</b><br />
        <i>String &mdash; Default: "9G"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.noDownstream">
        <b>wf_tbprofiler.task_snpEff.noDownstream</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.noIntergenic">
        <b>wf_tbprofiler.task_snpEff.noIntergenic</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.noShiftHgvs">
        <b>wf_tbprofiler.task_snpEff.noShiftHgvs</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.stats">
        <b>wf_tbprofiler.task_snpEff.stats</b><br />
        <i>String &mdash; Default: "snpEff_summary.html"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_snpEff.upDownStreamLen">
        <b>wf_tbprofiler.task_snpEff.upDownStreamLen</b><br />
        <i>Int? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.caller">
        <b>wf_tbprofiler.task_tbprofiler.caller</b><br />
        <i>String &mdash; Default: "freebayes"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.cov_frac_threshold">
        <b>wf_tbprofiler.task_tbprofiler.cov_frac_threshold</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.docker">
        <b>wf_tbprofiler.task_tbprofiler.docker</b><br />
        <i>String &mdash; Default: "staphb/tbprofiler:4.4.2"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.mapper">
        <b>wf_tbprofiler.task_tbprofiler.mapper</b><br />
        <i>String &mdash; Default: "bwa"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.memory">
        <b>wf_tbprofiler.task_tbprofiler.memory</b><br />
        <i>String &mdash; Default: "16GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.min_af">
        <b>wf_tbprofiler.task_tbprofiler.min_af</b><br />
        <i>Float &mdash; Default: 0.1</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.min_af_pred">
        <b>wf_tbprofiler.task_tbprofiler.min_af_pred</b><br />
        <i>Float &mdash; Default: 0.1</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.min_depth">
        <b>wf_tbprofiler.task_tbprofiler.min_depth</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.no_trim">
        <b>wf_tbprofiler.task_tbprofiler.no_trim</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.threads">
        <b>wf_tbprofiler.task_tbprofiler.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_trimmomatic.docker">
        <b>wf_tbprofiler.task_trimmomatic.docker</b><br />
        <i>String &mdash; Default: "staphb/trimmomatic:0.39"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_trimmomatic.memory">
        <b>wf_tbprofiler.task_trimmomatic.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_trimmomatic.threads">
        <b>wf_tbprofiler.task_trimmomatic.threads</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_trimmomatic.trimmomatic_minlen">
        <b>wf_tbprofiler.task_trimmomatic.trimmomatic_minlen</b><br />
        <i>Int &mdash; Default: 40</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_trimmomatic.trimmomatic_quality_trim_score">
        <b>wf_tbprofiler.task_trimmomatic.trimmomatic_quality_trim_score</b><br />
        <i>Int &mdash; Default: 15</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_trimmomatic.trimmomatic_window_size">
        <b>wf_tbprofiler.task_trimmomatic.trimmomatic_window_size</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_clockwork_decontamination.map_reads.docker">
        <b>wf_tbprofiler.wf_clockwork_decontamination.map_reads.docker</b><br />
        <i>String &mdash; Default: "dbest/clockwork:v1.0.0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_clockwork_decontamination.memory">
        <b>wf_tbprofiler.wf_clockwork_decontamination.memory</b><br />
        <i>String &mdash; Default: "64GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_clockwork_decontamination.remove_contam.docker">
        <b>wf_tbprofiler.wf_clockwork_decontamination.remove_contam.docker</b><br />
        <i>String &mdash; Default: "dbest/clockwork:v1.0.0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_clockwork_decontamination.threads">
        <b>wf_tbprofiler.wf_clockwork_decontamination.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.clip_overlapping_reads">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.clip_overlapping_reads</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.coverage_cap">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.coverage_cap</b><br />
        <i>Int &mdash; Default: 250</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.docker">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.memory">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minBaseQuality">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minBaseQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minMappingQuality">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minMappingQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.outputMetrics">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.outputMetrics</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_metrics.txt"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sample_size">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sample_size</b><br />
        <i>Int &mdash; Default: 10000</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sensitivityFile">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sensitivityFile</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_sensitivity_metrics.txt"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.target_coverage_file">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.target_coverage_file</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_target_coverage.txt"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_add_pg_tag_to_read">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_add_pg_tag_to_read</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_duplicates">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_duplicates</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_sequencing_duplicates">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_sequencing_duplicates</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.docker">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.marked_bam">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.marked_bam</b><br />
        <i>String? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.memory">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.metrics_txt">
        <b>wf_tbprofiler.wf_collect_targeted_pcr_metrics.task_mark_duplicates.metrics_txt</b><br />
        <i>String &mdash; Default: "mark_duplicates_metrics.txt"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_interpretation.debug">
        <b>wf_tbprofiler.wf_interpretation.debug</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_interpretation.interpretation_docker">
        <b>wf_tbprofiler.wf_interpretation.interpretation_docker</b><br />
        <i>String &mdash; Default: "dbest/variant_interpretation:v1.4.0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_interpretation.interpretation_memory">
        <b>wf_tbprofiler.wf_interpretation.interpretation_memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_interpretation.lims_docker">
        <b>wf_tbprofiler.wf_interpretation.lims_docker</b><br />
        <i>String &mdash; Default: "dbest/lims_report:v1.0.4"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_interpretation.lims_operator">
        <b>wf_tbprofiler.wf_interpretation.lims_operator</b><br />
        <i>String &mdash; Default: "DB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_interpretation.lims_report_name">
        <b>wf_tbprofiler.wf_interpretation.lims_report_name</b><br />
        <i>String &mdash; Default: "lims_report.tsv"</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_interpretation.minimum_allele_percentage">
        <b>wf_tbprofiler.wf_interpretation.minimum_allele_percentage</b><br />
        <i>Float &mdash; Default: 10.0</i><br />
        ???
</p>
<p name="wf_tbprofiler.wf_interpretation.verbose">
        <b>wf_tbprofiler.wf_interpretation.verbose</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_tbprofiler.adapter_stats">
        <b>wf_tbprofiler.adapter_stats</b><br />
        <i>File?</i><br />
        Name file where decontamination procedure writes adapter contamination statistics to.
</p>
<p name="wf_tbprofiler.bai">
        <b>wf_tbprofiler.bai</b><br />
        <i>File?</i><br />
        Index file for output alignement file of alignment procedure, aligner is bwa.
</p>
<p name="wf_tbprofiler.bam">
        <b>wf_tbprofiler.bam</b><br />
        <i>File?</i><br />
        Output alignement file of alignment procedure, aligner is bwa.
</p>
<p name="wf_tbprofiler.clockwork_decontamination_stats">
        <b>wf_tbprofiler.clockwork_decontamination_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.collect_targeted_pcr_metrics">
        <b>wf_tbprofiler.collect_targeted_pcr_metrics</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.collect_wgs_output_metrics">
        <b>wf_tbprofiler.collect_wgs_output_metrics</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.concatenated_vcf">
        <b>wf_tbprofiler.concatenated_vcf</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.Covid19_stats">
        <b>wf_tbprofiler.Covid19_stats</b><br />
        <i>File?</i><br />
        Covid19 contamination report from bbduk decontamination task.
</p>
<p name="wf_tbprofiler.csv">
        <b>wf_tbprofiler.csv</b><br />
        <i>File?</i><br />
        Ouput variant call file in csv format.
</p>
<p name="wf_tbprofiler.depth_of_coverage_outputs">
        <b>wf_tbprofiler.depth_of_coverage_outputs</b><br />
        <i>Array[File]?</i><br />
        ???
</p>
<p name="wf_tbprofiler.Ecoli_stats">
        <b>wf_tbprofiler.Ecoli_stats</b><br />
        <i>File?</i><br />
        Ecoli contamination report from bbduk decontamination task.
</p>
<p name="wf_tbprofiler.forwardData">
        <b>wf_tbprofiler.forwardData</b><br />
        <i>File</i><br />
        Fastqc output data for forward reads.
</p>
<p name="wf_tbprofiler.forwardHtml">
        <b>wf_tbprofiler.forwardHtml</b><br />
        <i>File</i><br />
        Fastqc output html file for forward reads.
</p>
<p name="wf_tbprofiler.forwardSummary">
        <b>wf_tbprofiler.forwardSummary</b><br />
        <i>File</i><br />
        Fastqc output summary file for forward reads.
</p>
<p name="wf_tbprofiler.forwardZip">
        <b>wf_tbprofiler.forwardZip</b><br />
        <i>File</i><br />
        Fastqc output zip file for forward reads.
</p>
<p name="wf_tbprofiler.lab_log">
        <b>wf_tbprofiler.lab_log</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.lab_report">
        <b>wf_tbprofiler.lab_report</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.lims_report">
        <b>wf_tbprofiler.lims_report</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.lineage_report">
        <b>wf_tbprofiler.lineage_report</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.multiple_metrics_outputs">
        <b>wf_tbprofiler.multiple_metrics_outputs</b><br />
        <i>Array[File]?</i><br />
        ???
</p>
<p name="wf_tbprofiler.multiqc_report">
        <b>wf_tbprofiler.multiqc_report</b><br />
        <i>File?</i><br />
        Output html file with QC summary report.
</p>
<p name="wf_tbprofiler.phiX_stats">
        <b>wf_tbprofiler.phiX_stats</b><br />
        <i>File?</i><br />
        phiX contamination report from bbduk decontamination task.
</p>
<p name="wf_tbprofiler.polyA_stats">
        <b>wf_tbprofiler.polyA_stats</b><br />
        <i>File?</i><br />
        polyA contamination report from bbduk decontamination task.
</p>
<p name="wf_tbprofiler.reverseData">
        <b>wf_tbprofiler.reverseData</b><br />
        <i>File</i><br />
        Fastqc output data for reverse reads.
</p>
<p name="wf_tbprofiler.reverseHtml">
        <b>wf_tbprofiler.reverseHtml</b><br />
        <i>File</i><br />
        Fastqc output html file for reverse reads.
</p>
<p name="wf_tbprofiler.reverseSummary">
        <b>wf_tbprofiler.reverseSummary</b><br />
        <i>File</i><br />
        Fastqc output summary file for reverse reads.
</p>
<p name="wf_tbprofiler.reverseZip">
        <b>wf_tbprofiler.reverseZip</b><br />
        <i>File</i><br />
        Fastqc output zip file for reverse reads.
</p>
<p name="wf_tbprofiler.svs">
        <b>wf_tbprofiler.svs</b><br />
        <i>File?</i><br />
        Ouput structural variants call file in vcf format.
</p>
<p name="wf_tbprofiler.trim_stats">
        <b>wf_tbprofiler.trim_stats</b><br />
        <i>File?</i><br />
        Output text file for read trimming statistics.
</p>
<p name="wf_tbprofiler.vcf">
        <b>wf_tbprofiler.vcf</b><br />
        <i>File?</i><br />
        Ouput variant call file in vcf format.
</p>

<hr />

> Generated using WDL AID (1.0.0)
