<p> <b>task_concatenate_fastq.wdl</b> <i> Concatenate fastq files</i></p>
<p> <b>task_fastqc.wdl</b> <i> QC for fastq files</i></p>
<p> <b>task_fastq_screen.wdl</b> <i> QC screen for fastq files</i></p>
<p> <b>task_trimmomatic.wdl</b> <i> Read base quality trimming</i></p>
<p> <b>task_bbduk.wdl</b> <i> Decontamination with bbduk</i></p>
<p> <b>wf_clockwork_decontamination.wdl</b> <i> Clockwork decontamination workflow \n Routine from the clockwork TB profiler: https://github.com/iqbal-lab-org/clockwork.</i></p>
<p> <b>task_varpipe.wdl</b> <i> Variant detection pipeline. Based on CDC TB profiler: https://github.com/CDCgov/NCHHSTP-DTBE-Varpipe-WGS. Also runs fastq QC, decontamination, and alignment QC.</i></p>
<p> <b>wf_structural_variants.wdl</b> <i> Structural variants caller workflow</i></p>
<p> <b>task_multiqc.wdl</b> <i> Multi QC workflow \n\n Produce QC reports for a number of tasks</i></p>
<p> <b>wf_lineage.wdl</b> <i> Lineage caller \n Determinate tuberculosis lineage based on SNPs.</i></p>
<p> <b>wf_interpretation.wdl</b> <i> Variant interpretation \n Assign severities to mutations relevant for tuberculosis.</i></p>
<p> <b>task_collect_multiple_metrics.wdl</b> <i> Collect multiple QC metrics from bam alignment file</i></p>
<p> <b>task_collect_wgs_metrics.wdl</b> <i> Collect whole genome sequencing QC metrics</i></p>
<p> <b>wf_collect_targeted_pcr_metrics.wdl</b> <i> Collect targeted PCR QC metrics</i></p>
<p> <b>task_depth_of_coverage.wdl</b> <i> Calculate Depth of Coverage using GATK's DepthOfCoverage tool.</i></p>
<p> <b>task_concat_2_vcfs.wdl</b> <i> Concatentate 2 vcf files</i></p>
<p> <b>task_repair.wdl</b> <i> Repair reads in paired end fastq files</i></p>
<p> <b>task_ptrimmer.wdl</b> <i> Primer trimming \n Detect and trim known primer sequences from sequencing reads.</i></p>
<p> <b>wf_centrifuge.wdl</b> <i> Taxonomic classification of reads using centrifuge</i></p>