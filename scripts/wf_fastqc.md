# wf_fastqc
## QC for fastq files

## Inputs

### Required inputs
<p name="wf_fastqc.forwardReads">
        <b>wf_fastqc.forwardReads</b><br />
        <i>File &mdash; Default: None</i><br />
        fastq file with forward reads.
</p>
<p name="wf_fastqc.reverseReads">
        <b>wf_fastqc.reverseReads</b><br />
        <i>File &mdash; Default: None</i><br />
        fastq file with reverse reads.
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_fastqc.task_fastqc.docker">
        <b>wf_fastqc.task_fastqc.docker</b><br />
        <i>String &mdash; Default: "staphb/fastqc:0.12.1"</i><br />
        The docker image used for this task.
</p>
<p name="wf_fastqc.task_fastqc.memory">
        <b>wf_fastqc.task_fastqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        The amount of memory this job will use.
</p>
</details>

## Outputs
<p name="wf_fastqc.forwardData">
        <b>wf_fastqc.forwardData</b><br />
        <i>File</i><br />
        Output data file for forward reads.
</p>
<p name="wf_fastqc.forwardHtml">
        <b>wf_fastqc.forwardHtml</b><br />
        <i>File</i><br />
        Output html file for forward reads.
</p>
<p name="wf_fastqc.forwardSummary">
        <b>wf_fastqc.forwardSummary</b><br />
        <i>File</i><br />
        Output summary file for forward reads.
</p>
<p name="wf_fastqc.forwardZip">
        <b>wf_fastqc.forwardZip</b><br />
        <i>File</i><br />
        Output zip file for forward reads.
</p>
<p name="wf_fastqc.numberForwardReads">
        <b>wf_fastqc.numberForwardReads</b><br />
        <i>Int</i><br />
        Number of forward reads.
</p>
<p name="wf_fastqc.numberReverseReads">
        <b>wf_fastqc.numberReverseReads</b><br />
        <i>Int</i><br />
        Number of reverse reads.
</p>
<p name="wf_fastqc.reverseData">
        <b>wf_fastqc.reverseData</b><br />
        <i>File</i><br />
        Output data file for reverse reads.
</p>
<p name="wf_fastqc.reverseHtml">
        <b>wf_fastqc.reverseHtml</b><br />
        <i>File</i><br />
        Output html file for reverse reads.
</p>
<p name="wf_fastqc.reverseSummary">
        <b>wf_fastqc.reverseSummary</b><br />
        <i>File</i><br />
        Output summary file for reverse reads.
</p>
<p name="wf_fastqc.reverseZip">
        <b>wf_fastqc.reverseZip</b><br />
        <i>File</i><br />
        Output zip file for reverse reads.
</p>

<hr />

> Generated using WDL AID (1.0.0)
