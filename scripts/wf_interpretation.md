# wf_interpretation
## interpretation 
 This is the interpretation workflow.



## Inputs

### Required inputs
<p name="wf_interpretation.bai">
        <b>wf_interpretation.bai</b><br />
        <i>File &mdash; Default: None</i><br />
        bam index file output from CDC/London TB profiler pipeline.
</p>
<p name="wf_interpretation.bam">
        <b>wf_interpretation.bam</b><br />
        <i>File &mdash; Default: None</i><br />
        bam file output from CDC/London TB profiler pipeline.
</p>
<p name="wf_interpretation.bed">
        <b>wf_interpretation.bed</b><br />
        <i>File &mdash; Default: None</i><br />
        bed file with genomic intervals of interest. Note: reference name in case of London TB profiler is 'Chromosome', make sure to use correct bed file
</p>
<p name="wf_interpretation.json">
        <b>wf_interpretation.json</b><br />
        <i>File &mdash; Default: None</i><br />
        json file with drug information for variants.
</p>
<p name="wf_interpretation.samplename">
        <b>wf_interpretation.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_interpretation.vcf">
        <b>wf_interpretation.vcf</b><br />
        <i>File &mdash; Default: None</i><br />
        vcf file or compressed vcf file (suffix vcf.gz) output from CDC/London TB profiler pipeline.
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_interpretation.input_annotation">
        <b>wf_interpretation.input_annotation</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_interpretation.lims_tsv">
        <b>wf_interpretation.lims_tsv</b><br />
        <i>String &mdash; Default: "lims_report.tsv"</i><br />
        ???
</p>
<p name="wf_interpretation.lineage_markers">
        <b>wf_interpretation.lineage_markers</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_interpretation.lineages_tsv">
        <b>wf_interpretation.lineages_tsv</b><br />
        <i>String &mdash; Default: "lineages.tsv"</i><br />
        ???
</p>
<p name="wf_interpretation.operator">
        <b>wf_interpretation.operator</b><br />
        <i>String &mdash; Default: "DB"</i><br />
        ???
</p>
<p name="wf_interpretation.task_lims_report.docker">
        <b>wf_interpretation.task_lims_report.docker</b><br />
        <i>String &mdash; Default: "dbest/lims_report:v1.0.0"</i><br />
        ???
</p>
<p name="wf_interpretation.task_lineage.docker">
        <b>wf_interpretation.task_lineage.docker</b><br />
        <i>String &mdash; Default: "dbest/lineage:v1.0.0"</i><br />
        ???
</p>
<p name="wf_interpretation.task_variant_interpretation.docker">
        <b>wf_interpretation.task_variant_interpretation.docker</b><br />
        <i>String &mdash; Default: "dbest/variant_interpretation:v1.0.5"</i><br />
        ???
</p>
<p name="wf_interpretation.task_variant_interpretation.filter_genes">
        <b>wf_interpretation.task_variant_interpretation.filter_genes</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_interpretation.task_variant_interpretation.memory">
        <b>wf_interpretation.task_variant_interpretation.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_interpretation.task_variant_interpretation.minimum_coverage">
        <b>wf_interpretation.task_variant_interpretation.minimum_coverage</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_interpretation.task_variant_interpretation.minimum_total_depth">
        <b>wf_interpretation.task_variant_interpretation.minimum_total_depth</b><br />
        <i>Int &mdash; Default: 0</i><br />
        ???
</p>
<p name="wf_interpretation.task_variant_interpretation.minimum_variant_depth">
        <b>wf_interpretation.task_variant_interpretation.minimum_variant_depth</b><br />
        <i>Int &mdash; Default: 0</i><br />
        ???
</p>
<p name="wf_interpretation.task_variant_interpretation.verbose">
        <b>wf_interpretation.task_variant_interpretation.verbose</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_interpretation.lab_report">
        <b>wf_interpretation.lab_report</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_interpretation.lims_report">
        <b>wf_interpretation.lims_report</b><br />
        <i>File</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)