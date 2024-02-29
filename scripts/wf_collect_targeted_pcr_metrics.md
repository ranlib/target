# wf_collect_targeted_pcr_metrics
## Collect targeted PCR QC metrics

## Inputs

### Required inputs
<p name="wf_collect_targeted_pcr_metrics.amplicon_bed">
        <b>wf_collect_targeted_pcr_metrics.amplicon_bed</b><br />
        <i>File &mdash; Default: None</i><br />
        Input bed file with amplicon regions
</p>
<p name="wf_collect_targeted_pcr_metrics.bam">
        <b>wf_collect_targeted_pcr_metrics.bam</b><br />
        <i>File &mdash; Default: None</i><br />
        Input bam alignemnt file.
</p>
<p name="wf_collect_targeted_pcr_metrics.reference">
        <b>wf_collect_targeted_pcr_metrics.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        Reference genome
</p>
<p name="wf_collect_targeted_pcr_metrics.target_bed">
        <b>wf_collect_targeted_pcr_metrics.target_bed</b><br />
        <i>File &mdash; Default: None</i><br />
        Input bed file with regions to check
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.clip_overlapping_reads">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.clip_overlapping_reads</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.coverage_cap">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.coverage_cap</b><br />
        <i>Int &mdash; Default: 250</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.docker">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.5.0.0"</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.memory">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minBaseQuality">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minBaseQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minMappingQuality">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minMappingQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.outputMetrics">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.outputMetrics</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_metrics.txt"</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sample_size">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sample_size</b><br />
        <i>Int &mdash; Default: 10000</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sensitivityFile">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sensitivityFile</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_sensitivity_metrics.txt"</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.target_coverage_file">
        <b>wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.target_coverage_file</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_target_coverage.txt"</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_add_pg_tag_to_read">
        <b>wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_add_pg_tag_to_read</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_duplicates">
        <b>wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_duplicates</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_sequencing_duplicates">
        <b>wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_sequencing_duplicates</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_mark_duplicates.docker">
        <b>wf_collect_targeted_pcr_metrics.task_mark_duplicates.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.5.0.0"</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_mark_duplicates.marked_bam">
        <b>wf_collect_targeted_pcr_metrics.task_mark_duplicates.marked_bam</b><br />
        <i>String? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_mark_duplicates.memory">
        <b>wf_collect_targeted_pcr_metrics.task_mark_duplicates.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_collect_targeted_pcr_metrics.task_mark_duplicates.metrics_txt">
        <b>wf_collect_targeted_pcr_metrics.task_mark_duplicates.metrics_txt</b><br />
        <i>String &mdash; Default: "mark_duplicates_metrics.txt"</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_collect_targeted_pcr_metrics.output_marked_bam">
        <b>wf_collect_targeted_pcr_metrics.output_marked_bam</b><br />
        <i>File</i><br />
        Output bam file with duplicate reads marked.
</p>
<p name="wf_collect_targeted_pcr_metrics.output_marked_metrics_txt">
        <b>wf_collect_targeted_pcr_metrics.output_marked_metrics_txt</b><br />
        <i>File</i><br />
        Output text file with metrics from bam file with duplicates marked.
</p>
<p name="wf_collect_targeted_pcr_metrics.output_metrics">
        <b>wf_collect_targeted_pcr_metrics.output_metrics</b><br />
        <i>File?</i><br />
        Output text file with QC metrics.
</p>
<p name="wf_collect_targeted_pcr_metrics.sensitivity_metrics">
        <b>wf_collect_targeted_pcr_metrics.sensitivity_metrics</b><br />
        <i>File?</i><br />
        Output text file with sensitivity metrics.
</p>
<p name="wf_collect_targeted_pcr_metrics.target_coverage">
        <b>wf_collect_targeted_pcr_metrics.target_coverage</b><br />
        <i>File?</i><br />
        Output text file target coverage.
</p>

<hr />

> Generated using WDL AID (1.0.0)
