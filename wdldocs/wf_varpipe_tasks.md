<p> <b>task_concatenate_fastq.wdl</b> ## Concatenate fastq files</p>
<p> <b>task_fastqc.wdl</b> ## QC for fastq files</p>
<p> <b>task_fastq_screen.wdl</b> ## QC screen for fastq files</p>
<p> <b>task_trimmomatic.wdl</b> ## Read base quality trimming</p>
<p> <b>task_bbduk.wdl</b> ## Decontamination with bbduk</p>
<p> <b>wf_clockwork_decontamination.wdl</b> ## Clockwork decontamination workflow \n Routine from the clockwork TB profiler: https://github.com/iqbal-lab-org/clockwork.</p>
<p> <b>task_varpipe.wdl</b> ## Variant detection pipeline. Based on CDC TB profiler: https://github.com/CDCgov/NCHHSTP-DTBE-Varpipe-WGS. Also runs fastq QC, decontamination, and alignment QC.</p>
<p> <b>wf_structural_variants.wdl</b> ## Structural variants caller workflow</p>
<p> <b>task_multiqc.wdl</b> ## Multi QC workflow \n\n Produce QC reports for a number of tasks</p>
<p> <b>wf_lineage.wdl</b> ## Lineage caller \n Determinate tuberculosis lineage based on SNPs.</p>
<p> <b>wf_interpretation.wdl</b> ## Variant interpretation \n Assign severities to mutations relevant for tuberculosis.</p>
<p> <b>task_collect_multiple_metrics.wdl</b> ## Collect multiple QC metrics from bam alignment file</p>
<p> <b>task_collect_wgs_metrics.wdl</b> ## Collect whole genome sequencing QC metrics</p>
<p> <b>wf_collect_targeted_pcr_metrics.wdl</b> ## Collect targeted PCR QC metrics</p>
<p> <b>task_depth_of_coverage.wdl</b> ## Calculate Depth of Coverage using GATK's DepthOfCoverage tool.</p>
<p> <b>task_concat_2_vcfs.wdl</b> ## Concatentate 2 vcf files</p>
<p> <b>task_repair.wdl</b> ## Repair reads in paired end fastq files</p>
<p> <b>task_ptrimmer.wdl</b> ## Primer trimming \n Detect and trim known primer sequences from sequencing reads.</p>
<p> <b>wf_centrifuge.wdl</b> ## Taxonomic classification of reads using centrifuge</p>