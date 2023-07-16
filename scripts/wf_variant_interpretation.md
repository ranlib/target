# wf_variant_interpretation


## Inputs

### Required inputs
<p name="wf_variant_interpretation.bai">
        <b>wf_variant_interpretation.bai</b><br />
        <i>File &mdash; Default: None</i><br />
        bam index file output from CDC/London TB profiler pipeline.
</p>
<p name="wf_variant_interpretation.bam">
        <b>wf_variant_interpretation.bam</b><br />
        <i>File &mdash; Default: None</i><br />
        bam file output from CDC/London TB profiler pipeline.
</p>
<p name="wf_variant_interpretation.bed">
        <b>wf_variant_interpretation.bed</b><br />
        <i>File &mdash; Default: None</i><br />
        bed file with genomic intervals of interest. Note: reference name in case of London TB profiler is 'Chromosome', make sure to use correct bed file
</p>
<p name="wf_variant_interpretation.json">
        <b>wf_variant_interpretation.json</b><br />
        <i>File &mdash; Default: None</i><br />
        json file with drug information for variants.
</p>
<p name="wf_variant_interpretation.report">
        <b>wf_variant_interpretation.report</b><br />
        <i>String? &mdash; Default: None</i><br />
        name for output tsv file.
</p>
<p name="wf_variant_interpretation.sample_name">
        <b>wf_variant_interpretation.sample_name</b><br />
        <i>String &mdash; Default: None</i><br />
        sample name.
</p>
<p name="wf_variant_interpretation.vcf">
        <b>wf_variant_interpretation.vcf</b><br />
        <i>File &mdash; Default: None</i><br />
        vcf file or compressed vcf file (suffix vcf.gz) output from CDC/London TB profiler pipeline.
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_variant_interpretation.task_variant_interpretation.all_genes">
        <b>wf_variant_interpretation.task_variant_interpretation.all_genes</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_variant_interpretation.task_variant_interpretation.docker">
        <b>wf_variant_interpretation.task_variant_interpretation.docker</b><br />
        <i>String &mdash; Default: "dbest/variant_interpretation:v1.0.1"</i><br />
        ???
</p>
<p name="wf_variant_interpretation.task_variant_interpretation.minimum_coverage">
        <b>wf_variant_interpretation.task_variant_interpretation.minimum_coverage</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_variant_interpretation.task_variant_interpretation.minimum_total_depth">
        <b>wf_variant_interpretation.task_variant_interpretation.minimum_total_depth</b><br />
        <i>Int &mdash; Default: 0</i><br />
        ???
</p>
<p name="wf_variant_interpretation.task_variant_interpretation.minimum_variant_depth">
        <b>wf_variant_interpretation.task_variant_interpretation.minimum_variant_depth</b><br />
        <i>Int &mdash; Default: 0</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_variant_interpretation.interpretation_report">
        <b>wf_variant_interpretation.interpretation_report</b><br />
        <i>File</i><br />
        output tsv file.
</p>

<hr />

> Generated using WDL AID (1.0.0)
