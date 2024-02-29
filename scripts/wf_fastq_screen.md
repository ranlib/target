# wf_fastq_screen
## QC screen for fastq files

## Inputs

### Required inputs
<p name="wf_fastq_screen.configuration">
        <b>wf_fastq_screen.configuration</b><br />
        <i>File &mdash; Default: None</i><br />
        configuration file.
</p>
<p name="wf_fastq_screen.contaminants">
        <b>wf_fastq_screen.contaminants</b><br />
        <i>File &mdash; Default: None</i><br />
        tsv file with adapter names in column 1 and sequences in column 2.
</p>
<p name="wf_fastq_screen.reads">
        <b>wf_fastq_screen.reads</b><br />
        <i>File &mdash; Default: None</i><br />
        fastq file
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_fastq_screen.task_fastq_screen.aligner">
        <b>wf_fastq_screen.task_fastq_screen.aligner</b><br />
        <i>String &mdash; Default: "bwa"</i><br />
        ???
</p>
<p name="wf_fastq_screen.task_fastq_screen.docker">
        <b>wf_fastq_screen.task_fastq_screen.docker</b><br />
        <i>String &mdash; Default: "dbest/fastq_screen:v0.15.3"</i><br />
        ???
</p>
<p name="wf_fastq_screen.task_fastq_screen.memory">
        <b>wf_fastq_screen.task_fastq_screen.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
        ???
</p>
<p name="wf_fastq_screen.task_fastq_screen.subset">
        <b>wf_fastq_screen.task_fastq_screen.subset</b><br />
        <i>Int &mdash; Default: 100000</i><br />
        ???
</p>
<p name="wf_fastq_screen.task_fastq_screen.threads">
        <b>wf_fastq_screen.task_fastq_screen.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_fastq_screen.html">
        <b>wf_fastq_screen.html</b><br />
        <i>File</i><br />
        output html file.
</p>
<p name="wf_fastq_screen.tagged">
        <b>wf_fastq_screen.tagged</b><br />
        <i>File</i><br />
        output fastq file with reads tagged according to from which species they are coming from.
</p>
<p name="wf_fastq_screen.tagged_filter">
        <b>wf_fastq_screen.tagged_filter</b><br />
        <i>File</i><br />
        output fastq file with reads from genome 1 only
</p>
<p name="wf_fastq_screen.txt">
        <b>wf_fastq_screen.txt</b><br />
        <i>File</i><br />
        output in text format.
</p>

<hr />

> Generated using WDL AID (1.0.0)
