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
        Name of output directory.
</p>
<p name="wf_varpipe.read1">
        <b>wf_varpipe.read1</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with forward reads.
</p>
<p name="wf_varpipe.read2">
        <b>wf_varpipe.read2</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with reverse reads.
</p>
<p name="wf_varpipe.reference">
        <b>wf_varpipe.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        Reference sequence to align to.
</p>
<p name="wf_varpipe.samplename">
        <b>wf_varpipe.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        Name of the sample.
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_varpipe.no_trim">
        <b>wf_varpipe.no_trim</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_varpipe.noneFile">
        <b>wf_varpipe.noneFile</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_varpipe.RunCollectMultipleMetrics.docker">
        <b>wf_varpipe.RunCollectMultipleMetrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
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
        <i>String &mdash; Default: "2GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_bbduk.threads">
        <b>wf_varpipe.task_bbduk.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_varpipe.task_delly.docker">
        <b>wf_varpipe.task_delly.docker</b><br />
        <i>String &mdash; Default: "dbest/delly:v1.0.0"</i><br />
        ???
</p>
<p name="wf_varpipe.task_delly.svType">
        <b>wf_varpipe.task_delly.svType</b><br />
        <i>String &mdash; Default: "DEL"</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastqc.docker">
        <b>wf_varpipe.task_fastqc.docker</b><br />
        <i>String &mdash; Default: "staphb/fastqc:0.12.1"</i><br />
        ???
</p>
<p name="wf_varpipe.task_fastqc.threads">
        <b>wf_varpipe.task_fastqc.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_varpipe.task_multiqc.docker">
        <b>wf_varpipe.task_multiqc.docker</b><br />
        <i>String &mdash; Default: "ewels/multiqc:1.14"</i><br />
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
        <i>String &mdash; Default: "dbest/variant_interpretation:v1.0.1"</i><br />
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
        <i>String &mdash; Default: "dbest/varpipe4:latest"</i><br />
        ???
</p>
<p name="wf_varpipe.task_varpipe.memory">
        <b>wf_varpipe.task_varpipe.memory</b><br />
        <i>String &mdash; Default: "32 GB"</i><br />
        ???
</p>
<p name="wf_varpipe.task_varpipe.threads">
        <b>wf_varpipe.task_varpipe.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_varpipe.adapter_stats">
        <b>wf_varpipe.adapter_stats</b><br />
        <i>File</i><br />
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
<p name="wf_varpipe.collectMetricsOutput">
        <b>wf_varpipe.collectMetricsOutput</b><br />
        <i>Array[File]?</i><br />
        Array of output files from alignment bam QC.
</p>
<p name="wf_varpipe.dellyVcf">
        <b>wf_varpipe.dellyVcf</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_varpipe.DR_loci_annotation">
        <b>wf_varpipe.DR_loci_annotation</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.DR_loci_Final_annotation">
        <b>wf_varpipe.DR_loci_Final_annotation</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.DR_loci_raw_annotation">
        <b>wf_varpipe.DR_loci_raw_annotation</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.forwardData">
        <b>wf_varpipe.forwardData</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_varpipe.forwardHtml">
        <b>wf_varpipe.forwardHtml</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_varpipe.forwardSummary">
        <b>wf_varpipe.forwardSummary</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_varpipe.forwardZip">
        <b>wf_varpipe.forwardZip</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_varpipe.full_annotation">
        <b>wf_varpipe.full_annotation</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.full_Final_annotation">
        <b>wf_varpipe.full_Final_annotation</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.full_raw_annotation">
        <b>wf_varpipe.full_raw_annotation</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.genome_region_coverage">
        <b>wf_varpipe.genome_region_coverage</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.interpretation">
        <b>wf_varpipe.interpretation</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.interpretation_report">
        <b>wf_varpipe.interpretation_report</b><br />
        <i>File?</i><br />
        Output tsv file from variant interpretation.
</p>
<p name="wf_varpipe.Lineage">
        <b>wf_varpipe.Lineage</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.lineage_report">
        <b>wf_varpipe.lineage_report</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.log">
        <b>wf_varpipe.log</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.mark_duplicates_metrics">
        <b>wf_varpipe.mark_duplicates_metrics</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.multiqc_report">
        <b>wf_varpipe.multiqc_report</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.phiX_stats">
        <b>wf_varpipe.phiX_stats</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_varpipe.pipeline_date">
        <b>wf_varpipe.pipeline_date</b><br />
        <i>String?</i><br />
        ???
</p>
<p name="wf_varpipe.qc_log">
        <b>wf_varpipe.qc_log</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_varpipe.reverseData">
        <b>wf_varpipe.reverseData</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_varpipe.reverseHtml">
        <b>wf_varpipe.reverseHtml</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_varpipe.reverseSummary">
        <b>wf_varpipe.reverseSummary</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_varpipe.reverseZip">
        <b>wf_varpipe.reverseZip</b><br />
        <i>File</i><br />
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

<hr />

> Generated using WDL AID (1.0.0)
