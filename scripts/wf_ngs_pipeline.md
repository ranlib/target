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
<p name="wf_ngs_pipeline.Mapping.howToFindGTAG">
        <b>wf_ngs_pipeline.Mapping.howToFindGTAG</b><br />
        <i>String? &mdash; Default: None</i><br />
        How to find GT-AG. f:transcript strand, b:both strands, n:don't match GT-AG.
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_ngs_pipeline.Indexing.dockerImage">
        <b>wf_ngs_pipeline.Indexing.dockerImage</b><br />
        <i>String &mdash; Default: "staphb/minimap2:2.25"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
<p name="wf_ngs_pipeline.Indexing.kmerSize">
        <b>wf_ngs_pipeline.Indexing.kmerSize</b><br />
        <i>Int &mdash; Default: 15</i><br />
        K-mer size (no larger than 28).
</p>
<p name="wf_ngs_pipeline.Indexing.memory">
        <b>wf_ngs_pipeline.Indexing.memory</b><br />
        <i>String &mdash; Default: "4G"</i><br />
        The amount of memory available to the job.
</p>
<p name="wf_ngs_pipeline.Indexing.minimizerWindowSize">
        <b>wf_ngs_pipeline.Indexing.minimizerWindowSize</b><br />
        <i>Int &mdash; Default: 10</i><br />
        Minimizer window size.
</p>
<p name="wf_ngs_pipeline.Indexing.splitIndex">
        <b>wf_ngs_pipeline.Indexing.splitIndex</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Split index for every ~NUM input bases.
</p>
<p name="wf_ngs_pipeline.Indexing.timeMinutes">
        <b>wf_ngs_pipeline.Indexing.timeMinutes</b><br />
        <i>Int &mdash; Default: 10</i><br />
        The maximum amount of time the job will run in minutes.
</p>
<p name="wf_ngs_pipeline.Indexing.useHomopolymerCompressedKmer">
        <b>wf_ngs_pipeline.Indexing.useHomopolymerCompressedKmer</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        Use homopolymer-compressed k-mer (preferrable for pacbio).
</p>
<p name="wf_ngs_pipeline.Mapping.dockerImage">
        <b>wf_ngs_pipeline.Mapping.dockerImage</b><br />
        <i>String &mdash; Default: "staphb/minimap2:2.25"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
<p name="wf_ngs_pipeline.Mapping.kmerSize">
        <b>wf_ngs_pipeline.Mapping.kmerSize</b><br />
        <i>Int &mdash; Default: 15</i><br />
        K-mer size (no larger than 28).
</p>
<p name="wf_ngs_pipeline.Mapping.matchingScore">
        <b>wf_ngs_pipeline.Mapping.matchingScore</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Matching score.
</p>
<p name="wf_ngs_pipeline.Mapping.maxFragmentLength">
        <b>wf_ngs_pipeline.Mapping.maxFragmentLength</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Max fragment length (effective with -xsr or in the fragment mode).
</p>
<p name="wf_ngs_pipeline.Mapping.maxIntronLength">
        <b>wf_ngs_pipeline.Mapping.maxIntronLength</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Max intron length (effective with -xsplice; changing -r).
</p>
<p name="wf_ngs_pipeline.Mapping.memory">
        <b>wf_ngs_pipeline.Mapping.memory</b><br />
        <i>String &mdash; Default: "30G"</i><br />
        The amount of memory available to the job.
</p>
<p name="wf_ngs_pipeline.Mapping.mismatchPenalty">
        <b>wf_ngs_pipeline.Mapping.mismatchPenalty</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Mismatch penalty.
</p>
<p name="wf_ngs_pipeline.Mapping.retainMaxSecondaryAlignments">
        <b>wf_ngs_pipeline.Mapping.retainMaxSecondaryAlignments</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Retain at most N secondary alignments.
</p>
<p name="wf_ngs_pipeline.Mapping.secondaryAlignment">
        <b>wf_ngs_pipeline.Mapping.secondaryAlignment</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        Whether to output secondary alignments.
</p>
<p name="wf_ngs_pipeline.Mapping.skipSelfAndDualMappings">
        <b>wf_ngs_pipeline.Mapping.skipSelfAndDualMappings</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        Skip self and dual mappings (for the all-vs-all mode).
</p>
<p name="wf_ngs_pipeline.Mapping.timeMinutes">
        <b>wf_ngs_pipeline.Mapping.timeMinutes</b><br />
        <i>Int &mdash; Default: 1 + ceil((size(queryFile1,"G") * 200 / cores))</i><br />
        The maximum amount of time the job will run in minutes.
</p>
</details>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_ngs_pipeline.Mapping.softClippingForSupplementaryAlignments">
        <b>wf_ngs_pipeline.Mapping.softClippingForSupplementaryAlignments</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.Mapping.writeLongCigar">
        <b>wf_ngs_pipeline.Mapping.writeLongCigar</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.dockerImage">
        <b>wf_ngs_pipeline.SnpEff.dockerImage</b><br />
        <i>String &mdash; Default: "quay.io/biocontainers/snpeff:5.1d--hdfd78af_0"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.hgvs">
        <b>wf_ngs_pipeline.SnpEff.hgvs</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.javaXmx">
        <b>wf_ngs_pipeline.SnpEff.javaXmx</b><br />
        <i>String &mdash; Default: "8G"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.lof">
        <b>wf_ngs_pipeline.SnpEff.lof</b><br />
        <i>Boolean &mdash; Default: true</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.memory">
        <b>wf_ngs_pipeline.SnpEff.memory</b><br />
        <i>String &mdash; Default: "9G"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.noDownstream">
        <b>wf_ngs_pipeline.SnpEff.noDownstream</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.noIntergenic">
        <b>wf_ngs_pipeline.SnpEff.noIntergenic</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.noShiftHgvs">
        <b>wf_ngs_pipeline.SnpEff.noShiftHgvs</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.outputPath">
        <b>wf_ngs_pipeline.SnpEff.outputPath</b><br />
        <i>String &mdash; Default: "./snpeff.vcf"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.timeMinutes">
        <b>wf_ngs_pipeline.SnpEff.timeMinutes</b><br />
        <i>Int &mdash; Default: 60</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.SnpEff.upDownStreamLen">
        <b>wf_ngs_pipeline.SnpEff.upDownStreamLen</b><br />
        <i>Int? &mdash; Default: None</i><br />
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
<p name="wf_ngs_pipeline.task_fastqc.adapters">
        <b>wf_ngs_pipeline.task_fastqc.adapters</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_fastqc.contaminants">
        <b>wf_ngs_pipeline.task_fastqc.contaminants</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_fastqc.docker">
        <b>wf_ngs_pipeline.task_fastqc.docker</b><br />
        <i>String &mdash; Default: "staphb/fastqc:0.12.1"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_fastqc.memory">
        <b>wf_ngs_pipeline.task_fastqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.task_fastqc.threads">
        <b>wf_ngs_pipeline.task_fastqc.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
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
<p name="wf_ngs_pipeline.wf_gatk.timeMinutes">
        <b>wf_ngs_pipeline.wf_gatk.timeMinutes</b><br />
        <i>Int &mdash; Default: 240</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_ngs_pipeline.bai">
        <b>wf_ngs_pipeline.bai</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.bam">
        <b>wf_ngs_pipeline.bam</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcf">
        <b>wf_ngs_pipeline.vcf</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfAligned">
        <b>wf_ngs_pipeline.vcfAligned</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfAlignedIndex">
        <b>wf_ngs_pipeline.vcfAlignedIndex</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfAnnotated">
        <b>wf_ngs_pipeline.vcfAnnotated</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfFiltered">
        <b>wf_ngs_pipeline.vcfFiltered</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfFilteredIndex">
        <b>wf_ngs_pipeline.vcfFilteredIndex</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfFilteredStats">
        <b>wf_ngs_pipeline.vcfFilteredStats</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfIndex">
        <b>wf_ngs_pipeline.vcfIndex</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_ngs_pipeline.vcfStats">
        <b>wf_ngs_pipeline.vcfStats</b><br />
        <i>File</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
