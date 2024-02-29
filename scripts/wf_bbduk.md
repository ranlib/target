# wf_bbduk
## Decontamination with bbduk

## Inputs

### Required inputs
<p name="wf_bbduk.forwardReads">
        <b>wf_bbduk.forwardReads</b><br />
        <i>File &mdash; Default: None</i><br />
        fastq file with forward reads.
</p>
<p name="wf_bbduk.reverseReads">
        <b>wf_bbduk.reverseReads</b><br />
        <i>File &mdash; Default: None</i><br />
        fastq file with reverse reads.
</p>
<p name="wf_bbduk.samplename">
        <b>wf_bbduk.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_bbduk.disk_size">
        <b>wf_bbduk.disk_size</b><br />
        <i>Int &mdash; Default: 100</i><br />
        ???
</p>
<p name="wf_bbduk.memory">
        <b>wf_bbduk.memory</b><br />
        <i>String &mdash; Default: "6GB"</i><br />
        ???
</p>
<p name="wf_bbduk.task_bbduk.docker">
        <b>wf_bbduk.task_bbduk.docker</b><br />
        <i>String &mdash; Default: "staphb/bbtools:39.01"</i><br />
        ???
</p>
<p name="wf_bbduk.task_bbduk.keep">
        <b>wf_bbduk.task_bbduk.keep</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_bbduk.task_bbduk.number_of_retries">
        <b>wf_bbduk.task_bbduk.number_of_retries</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_bbduk.threads">
        <b>wf_bbduk.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_bbduk.adapter_stats">
        <b>wf_bbduk.adapter_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_bbduk.Covid19_stats">
        <b>wf_bbduk.Covid19_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_bbduk.Ecoli_stats">
        <b>wf_bbduk.Ecoli_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_bbduk.NZ_CP008889_plasmid_stats">
        <b>wf_bbduk.NZ_CP008889_plasmid_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_bbduk.NZ_CP008889_stats">
        <b>wf_bbduk.NZ_CP008889_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_bbduk.phiX_stats">
        <b>wf_bbduk.phiX_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_bbduk.pipeline_date">
        <b>wf_bbduk.pipeline_date</b><br />
        <i>String</i><br />
        ???
</p>
<p name="wf_bbduk.polyA_stats">
        <b>wf_bbduk.polyA_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_bbduk.read1_clean">
        <b>wf_bbduk.read1_clean</b><br />
        <i>File</i><br />
        Cleaned output fastq file for forward reads.
</p>
<p name="wf_bbduk.read2_clean">
        <b>wf_bbduk.read2_clean</b><br />
        <i>File</i><br />
        Cleaned output fastq file for reverse reads.
</p>

<hr />

> Generated using WDL AID (1.0.0)
