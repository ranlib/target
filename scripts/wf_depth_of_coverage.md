# wf_depth_of_coverage
A workflow to calculate Depth of Coverage using GATK's DepthOfCoverage tool.

## Inputs

### Required inputs
<p name="wf_depth_of_coverage.bamFile">
        <b>wf_depth_of_coverage.bamFile</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_depth_of_coverage.intervalFile">
        <b>wf_depth_of_coverage.intervalFile</b><br />
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

## Outputs
<p name="wf_depth_of_coverage.coverageOutputs">
        <b>wf_depth_of_coverage.coverageOutputs</b><br />
        <i>Array[File]</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
