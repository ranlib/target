#
# varpipe_cdc.json <- varpipe.json + change config + change bed file
# varpipe_tNGS.json <- varpipe.json + change config + use tNGS dataset
#
all: tbprofiler varpipe fastqc bbduk bbduk_no_contamination clockwork_decontamination trimmomatic multiqc concatenate_fastq collect_multiple_metrics collect_targeted_pcr_metrics collect_hs_metrics depth_of_coverage delly mark_duplicates variant_interpretation

kraken2:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_kraken2.json wf_kraken2.wdl
	miniwdl check wf_kraken2.wdl

run_kraken2:
	miniwdl run --dir test-kraken2 --debug --cfg ../miniwdl_production.cfg -i wf_kraken2.json wf_kraken2.wdl

run_kraken2_large:
	miniwdl run --dir test-kraken2_large --debug --cfg ../miniwdl_production.cfg -i wf_kraken2_large_WA_tar.json wf_kraken2.wdl

centrifuge:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_centrifuge.json wf_centrifuge.wdl
	miniwdl check wf_centrifuge.wdl

run_centrifuge:
	miniwdl run --dir test-centrifuge --debug --cfg ../miniwdl_production.cfg -i wf_centrifuge.json wf_centrifuge.wdl

run_centrifuge_dbest:
	miniwdl run --dir test-centrifuge --debug --cfg ../miniwdl_production.cfg -i wf_centrifuge_dbest.json wf_centrifuge.wdl

ptrimmer:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_ptrimmer.json wf_ptrimmer.wdl
	miniwdl check wf_ptrimmer.wdl

run_ptrimmer:
	miniwdl run --debug --dir test-ptrimmer --cfg ../miniwdl_production.cfg wf_ptrimmer.wdl -i wf_ptrimmer.json

ptrimmer_docu:
	wdl-aid wf_ptrimmer.wdl -o wf_ptrimmer.md
	#grip -b wf_ptrimmer.md

minimap2:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_minimap2.json wf_minimap2.wdl
	miniwdl check wf_minimap2.wdl

run_minimap2:
	miniwdl run --debug --dir test-minimap2 --cfg ../miniwdl_production.cfg --input wf_minimap2.json wf_minimap2.wdl

bwa:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_bwa.json wf_bwa.wdl
	miniwdl check wf_bwa.wdl

run_bwa:
	miniwdl run --debug --dir test-bwa --cfg ../miniwdl_production.cfg --input wf_bwa.json wf_bwa.wdl

ngs_pipeline:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_ngs_pipeline.json wf_ngs_pipeline.wdl
	miniwdl check wf_ngs_pipeline.wdl

ngs_pipeline_docu:
	wdl-aid wf_ngs_pipeline.wdl -o wf_ngs_pipeline.md
	java -jar ~/Software/womtool-86.jar graph wf_ngs_pipeline.wdl > wf_ngs_pipeline.dot
	dot -Tpdf -o wf_ngs_pipeline.pdf wf_ngs_pipeline.dot
	dot -Tjpeg -o wf_ngs_pipeline.jpeg wf_ngs_pipeline.dot
	rm wf_ngs_pipeline.dot

run_ngs_pipeline:
	miniwdl run --debug --dir test-ngs_pipeline --cfg ../miniwdl_production.cfg --input wf_ngs_pipeline.json wf_ngs_pipeline.wdl

run_ngs_pipeline_tNGS:
	miniwdl run --debug --dir ngs_pipeline --cfg ../miniwdl_production.cfg  --input wf_ngs_pipeline_tNGS.json wf_ngs_pipeline.wdl 	

tbprofiler: 
	java -jar ~/Software/womtool-86.jar validate --inputs wf_tbprofiler.json wf_tbprofiler.wdl
	miniwdl check wf_tbprofiler.wdl

tbprofiler_docu:
	wdl-aid wf_tbprofiler.wdl -o wf_tbprofiler.md
	java -jar ~/Software/womtool-86.jar graph wf_tbprofiler.wdl > wf_tbprofiler.dot
	dot -Tpdf -o wf_tbprofiler.pdf wf_tbprofiler.dot
	dot -Tjpeg -o wf_tbprofiler.jpeg wf_tbprofiler.dot
	rm wf_tbprofiler.dot

run_tbprofiler:
	miniwdl run --debug --dir test-tbprofiler_wgs --cfg ../miniwdl_production.cfg --input wf_tbprofiler.json wf_tbprofiler.wdl

run_tbprofiler_cromwell:
	java -jar ~/Software/cromwell-86.jar run wf_tbprofiler.wdl -i wf_tbprofiler.json

run_tbprofiler_tNGS:
	miniwdl run --debug --dir tbprofiler_tNGS --input wf_tbprofiler_tNGS.json wf_tbprofiler.wdl 

varpipe:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_varpipe.json wf_varpipe.wdl
	miniwdl check wf_varpipe.wdl

varpipe_docu:
	wdl-aid wf_varpipe.wdl -o wf_varpipe.md
	java -jar ~/Software/womtool-86.jar graph wf_varpipe.wdl > wf_varpipe.dot
	dot -Tpdf -o wf_varpipe.pdf wf_varpipe.dot
	dot -Tjpeg -o wf_varpipe.jpeg wf_varpipe.dot
	rm wf_varpipe.dot

run_varpipe:
	miniwdl run --debug --dir test-varpipe_wgs --cfg ../miniwdl_production.cfg --input wf_varpipe.json wf_varpipe.wdl 

run_varpipe_cromwell:
	java -jar ~/Software/cromwell-86.jar run wf_varpipe.wdl -i wf_varpipe.json

run_varpipe_tNGS:
	miniwdl run --debug --dir test-varpipe_tNGS --cfg ../miniwdl_production.cfg --input wf_varpipe_tNGS.json wf_varpipe.wdl 

run_varpipe_dbest:
	cp wf_varpipe.json wf_varpipe_dbest.json
	sed -i 's|dieterbest|dbest|' wf_varpipe_dbest.json
	sed -i 's|bbduk_contamination_polyA.tar.gz|bbduk_contamination.tar.gz|' wf_varpipe_dbest.json
	sed -i 's|clockwork_contaminants.fa.gz|clockwork_contaminants_cdc_v2.fa.gz|' wf_varpipe_dbest.json
	sed -i 's|clockwork_contaminants_metadata.tsv|clockwork_contaminants_metadata_cdc_v2.tsv|' wf_varpipe_dbest.json	
	sed -i 's|8GB|250GB|' wf_varpipe_dbest.json
	miniwdl run --debug --dir test-varpipe_wgs --cfg ../miniwdl_production.cfg --input wf_varpipe_dbest.json wf_varpipe.wdl task_bbduk.threads=16 task_fastq_screen.threads=16 task_fastqc.threads=16 task_fastqc_after_cleanup.threads=16 task_trimmomatic.threads=16 task_varpipe.threads=16


#
# only difference between wf_varpipe_cdc.json and wf_varpipe.json
# wf_varpipe_cdc.json:
# a) different config file: snp_cdc_docker.config
# b) different bed file: cdc_regions.bed
#
run_varpipe_cdc:
	miniwdl run --debug --dir test-varpipe_cdc --cfg ../miniwdl_production.cfg --input wf_varpipe_cdc.json \
	wf_varpipe.wdl \
	task_bbduk.threads=1

snpit:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_snpit.json wf_snpit.wdl
	miniwdl check wf_snpit.wdl

run_snpit:
	miniwdl run --debug --dir test-snpit --cfg ../miniwdl_production.cfg --input wf_snpit.json wf_snpit.wdl

fast_lineage_caller:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_fast_lineage_caller.json wf_fast_lineage_caller.wdl
	miniwdl check wf_fast_lineage_caller.wdl

run_fast_lineage_caller:
	miniwdl run --debug --dir test-fast_lineage_caller --cfg ../miniwdl_production.cfg --input wf_fast_lineage_caller.json wf_fast_lineage_caller.wdl

bcf2vcf:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_bcf2vcf.json wf_bcf2vcf.wdl
	miniwdl check wf_bcf2vcf.wdl

fastq_screen:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_fastq_screen.json wf_fastq_screen.wdl
	miniwdl check wf_fastq_screen.wdl 

run_fastq_screen:
	miniwdl run --debug --dir test-fastq_screen --cfg ../miniwdl_production.cfg --input wf_fastq_screen.json wf_fastq_screen.wdl

fastqc:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_fastqc.json wf_fastqc.wdl
	miniwdl check wf_fastqc.wdl
	wdl-aid wf_fastqc.wdl -o wf_fastqc.md

run_fastqc:
	miniwdl run --debug --dir test-fastqc --cfg ../miniwdl_production.cfg  --input wf_fastqc.json wf_fastqc.wdl

run_fastqc_adapters:
	miniwdl run --debug --dir test-fastqc --cfg ../miniwdl_production.cfg --input wf_fastqc_adapters.json wf_fastqc.wdl

clockwork_decontamination:
	java -jar ~/Software/womtool-86.jar validate wf_clockwork_decontamination.wdl
	miniwdl check wf_clockwork_decontamination.wdl 

run_clockwork_decontamination:
	miniwdl run --debug --dir test-clockwork --cfg ../miniwdl_production.cfg --input wf_clockwork_decontamination.json wf_clockwork_decontamination.wdl 

bbduk:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_bbduk.json wf_bbduk.wdl
	miniwdl check wf_bbduk.wdl

run_bbduk:
	miniwdl run --debug --dir test-bbduk --input wf_bbduk.json wf_bbduk.wdl 

run_bbduk_no_contamination:
	miniwdl run --debug --dir test-bbduk --cfg ../miniwdl_production.cfg --input wf_bbduk_no_contamination.json wf_bbduk.wdl 

concatenate_fastq:
	java -jar ~/Software/womtool-86.jar validate wf_concatenate_fastq.wdl
	miniwdl check wf_concatenate_fastq.wdl 

collect_multiple_metrics:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_collect_multiple_metrics.json wf_collect_multiple_metrics.wdl
	miniwdl check wf_collect_multiple_metrics.wdl

run_collect_multiple_metrics:
	miniwdl run --debug --dir multiple_metrics --input wf_collect_multiple_metrics.json wf_collect_multiple_metrics.wdl 

collect_hs_metrics:
	java -jar ~/Software/womtool-86.jar validate wf_collect_hs_metrics.wdl
	miniwdl check wf_collect_hs_metrics.wdl 

collect_targeted_pcr_metrics:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_collect_targeted_pcr_metrics.json wf_collect_targeted_pcr_metrics.wdl
	miniwdl check wf_collect_targeted_pcr_metrics.wdl

run_collect_targeted_pcr_metrics:
	miniwdl run --debug --dir targeted_pcr --cfg ../miniwdl_production.cfg --input wf_collect_targeted_pcr_metrics.json wf_collect_targeted_pcr_metrics.wdl 

collect_wgs_metrics:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_collect_wgs_metrics.json wf_collect_wgs_metrics.wdl
	miniwdl check wf_collect_wgs_metrics.wdl

run_collect_wgs_metrics:
	miniwdl run --debug --dir wgs_metrics_no_bed --cfg ../miniwdl_production.cfg --input wf_collect_wgs_metrics_no_bed.json wf_collect_wgs_metrics.wdl 
	miniwdl run --debug --dir wgs_metrics        --cfg ../miniwdl_production.cfg --input wf_collect_wgs_metrics.json        wf_collect_wgs_metrics.wdl 

depth_of_coverage:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_depth_of_coverage.json wf_depth_of_coverage.wdl
	miniwdl check wf_depth_of_coverage.wdl 
	wdl-aid wf_depth_of_coverage.wdl -o wf_depth_of_coverage.md

run_depth_of_coverage:
	miniwdl run --debug --dir coverage --cfg ../miniwdl_production.cfg --input wf_depth_of_coverage.json wf_depth_of_coverage.wdl 

multiqc:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_multiqc.json wf_multiqc.wdl
	miniwdl check wf_multiqc.wdl

delly:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_delly.json wf_delly.wdl
	miniwdl check wf_delly.wdl
	wdl-aid wf_delly.wdl -o wf_delly.md

mark_duplicates:
	java -jar ~/Software/womtool-86.jar validate task_mark_duplicates.wdl
	miniwdl check task_mark_duplicates.wdl

trimmomatic:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_trimmomatic.json wf_trimmomatic.wdl
	miniwdl check wf_trimmomatic.wdl

run_trimmomatic:
	miniwdl run --debug --dir test-trimmomatic --cfg ../miniwdl_production.cfg --input wf_trimmomatic.json wf_trimmomatic.wdl

variant_interpretation:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_variant_interpretation.json wf_variant_interpretation.wdl
	miniwdl check wf_variant_interpretation.wdl
	wdl-aid wf_variant_interpretation.wdl -o wf_variant_interpretation.md
	#grip -b wf_variant_interpretation.md

lims_report:
	java -jar ~/Software/womtool-86.jar validate -i wf_lims_report.json wf_lims_report.wdl
	miniwdl check wf_lims_report.wdl

run_lims_report:
	miniwdl run --debug --dir test-lims_report --input wf_lims_report.json wf_lims_report.wdl

lineage:
	java -jar ~/Software/womtool-86.jar validate -i wf_lineage.json wf_lineage.wdl
	miniwdl check wf_lineage.wdl	
	wdl-aid wf_lineage.wdl -o wf_lineage.md

run_lineage:
	miniwdl run --debug --dir test-lineage --input wf_lineage.json wf_lineage.wdl

interpretation:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_interpretation.json wf_interpretation.wdl
	miniwdl check wf_interpretation.wdl
	wdl-aid wf_interpretation.wdl -o wf_interpretation.md
	java -jar ~/Software/womtool-86.jar graph wf_interpretation.wdl > temp.dot
	dot -Tpdf -o wf_interpretation.pdf temp.dot
	rm temp.dot

run_interpretation:
	miniwdl run --debug --dir test-interpretation --cfg ../miniwdl_production.cfg --input wf_interpretation.json wf_interpretation.wdl

run_interpretation_no_lineage:
	miniwdl run --debug --dir test-interpretation --cfg ../miniwdl_production.cfg --input wf_interpretation_no_lineage.json wf_interpretation.wdl

run_variant_interpretation:
	miniwdl run --debug --dir test-variant_interpretation --input wf_variant_interpretation.json wf_variant_interpretation.wdl

run_variant_interpretation_London:
	miniwdl run --debug --dir test-variant_interpretation_London --cfg ../miniwdl_production.cfg --input wf_variant_interpretation_London.json wf_variant_interpretation.wdl

gatk:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_gatk.json wf_gatk.wdl
	miniwdl check wf_gatk.wdl

snpEff:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_snpEff.json wf_snpEff.wdl
	miniwdl check wf_snpEff.wdl	

run_snpEff:
	miniwdl run --debug --dir test-snpEff --cfg ../miniwdl_production.cfg --input wf_snpEff.json wf_snpEff.wdl

repair:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_repair.json wf_repair.wdl
	miniwdl check wf_repair.wdl	

run_repair:
	miniwdl run --debug --dir test-repair --cfg ../miniwdl_production.cfg --input wf_repair.json wf_repair.wdl

structural_variants:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_structural_variants.json wf_structural_variants.wdl
	miniwdl check wf_structural_variants.wdl	

run_structural_variants:
	miniwdl run --debug --dir test-structural_variants --cfg ../miniwdl_production.cfg --input wf_structural_variants.json wf_structural_variants.wdl

concat_2_vcfs:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_concat_2_vcfs.json wf_concat_2_vcfs.wdl
	miniwdl check wf_concat_2_vcfs.wdl

run_concat_2_vcfs:
	miniwdl run --debug --dir test-concat_2_vcfs --cfg ../miniwdl_production.cfg wf_concat_2_vcfs.wdl -i wf_concat_2_vcfs.json

concatenate_csv:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_concatenate_csv_files.json wf_concatenate_csv_files.wdl
	miniwdl check wf_concatenate_csv_files.wdl

run_concatenate_csv:
	miniwdl run --debug --dir test-concatenate_csv --cfg ../miniwdl_production.cfg wf_concatenate_csv_files.wdl -i wf_concatenate_csv_files.json

split:
	fastqsplitter -i ../data/ERR552797_30percent_1.fq.gz -o ../data/1_1.fq.gz -o ../data/2_1.fq.gz -o ../data/3_1.fq.gz
	fastqsplitter -i ../data/ERR552797_30percent_2.fq.gz -o ../data/1_2.fq.gz -o ../data/2_2.fq.gz -o ../data/3_2.fq.gz

split_all:
	fastqsplitter -i ../data/ERR552797_1.fastq.gz -o ERR552797_1_1.fq.gz -o ERR552797_2_1.fq.gz -o ERR552797_3_1.fq.gz
	fastqsplitter -i ../data/ERR552797_2.fastq.gz -o ERR552797_1_2.fq.gz -o ERR552797_2_2.fq.gz -o ERR552797_3_2.fq.gz
