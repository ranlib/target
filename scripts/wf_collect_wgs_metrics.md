# wf_collect_wgs_metrics
## Collect whole genome sequencing QC metrics

## Inputs

### Required inputs
<p name="wf_collect_wgs_metrics.bam">
        <b>wf_collect_wgs_metrics.bam</b><br />
        <i>File &mdash; Default: None</i><br />
        Input bam alignemnt file.
</p>
<p name="wf_collect_wgs_metrics.reference">
        <b>wf_collect_wgs_metrics.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        Reference genome
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.coverage_cap">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.coverage_cap</b><br />
        <i>Int &mdash; Default: 250</i><br />
        ???
</p>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.docker">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.5.0.0"</i><br />
        ???
</p>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.memory">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.minBaseQuality">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.minBaseQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.minMappingQuality">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.minMappingQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.outputFile">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.outputFile</b><br />
        <i>String &mdash; Default: "collect_wgs_metrics.txt"</i><br />
        ???
</p>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.read_length">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.read_length</b><br />
        <i>Int &mdash; Default: 150</i><br />
        ???
</p>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.sample_size">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.sample_size</b><br />
        <i>Int &mdash; Default: 10000</i><br />
        ???
</p>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.sensitivityFile">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.sensitivityFile</b><br />
        <i>String &mdash; Default: "collect_wgs_sensitivity_metrics.txt"</i><br />
        ???
</p>
<p name="wf_collect_wgs_metrics.task_collect_wgs_metrics.use_fast_algorithm">
        <b>wf_collect_wgs_metrics.task_collect_wgs_metrics.use_fast_algorithm</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_collect_wgs_metrics.collectMetricsOutput">
        <b>wf_collect_wgs_metrics.collectMetricsOutput</b><br />
        <i>File</i><br />
        Output text file with QC metrics.
</p>
<p name="wf_collect_wgs_metrics.collectMetricsSensitivity">
        <b>wf_collect_wgs_metrics.collectMetricsSensitivity</b><br />
        <i>File</i><br />
        Output text file with sensitivity metrics.
</p>

<hr />

> Generated using WDL AID (1.0.0)
