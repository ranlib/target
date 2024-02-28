# wf_delly
Workflow to run Delly structural variant caller on multiple BAM files

## Inputs

### Required inputs
<p name="wf_delly.bamFiles">
        <b>wf_delly.bamFiles</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of bam files to process.
</p>
<p name="wf_delly.bamIndices">
        <b>wf_delly.bamIndices</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of index bam files, one index per bam file.
</p>
<p name="wf_delly.reference">
        <b>wf_delly.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        The reference fasta file also used for mapping.
</p>
<p name="wf_delly.svType">
        <b>wf_delly.svType</b><br />
        <i>String &mdash; Default: None</i><br />
        Type of structural variant to look for.
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_delly.task_delly.docker">
        <b>wf_delly.task_delly.docker</b><br />
        <i>String &mdash; Default: "dbest/delly:v1.0.0"</i><br />
        The docker image used for this task.
</p>
<p name="wf_delly.task_delly.memory">
        <b>wf_delly.task_delly.memory</b><br />
        <i>String &mdash; Default: "32GB"</i><br />
        The memory required to run the programs.
</p>
</details>

## Outputs
<p name="wf_delly.vcfFiles">
        <b>wf_delly.vcfFiles</b><br />
        <i>Array[File?]</i><br />
        List of files containing structural variants.
</p>

<hr />

> Generated using WDL AID (1.0.0)
