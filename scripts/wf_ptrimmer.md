# wf_ptrimmer
## primer trimming workflow.

## Inputs

### Required inputs
<p name="wf_ptrimmer.ampfile">
        <b>wf_ptrimmer.ampfile</b><br />
        <i>File &mdash; Default: None</i><br />
        Input primer file
</p>
<p name="wf_ptrimmer.keep">
        <b>wf_ptrimmer.keep</b><br />
        <i>Boolean &mdash; Default: None</i><br />
        Keep the reads with no primer sequence [default: discard reads]
</p>
<p name="wf_ptrimmer.kmer">
        <b>wf_ptrimmer.kmer</b><br />
        <i>Int &mdash; Default: None</i><br />
        kmer length for indexing [8]
</p>
<p name="wf_ptrimmer.minqual">
        <b>wf_ptrimmer.minqual</b><br />
        <i>Int &mdash; Default: None</i><br />
        the minimum average quality to keep after triming [20]
</p>
<p name="wf_ptrimmer.mismatch">
        <b>wf_ptrimmer.mismatch</b><br />
        <i>Int &mdash; Default: None</i><br />
        Maximum number of mismatches allowed for primer sequence [3]
</p>
<p name="wf_ptrimmer.read1">
        <b>wf_ptrimmer.read1</b><br />
        <i>File &mdash; Default: None</i><br />
        Input fastq files with forward reads. Can be gzipped or not.
</p>
<p name="wf_ptrimmer.read2">
        <b>wf_ptrimmer.read2</b><br />
        <i>File &mdash; Default: None</i><br />
        Input fastq files with reverse reads. Can be gzipped or not.
</p>
<p name="wf_ptrimmer.seqtype">
        <b>wf_ptrimmer.seqtype</b><br />
        <i>String &mdash; Default: None</i><br />
        The sequencing type [single|pair]
</p>
<p name="wf_ptrimmer.trim1">
        <b>wf_ptrimmer.trim1</b><br />
        <i>String &mdash; Default: None</i><br />
        Name of output fastq files with forward reads. Must have suffix .gz
</p>
<p name="wf_ptrimmer.trim2">
        <b>wf_ptrimmer.trim2</b><br />
        <i>String &mdash; Default: None</i><br />
        Name of output fastq files with reverse reads. Must have suffix .gz
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_ptrimmer.task_ptrimmer.docker">
        <b>wf_ptrimmer.task_ptrimmer.docker</b><br />
        <i>String &mdash; Default: "dbest/ptrimmer:v1.3.4"</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_ptrimmer.trimmedRead1">
        <b>wf_ptrimmer.trimmedRead1</b><br />
        <i>File</i><br />
        Output fastq file with forward reads, gzipped, primer sequences removed
</p>
<p name="wf_ptrimmer.trimmedRead2">
        <b>wf_ptrimmer.trimmedRead2</b><br />
        <i>File</i><br />
        Output fastq file with reverse reads, gzipped, primer sequences removed
</p>
<p name="wf_ptrimmer.trimmingSummary">
        <b>wf_ptrimmer.trimmingSummary</b><br />
        <i>File</i><br />
        Trimming information of each amplicon
</p>

<hr />

> Generated using WDL AID (1.0.0)
