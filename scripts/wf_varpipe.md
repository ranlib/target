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
<p name="wf_varpipe.json">
        <b>wf_varpipe.json</b><br />
        <i>File &mdash; Default: None</i><br />
        json file with drug information for variants.
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

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_varpipe.no_trim">
        <b>wf_varpipe.no_trim</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.run_clockwork_decontamination">
        <b>wf_varpipe.run_clockwork_decontamination</b><br />
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
<p name="wf_varpipe.task_bbduk.memory">
        <b>wf_varpipe.task_bbduk.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
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
<p name="wf_varpipe.task_delly.docker">
        <b>wf_varpipe.task_delly.docker</b><br />
        <i>String &mdash; Default: "dbest/delly:v1.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.task_delly.memory">
        <b>wf_varpipe.task_delly.memory</b><br />
        <i>String &mdash; Default: "32GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_delly.svType">
        <b>wf_varpipe.task_delly.svType</b><br />
        <i>String &mdash; Default: "DEL"</i><br />
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
<p name="wf_varpipe.task_fastqc.adapters">
        <b>wf_varpipe.task_fastqc.adapters</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastqc.contaminants">
        <b>wf_varpipe.task_fastqc.contaminants</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastqc.docker">
        <b>wf_varpipe.task_fastqc.docker</b><br />
        <i>String &mdash; Default: "staphb/fastqc:0.12.1"</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastqc.memory">
        <b>wf_varpipe.task_fastqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastqc.threads">
        <b>wf_varpipe.task_fastqc.threads</b><br />
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
<p name="wf_varpipe.task_variant_interpretation.all_genes">
        <b>wf_varpipe.task_variant_interpretation.all_genes</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_varpipe.task_variant_interpretation.docker">
        <b>wf_varpipe.task_variant_interpretation.docker</b><br />
        <i>String &mdash; Default: "dbest/variant_interpretation:v1.0.2"</i><br />
        ???
</p>
<p name="wf_varpipe.task_variant_interpretation.memory">
        <b>wf_varpipe.task_variant_interpretation.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_variant_interpretation.minimum_coverage">
        <b>wf_varpipe.task_variant_interpretation.minimum_coverage</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_varpipe.task_variant_interpretation.minimum_total_depth">
        <b>wf_varpipe.task_variant_interpretation.minimum_total_depth</b><br />
        <i>Int &mdash; Default: 0</i><br />
        ???
</p>
<p name="wf_varpipe.task_variant_interpretation.minimum_variant_depth">
        <b>wf_varpipe.task_variant_interpretation.minimum_variant_depth</b><br />
        <i>Int &mdash; Default: 0</i><br />
        ???
</p>
<p name="wf_varpipe.task_varpipe.docker">
        <b>wf_varpipe.task_varpipe.docker</b><br />
        <i>String &mdash; Default: "dbest/varpipe4:v1.0.0"</i><br />
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
<p name="wf_varpipe.wf_clockwork_decontamination.map_reads.memory">
        <b>wf_varpipe.wf_clockwork_decontamination.map_reads.memory</b><br />
        <i>String &mdash; Default: "32GB"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_clockwork_decontamination.remove_contam.docker">
        <b>wf_varpipe.wf_clockwork_decontamination.remove_contam.docker</b><br />
        <i>String &mdash; Default: "dbest/clockwork:v1.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.wf_clockwork_decontamination.remove_contam.memory">
        <b>wf_varpipe.wf_clockwork_decontamination.remove_contam.memory</b><br />
        <i>String &mdash; Default: "32GB"</i><br />
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
<p name="wf_varpipe.collect_wgs_output_metrics">
        <b>wf_varpipe.collect_wgs_output_metrics</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.dellyVcf">
        <b>wf_varpipe.dellyVcf</b><br />
        <i>File?</i><br />
        Ouput vcf file from delly structural variant caller.
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
<p name="wf_varpipe.forwardData">
        <b>wf_varpipe.forwardData</b><br />
        <i>File</i><br />
        Fastqc output data for forward reads.
</p>
<p name="wf_varpipe.forwardHtml">
        <b>wf_varpipe.forwardHtml</b><br />
        <i>File</i><br />
        Fastqc output html file for forward reads.
</p>
<p name="wf_varpipe.forwardSummary">
        <b>wf_varpipe.forwardSummary</b><br />
        <i>File</i><br />
        Fastqc output summary file for forward reads.
</p>
<p name="wf_varpipe.forwardZip">
        <b>wf_varpipe.forwardZip</b><br />
        <i>File</i><br />
        Fastqc output zip file for forward reads.
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
<p name="wf_varpipe.interpretation_report">
        <b>wf_varpipe.interpretation_report</b><br />
        <i>File?</i><br />
        Output tsv file from variant interpretation.
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
<p name="wf_varpipe.reverseHtml">
        <b>wf_varpipe.reverseHtml</b><br />
        <i>File</i><br />
        Fastqc output html file for reverse reads.
</p>
<p name="wf_varpipe.reverseSummary">
        <b>wf_varpipe.reverseSummary</b><br />
        <i>File</i><br />
        Fastqc output summary file for reverse reads.
</p>
<p name="wf_varpipe.reverseZip">
        <b>wf_varpipe.reverseZip</b><br />
        <i>File</i><br />
        Fastqc output zip file for reverse reads.
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

<hr />

> Generated using WDL AID (1.0.0)
