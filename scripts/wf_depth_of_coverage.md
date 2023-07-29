# wf_depth_of_coverage
A workflow to calculate Depth of Coverage using GATK's DepthOfCoverage tool.

## Inputs

### Required inputs
<p name="wf_depth_of_coverage.bam">
        <b>wf_depth_of_coverage.bam</b><br />
        <i>File &mdash; Default: None</i><br />
        Input BAM file.
</p>
<p name="wf_depth_of_coverage.bed">
        <b>wf_depth_of_coverage.bed</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_depth_of_coverage.lowerCoverageThreshold">
        <b>wf_depth_of_coverage.lowerCoverageThreshold</b><br />
        <i>Int &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_depth_of_coverage.outputPrefix">
        <b>wf_depth_of_coverage.outputPrefix</b><br />
        <i>String &mdash; Default: None</i><br />
        Output prefix for the coverage analysis.
</p>
<p name="wf_depth_of_coverage.reference">
        <b>wf_depth_of_coverage.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        Reference genome file.
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_depth_of_coverage.task_depth_of_coverage.docker">
        <b>wf_depth_of_coverage.task_depth_of_coverage.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_depth_of_coverage.task_depth_of_coverage.memory">
        <b>wf_depth_of_coverage.task_depth_of_coverage.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_depth_of_coverage.task_depth_of_coverage.min_base_quality">
        <b>wf_depth_of_coverage.task_depth_of_coverage.min_base_quality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_depth_of_coverage.coverageOutputs">
        <b>wf_depth_of_coverage.coverageOutputs</b><br />
        <i>Array[File]</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
