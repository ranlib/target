# wf_lineage
## Lineage caller 
 Determinate tuberculosis lineage based on SNPs.

## Inputs

### Required inputs
<p name="wf_lineage.lineage_markers">
        <b>wf_lineage.lineage_markers</b><br />
        <i>File &mdash; Default: None</i><br />
        tsv file with columns Lineage, Position, Ref, Alt
</p>
<p name="wf_lineage.samplename">
        <b>wf_lineage.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        sample name.
</p>
<p name="wf_lineage.vcf">
        <b>wf_lineage.vcf</b><br />
        <i>File &mdash; Default: None</i><br />
        vcf file or compressed vcf file (suffix vcf.gz)
</p>

## Outputs
<p name="wf_lineage.lineage_report">
        <b>wf_lineage.lineage_report</b><br />
        <i>File</i><br />
        Output tsv file of CDC lineage caller
</p>
<p name="wf_lineage.snpit_log">
        <b>wf_lineage.snpit_log</b><br />
        <i>File</i><br />
        Output tsv file of snpit lineage caller
</p>

<hr />

> Generated using WDL AID (1.0.0)
