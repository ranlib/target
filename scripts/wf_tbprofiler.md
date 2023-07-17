# wf_tbprofiler
## variant pipeline 
 This is the London TB profiler: https://github.com/jodyphelan/TBProfiler.

 This also runs fastq QC, decontamination, and alignment QC.

## Inputs

### Required inputs
<p name="wf_tbprofiler.minNumberReads">
        <b>wf_tbprofiler.minNumberReads</b><br />
        <i>Int &mdash; Default: None</i><br />
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
<p name="wf_tbprofiler.run_bamQC">
        <b>wf_tbprofiler.run_bamQC</b><br />
        <i>Boolean &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.run_decontamination">
        <b>wf_tbprofiler.run_decontamination</b><br />
        <i>Boolean &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_tbprofiler.samplename">
        <b>wf_tbprofiler.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        Name of the sample.
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
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
<p name="wf_tbprofiler.task_bbduk.memory">
        <b>wf_tbprofiler.task_bbduk.memory</b><br />
        <i>String &mdash; Default: "2GB"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_bbduk.threads">
        <b>wf_tbprofiler.task_bbduk.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_multiple_metrics.docker">
        <b>wf_tbprofiler.task_collect_multiple_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_collect_multiple_metrics.outputBasename">
        <b>wf_tbprofiler.task_collect_multiple_metrics.outputBasename</b><br />
        <i>String &mdash; Default: "multiple_metrics"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_fastqc.docker">
        <b>wf_tbprofiler.task_fastqc.docker</b><br />
        <i>String &mdash; Default: "staphb/fastqc:0.12.1"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_fastqc.threads">
        <b>wf_tbprofiler.task_fastqc.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_multiqc.docker">
        <b>wf_tbprofiler.task_multiqc.docker</b><br />
        <i>String &mdash; Default: "ewels/multiqc:v1.14"</i><br />
        ???
</p>
<p name="wf_tbprofiler.task_tbprofiler.caller">
        <b>wf_tbprofiler.task_tbprofiler.caller</b><br />
        <i>String &mdash; Default: "bcftools"</i><br />
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
</details>

## Outputs
<p name="wf_tbprofiler.adapter_stats">
        <b>wf_tbprofiler.adapter_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.bai">
        <b>wf_tbprofiler.bai</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.bam">
        <b>wf_tbprofiler.bam</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.collectMetricsOutput">
        <b>wf_tbprofiler.collectMetricsOutput</b><br />
        <i>Array[File]?</i><br />
        ???
</p>
<p name="wf_tbprofiler.csv">
        <b>wf_tbprofiler.csv</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.forwardData">
        <b>wf_tbprofiler.forwardData</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_tbprofiler.forwardHtml">
        <b>wf_tbprofiler.forwardHtml</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_tbprofiler.forwardSummary">
        <b>wf_tbprofiler.forwardSummary</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_tbprofiler.forwardZip">
        <b>wf_tbprofiler.forwardZip</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_tbprofiler.multiqc_report">
        <b>wf_tbprofiler.multiqc_report</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.phiX_stats">
        <b>wf_tbprofiler.phiX_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.reverseData">
        <b>wf_tbprofiler.reverseData</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_tbprofiler.reverseHtml">
        <b>wf_tbprofiler.reverseHtml</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_tbprofiler.reverseSummary">
        <b>wf_tbprofiler.reverseSummary</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_tbprofiler.reverseZip">
        <b>wf_tbprofiler.reverseZip</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_tbprofiler.svs">
        <b>wf_tbprofiler.svs</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.trim_stats">
        <b>wf_tbprofiler.trim_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_tbprofiler.vcf">
        <b>wf_tbprofiler.vcf</b><br />
        <i>File?</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
