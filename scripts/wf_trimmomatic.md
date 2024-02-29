# wf_trimmomatic
## Read base quality trimming

## Inputs

### Required inputs
<p name="wf_trimmomatic.read1_files">
        <b>wf_trimmomatic.read1_files</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with forward reads.
</p>
<p name="wf_trimmomatic.read2_files">
        <b>wf_trimmomatic.read2_files</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with reverse reads.
</p>
<p name="wf_trimmomatic.samplenames">
        <b>wf_trimmomatic.samplenames</b><br />
        <i>Array[String]+ &mdash; Default: None</i><br />
        List of sample names.
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_trimmomatic.task_trimmomatic.disk_size">
        <b>wf_trimmomatic.task_trimmomatic.disk_size</b><br />
        <i>Int &mdash; Default: 100</i><br />
        ???
</p>
<p name="wf_trimmomatic.task_trimmomatic.docker">
        <b>wf_trimmomatic.task_trimmomatic.docker</b><br />
        <i>String &mdash; Default: "staphb/trimmomatic:0.39"</i><br />
        ???
</p>
<p name="wf_trimmomatic.task_trimmomatic.memory">
        <b>wf_trimmomatic.task_trimmomatic.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_trimmomatic.task_trimmomatic.threads">
        <b>wf_trimmomatic.task_trimmomatic.threads</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
<p name="wf_trimmomatic.task_trimmomatic.trimmomatic_minlen">
        <b>wf_trimmomatic.task_trimmomatic.trimmomatic_minlen</b><br />
        <i>Int &mdash; Default: 40</i><br />
        ???
</p>
<p name="wf_trimmomatic.task_trimmomatic.trimmomatic_quality_trim_score">
        <b>wf_trimmomatic.task_trimmomatic.trimmomatic_quality_trim_score</b><br />
        <i>Int &mdash; Default: 15</i><br />
        ???
</p>
<p name="wf_trimmomatic.task_trimmomatic.trimmomatic_window_size">
        <b>wf_trimmomatic.task_trimmomatic.trimmomatic_window_size</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_trimmomatic.err_files">
        <b>wf_trimmomatic.err_files</b><br />
        <i>Array[File]</i><br />
        List of text files with trimming error log.
</p>
<p name="wf_trimmomatic.log_files">
        <b>wf_trimmomatic.log_files</b><br />
        <i>Array[File]</i><br />
        List of text files with trimming log.
</p>
<p name="wf_trimmomatic.pipeline_dates">
        <b>wf_trimmomatic.pipeline_dates</b><br />
        <i>Array[String]</i><br />
        ???
</p>
<p name="wf_trimmomatic.read1_trimmed_files">
        <b>wf_trimmomatic.read1_trimmed_files</b><br />
        <i>Array[File]</i><br />
        List of trimmed output fastq file for forward reads.
</p>
<p name="wf_trimmomatic.read2_trimmed_files">
        <b>wf_trimmomatic.read2_trimmed_files</b><br />
        <i>Array[File]</i><br />
        List of trimmed output fastq file for reverse reads.
</p>
<p name="wf_trimmomatic.stats_files">
        <b>wf_trimmomatic.stats_files</b><br />
        <i>Array[File]</i><br />
        List of text files with trimming statistics.
</p>
<p name="wf_trimmomatic.versions">
        <b>wf_trimmomatic.versions</b><br />
        <i>Array[String]</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
