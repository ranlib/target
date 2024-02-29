# wf_collect_multiple_metrics
## Collect multiple QC metrics from bam alignment file

## Inputs

### Required inputs
<p name="wf_collect_multiple_metrics.bam">
        <b>wf_collect_multiple_metrics.bam</b><br />
        <i>File &mdash; Default: None</i><br />
        Input bam alignemnt file.
</p>
<p name="wf_collect_multiple_metrics.reference">
        <b>wf_collect_multiple_metrics.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        Reference genome
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_collect_multiple_metrics.task_collect_multiple_metrics.docker">
        <b>wf_collect_multiple_metrics.task_collect_multiple_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.5.0.0"</i><br />
        ???
</p>
<p name="wf_collect_multiple_metrics.task_collect_multiple_metrics.memory">
        <b>wf_collect_multiple_metrics.task_collect_multiple_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_collect_multiple_metrics.task_collect_multiple_metrics.outputBasename">
        <b>wf_collect_multiple_metrics.task_collect_multiple_metrics.outputBasename</b><br />
        <i>String &mdash; Default: "multiple_metrics"</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_collect_multiple_metrics.collectMetricsOutput">
        <b>wf_collect_multiple_metrics.collectMetricsOutput</b><br />
        <i>Array[File]</i><br />
        Output text file with QC metrics.
</p>

<hr />

> Generated using WDL AID (1.0.0)
