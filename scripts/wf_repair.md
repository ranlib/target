# wf_repair
## Repair reads in paired end fastq files

## Inputs

### Required inputs
<p name="wf_repair.read1">
        <b>wf_repair.read1</b><br />
        <i>File &mdash; Default: None</i><br />
        Input fastq file with forward reads
</p>
<p name="wf_repair.read2">
        <b>wf_repair.read2</b><br />
        <i>File &mdash; Default: None</i><br />
        Input fastq file with reverse reads
</p>
<p name="wf_repair.samplename">
        <b>wf_repair.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        Sample name
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_repair.task_repair.docker">
        <b>wf_repair.task_repair.docker</b><br />
        <i>String &mdash; Default: "staphb/bbtools:39.01"</i><br />
        ???
</p>
<p name="wf_repair.task_repair.memory">
        <b>wf_repair.task_repair.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_repair.repaired_read1">
        <b>wf_repair.repaired_read1</b><br />
        <i>File</i><br />
        Output fastq file with forward reads
</p>
<p name="wf_repair.repaired_read2">
        <b>wf_repair.repaired_read2</b><br />
        <i>File</i><br />
        Output fastq file with reverse reads
</p>
<p name="wf_repair.repaired_singletons">
        <b>wf_repair.repaired_singletons</b><br />
        <i>File</i><br />
        Output fastq file with reads that could not be paired
</p>

<hr />

> Generated using WDL AID (1.0.0)
