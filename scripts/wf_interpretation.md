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
<p name="wf_interpretation.lineage_information">
        <b>wf_interpretation.lineage_information</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_interpretation.samplename">
        <b>wf_interpretation.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        sample name.
</p>
<p name="wf_interpretation.vcf">
        <b>wf_interpretation.vcf</b><br />
        <i>File &mdash; Default: None</i><br />
        vcf file or compressed vcf file (suffix vcf.gz) output from CDC/London TB profiler pipeline.
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_interpretation.interpretation_docker">
        <b>wf_interpretation.interpretation_docker</b><br />
        <i>String &mdash; Default: "dbest/variant_interpretation:v1.2.1"</i><br />
        ???
</p>
<p name="wf_interpretation.interpretation_memory">
        <b>wf_interpretation.interpretation_memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_interpretation.lims_docker">
        <b>wf_interpretation.lims_docker</b><br />
        <i>String &mdash; Default: "dbest/lims_report:v1.0.3"</i><br />
        ???
</p>
<p name="wf_interpretation.lims_operator">
        <b>wf_interpretation.lims_operator</b><br />
        <i>String &mdash; Default: "DB"</i><br />
        ???
</p>
<p name="wf_interpretation.lims_report_name">
        <b>wf_interpretation.lims_report_name</b><br />
        <i>String &mdash; Default: "lims_report.tsv"</i><br />
        ???
</p>
<p name="wf_interpretation.minimum_allele_percentage">
        <b>wf_interpretation.minimum_allele_percentage</b><br />
        <i>Float &mdash; Default: 10.0</i><br />
        ???
</p>
<p name="wf_interpretation.task_variant_interpretation.minimum_allele_percentage">
        <b>wf_interpretation.task_variant_interpretation.minimum_allele_percentage</b><br />
        <i>Float &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_interpretation.verbose">
        <b>wf_interpretation.verbose</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_interpretation.lab_log">
        <b>wf_interpretation.lab_log</b><br />
        <i>File</i><br />
        Output tsv file that captures output to stdout of variant interpretation.
</p>
<p name="wf_interpretation.lab_report">
        <b>wf_interpretation.lab_report</b><br />
        <i>File</i><br />
        Output tsv file of variant interpretation.
</p>
<p name="wf_interpretation.lims_report">
        <b>wf_interpretation.lims_report</b><br />
        <i>File</i><br />
        Output tsv file for LIMS.
</p>

<hr />

> Generated using WDL AID (1.0.0)
