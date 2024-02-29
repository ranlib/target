# wf_concatenate_fastq
## Concatenate fastq files

## Inputs

### Required inputs
<p name="wf_concatenate_fastq.forwardFastqFiles">
        <b>wf_concatenate_fastq.forwardFastqFiles</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with forward reads.
</p>
<p name="wf_concatenate_fastq.outputForward">
        <b>wf_concatenate_fastq.outputForward</b><br />
        <i>String &mdash; Default: None</i><br />
        Output fastq file with forward reads.
</p>
<p name="wf_concatenate_fastq.outputReverse">
        <b>wf_concatenate_fastq.outputReverse</b><br />
        <i>String &mdash; Default: None</i><br />
        Output fastq file with reverse reads.
</p>
<p name="wf_concatenate_fastq.reverseFastqFiles">
        <b>wf_concatenate_fastq.reverseFastqFiles</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        List of fastq files with reverse reads.
</p>

## Outputs
<p name="wf_concatenate_fastq.concatenatedForwardFastq">
        <b>wf_concatenate_fastq.concatenatedForwardFastq</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_concatenate_fastq.concatenatedReverseFastq">
        <b>wf_concatenate_fastq.concatenatedReverseFastq</b><br />
        <i>File</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
