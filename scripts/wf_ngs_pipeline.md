# wf_ngs_pipeline


## Inputs

### Required inputs
<p name="wf_ngs_pipeline.config">
        <b>wf_ngs_pipeline.config</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.dataDir">
        <b>wf_ngs_pipeline.dataDir</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.fastq_screen_configuration">
        <b>wf_ngs_pipeline.fastq_screen_configuration</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.fastq_screen_contaminants">
        <b>wf_ngs_pipeline.fastq_screen_contaminants</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.genbankFile">
        <b>wf_ngs_pipeline.genbankFile</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.genome">
        <b>wf_ngs_pipeline.genome</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.intervals">
        <b>wf_ngs_pipeline.intervals</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.min_allele_fraction">
        <b>wf_ngs_pipeline.min_allele_fraction</b><br />
        <i>Float &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.min_median_read_position">
        <b>wf_ngs_pipeline.min_median_read_position</b><br />
        <i>Int &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.min_reads_per_strand">
        <b>wf_ngs_pipeline.min_reads_per_strand</b><br />
        <i>Int &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.read1">
        <b>wf_ngs_pipeline.read1</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.read2">
        <b>wf_ngs_pipeline.read2</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.samplename">
        <b>wf_ngs_pipeline.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>

### Other common inputs
<p name="wf_ngs_pipeline.task_delly.svType">
        <b>wf_ngs_pipeline.task_delly.svType</b><br />
        <i>String &mdash; Default: "DEL"</i><br />
        Type of structural variant to look for.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.howToFindGTAG">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.howToFindGTAG</b><br />
        <i>String? &mdash; Default: None</i><br />
        How to find GT-AG. f:transcript strand, b:both strands, n:don't match GT-AG.
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_ngs_pipeline.task_delly.docker">
        <b>wf_ngs_pipeline.task_delly.docker</b><br />
        <i>String &mdash; Default: "dbest/delly:v1.0.0"</i><br />
        The docker image used for this task.
</p>
<p name="wf_ngs_pipeline.task_delly.memory">
        <b>wf_ngs_pipeline.task_delly.memory</b><br />
        <i>String &mdash; Default: "32GB"</i><br />
        The memory required to run the programs.
</p>
<p name="wf_ngs_pipeline.task_fastqc.docker">
        <b>wf_ngs_pipeline.task_fastqc.docker</b><br />
        <i>String &mdash; Default: "staphb/fastqc:0.12.1"</i><br />
        The docker image used for this task.
</p>
<p name="wf_ngs_pipeline.task_fastqc.memory">
        <b>wf_ngs_pipeline.task_fastqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        The amount of memory this job will use.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Indexing.dockerImage">
        <b>wf_ngs_pipeline.wf_minimap2.Indexing.dockerImage</b><br />
        <i>String &mdash; Default: "staphb/minimap2:2.25"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Indexing.kmerSize">
        <b>wf_ngs_pipeline.wf_minimap2.Indexing.kmerSize</b><br />
        <i>Int &mdash; Default: 15</i><br />
        K-mer size (no larger than 28).
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Indexing.memory">
        <b>wf_ngs_pipeline.wf_minimap2.Indexing.memory</b><br />
        <i>String &mdash; Default: "4G"</i><br />
        The amount of memory available to the job.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Indexing.minimizerWindowSize">
        <b>wf_ngs_pipeline.wf_minimap2.Indexing.minimizerWindowSize</b><br />
        <i>Int &mdash; Default: 10</i><br />
        Minimizer window size.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Indexing.splitIndex">
        <b>wf_ngs_pipeline.wf_minimap2.Indexing.splitIndex</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Split index for every ~NUM input bases.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Indexing.timeMinutes">
        <b>wf_ngs_pipeline.wf_minimap2.Indexing.timeMinutes</b><br />
        <i>Int &mdash; Default: 10</i><br />
        The maximum amount of time the job will run in minutes.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Indexing.useHomopolymerCompressedKmer">
        <b>wf_ngs_pipeline.wf_minimap2.Indexing.useHomopolymerCompressedKmer</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        Use homopolymer-compressed k-mer (preferrable for pacbio).
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.dockerImage">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.dockerImage</b><br />
        <i>String &mdash; Default: "staphb/minimap2:2.25"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.kmerSize">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.kmerSize</b><br />
        <i>Int &mdash; Default: 15</i><br />
        K-mer size (no larger than 28).
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.matchingScore">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.matchingScore</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Matching score.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.maxFragmentLength">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.maxFragmentLength</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Max fragment length (effective with -xsr or in the fragment mode).
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.maxIntronLength">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.maxIntronLength</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Max intron length (effective with -xsplice; changing -r).
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.memory">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.memory</b><br />
        <i>String &mdash; Default: "30G"</i><br />
        The amount of memory available to the job.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.mismatchPenalty">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.mismatchPenalty</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Mismatch penalty.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.retainMaxSecondaryAlignments">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.retainMaxSecondaryAlignments</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Retain at most N secondary alignments.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.secondaryAlignment">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.secondaryAlignment</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        Whether to output secondary alignments.
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.skipSelfAndDualMappings">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.skipSelfAndDualMappings</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        Skip self and dual mappings (for the all-vs-all mode).
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.timeMinutes">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.timeMinutes</b><br />
        <i>Int &mdash; Default: 1 + ceil((size(queryFile1,"G") * 200 / cores))</i><br />
        The maximum amount of time the job will run in minutes.
</p>
</details>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_ngs_pipeline.output_vcf_name">
        <b>wf_ngs_pipeline.output_vcf_name</b><br />
        <i>String &mdash; Default: "all_variants.vcf"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_bbduk.contamination">
        <b>wf_ngs_pipeline.task_bbduk.contamination</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_bbduk.docker">
        <b>wf_ngs_pipeline.task_bbduk.docker</b><br />
        <i>String &mdash; Default: "staphb/bbtools:39.01"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_bbduk.keep">
        <b>wf_ngs_pipeline.task_bbduk.keep</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_bbduk.memory">
        <b>wf_ngs_pipeline.task_bbduk.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_bbduk.threads">
        <b>wf_ngs_pipeline.task_bbduk.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_multiple_metrics.docker">
        <b>wf_ngs_pipeline.task_collect_multiple_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_multiple_metrics.memory">
        <b>wf_ngs_pipeline.task_collect_multiple_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_multiple_metrics.outputBasename">
        <b>wf_ngs_pipeline.task_collect_multiple_metrics.outputBasename</b><br />
        <i>String &mdash; Default: "multiple_metrics"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.bed">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.bed</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.coverage_cap">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.coverage_cap</b><br />
        <i>Int &mdash; Default: 250</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.docker">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.memory">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.minBaseQuality">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.minBaseQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.minMappingQuality">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.minMappingQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.outputFile">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.outputFile</b><br />
        <i>String &mdash; Default: "collect_wgs_metrics.txt"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.read_length">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.read_length</b><br />
        <i>Int &mdash; Default: 150</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.sample_size">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.sample_size</b><br />
        <i>Int &mdash; Default: 10000</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.sensitivityFile">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.sensitivityFile</b><br />
        <i>String &mdash; Default: "collect_wgs_sensitivity_metrics.txt"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_collect_wgs_metrics.use_fast_algorithm">
        <b>wf_ngs_pipeline.task_collect_wgs_metrics.use_fast_algorithm</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_concat_2_vcfs.docker">
        <b>wf_ngs_pipeline.task_concat_2_vcfs.docker</b><br />
        <i>String &mdash; Default: "staphb/bcftools:1.17"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_create_sequence_dictionary.docker">
        <b>wf_ngs_pipeline.task_create_sequence_dictionary.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_create_sequence_dictionary.memory">
        <b>wf_ngs_pipeline.task_create_sequence_dictionary.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_depth_of_coverage.docker">
        <b>wf_ngs_pipeline.task_depth_of_coverage.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_depth_of_coverage.lower_coverage">
        <b>wf_ngs_pipeline.task_depth_of_coverage.lower_coverage</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_depth_of_coverage.memory">
        <b>wf_ngs_pipeline.task_depth_of_coverage.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_depth_of_coverage.min_base_quality">
        <b>wf_ngs_pipeline.task_depth_of_coverage.min_base_quality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_depth_of_coverage.outputPrefix">
        <b>wf_ngs_pipeline.task_depth_of_coverage.outputPrefix</b><br />
        <i>String &mdash; Default: "depth_of_coverage"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_fastq_screen.aligner">
        <b>wf_ngs_pipeline.task_fastq_screen.aligner</b><br />
        <i>String &mdash; Default: "bwa"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_fastq_screen.docker">
        <b>wf_ngs_pipeline.task_fastq_screen.docker</b><br />
        <i>String &mdash; Default: "dbest/fastq_screen:v0.15.3"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_fastq_screen.memory">
        <b>wf_ngs_pipeline.task_fastq_screen.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_fastq_screen.subset">
        <b>wf_ngs_pipeline.task_fastq_screen.subset</b><br />
        <i>Int &mdash; Default: 100000</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_fastq_screen.threads">
        <b>wf_ngs_pipeline.task_fastq_screen.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_multiqc.docker">
        <b>wf_ngs_pipeline.task_multiqc.docker</b><br />
        <i>String &mdash; Default: "ewels/multiqc:v1.14"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_multiqc.memory">
        <b>wf_ngs_pipeline.task_multiqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.docker">
        <b>wf_ngs_pipeline.task_snpEff.docker</b><br />
        <i>String &mdash; Default: "quay.io/biocontainers/snpeff:5.1d--hdfd78af_0"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.hgvs">
        <b>wf_ngs_pipeline.task_snpEff.hgvs</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.javaXmx">
        <b>wf_ngs_pipeline.task_snpEff.javaXmx</b><br />
        <i>String &mdash; Default: "8G"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.lof">
        <b>wf_ngs_pipeline.task_snpEff.lof</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.memory">
        <b>wf_ngs_pipeline.task_snpEff.memory</b><br />
        <i>String &mdash; Default: "9G"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.noDownstream">
        <b>wf_ngs_pipeline.task_snpEff.noDownstream</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.noIntergenic">
        <b>wf_ngs_pipeline.task_snpEff.noIntergenic</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.noShiftHgvs">
        <b>wf_ngs_pipeline.task_snpEff.noShiftHgvs</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.outputPath">
        <b>wf_ngs_pipeline.task_snpEff.outputPath</b><br />
        <i>String &mdash; Default: "./snpeff.vcf"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_snpEff.upDownStreamLen">
        <b>wf_ngs_pipeline.task_snpEff.upDownStreamLen</b><br />
        <i>Int? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_trimmomatic.docker">
        <b>wf_ngs_pipeline.task_trimmomatic.docker</b><br />
        <i>String &mdash; Default: "staphb/trimmomatic:0.39"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_trimmomatic.memory">
        <b>wf_ngs_pipeline.task_trimmomatic.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_trimmomatic.threads">
        <b>wf_ngs_pipeline.task_trimmomatic.threads</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_trimmomatic.trimmomatic_minlen">
        <b>wf_ngs_pipeline.task_trimmomatic.trimmomatic_minlen</b><br />
        <i>Int &mdash; Default: 40</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_trimmomatic.trimmomatic_quality_trim_score">
        <b>wf_ngs_pipeline.task_trimmomatic.trimmomatic_quality_trim_score</b><br />
        <i>Int &mdash; Default: 15</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_trimmomatic.trimmomatic_window_size">
        <b>wf_ngs_pipeline.task_trimmomatic.trimmomatic_window_size</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.threads">
        <b>wf_ngs_pipeline.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.clip_overlapping_reads">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.clip_overlapping_reads</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.coverage_cap">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.coverage_cap</b><br />
        <i>Int &mdash; Default: 250</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.docker">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.memory">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minBaseQuality">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minBaseQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minMappingQuality">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.minMappingQuality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.outputMetrics">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.outputMetrics</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_metrics.txt"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sample_size">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sample_size</b><br />
        <i>Int &mdash; Default: 10000</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sensitivityFile">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.sensitivityFile</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_sensitivity_metrics.txt"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.target_coverage_file">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_collect_targeted_pcr_metrics.target_coverage_file</b><br />
        <i>String &mdash; Default: "collect_targeted_pcr_target_coverage.txt"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_add_pg_tag_to_read">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_add_pg_tag_to_read</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_duplicates">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_duplicates</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_sequencing_duplicates">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.do_remove_sequencing_duplicates</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.docker">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.docker</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.marked_bam">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.marked_bam</b><br />
        <i>String? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.memory">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.metrics_txt">
        <b>wf_ngs_pipeline.wf_collect_targeted_pcr_metrics.task_mark_duplicates.metrics_txt</b><br />
        <i>String &mdash; Default: "mark_duplicates_metrics.txt"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_gatk.dockerImage">
        <b>wf_ngs_pipeline.wf_gatk.dockerImage</b><br />
        <i>String &mdash; Default: "broadinstitute/gatk:4.4.0.0"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_gatk.javaXmx">
        <b>wf_ngs_pipeline.wf_gatk.javaXmx</b><br />
        <i>String &mdash; Default: "8G"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_gatk.memory">
        <b>wf_ngs_pipeline.wf_gatk.memory</b><br />
        <i>String &mdash; Default: "9G"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.softClippingForSupplementaryAlignments">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.softClippingForSupplementaryAlignments</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.wf_minimap2.Mapping.writeLongCigar">
        <b>wf_ngs_pipeline.wf_minimap2.Mapping.writeLongCigar</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_ngs_pipeline.adapter_stats">
        <b>wf_ngs_pipeline.adapter_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.bai">
        <b>wf_ngs_pipeline.bai</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.bam">
        <b>wf_ngs_pipeline.bam</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.collect_targeted_pcr_metrics">
        <b>wf_ngs_pipeline.collect_targeted_pcr_metrics</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.collect_wgs_output_metrics">
        <b>wf_ngs_pipeline.collect_wgs_output_metrics</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.dellyVcf">
        <b>wf_ngs_pipeline.dellyVcf</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.depth_of_coverage_outputs">
        <b>wf_ngs_pipeline.depth_of_coverage_outputs</b><br />
        <i>Array[File]?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.fastq_screen_html">
        <b>wf_ngs_pipeline.fastq_screen_html</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.fastq_screen_tagged">
        <b>wf_ngs_pipeline.fastq_screen_tagged</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.fastq_screen_tagged_filter">
        <b>wf_ngs_pipeline.fastq_screen_tagged_filter</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.fastq_screen_txt">
        <b>wf_ngs_pipeline.fastq_screen_txt</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.forwardData">
        <b>wf_ngs_pipeline.forwardData</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.forwardHtml">
        <b>wf_ngs_pipeline.forwardHtml</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.forwardSummary">
        <b>wf_ngs_pipeline.forwardSummary</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.forwardZip">
        <b>wf_ngs_pipeline.forwardZip</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.multiple_metrics_outputs">
        <b>wf_ngs_pipeline.multiple_metrics_outputs</b><br />
        <i>Array[File]?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.multiqc_report">
        <b>wf_ngs_pipeline.multiqc_report</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.phiX_stats">
        <b>wf_ngs_pipeline.phiX_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.reverseData">
        <b>wf_ngs_pipeline.reverseData</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.reverseHtml">
        <b>wf_ngs_pipeline.reverseHtml</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.reverseSummary">
        <b>wf_ngs_pipeline.reverseSummary</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.reverseZip">
        <b>wf_ngs_pipeline.reverseZip</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.trim_err">
        <b>wf_ngs_pipeline.trim_err</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.trim_stats">
        <b>wf_ngs_pipeline.trim_stats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcf">
        <b>wf_ngs_pipeline.vcf</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcf_concatenated">
        <b>wf_ngs_pipeline.vcf_concatenated</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfAligned">
        <b>wf_ngs_pipeline.vcfAligned</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfAlignedIndex">
        <b>wf_ngs_pipeline.vcfAlignedIndex</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfAnnotated">
        <b>wf_ngs_pipeline.vcfAnnotated</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfFiltered">
        <b>wf_ngs_pipeline.vcfFiltered</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfFilteredIndex">
        <b>wf_ngs_pipeline.vcfFilteredIndex</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfFilteredStats">
        <b>wf_ngs_pipeline.vcfFilteredStats</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfIndex">
        <b>wf_ngs_pipeline.vcfIndex</b><br />
        <i>File?</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfStats">
        <b>wf_ngs_pipeline.vcfStats</b><br />
        <i>File?</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
