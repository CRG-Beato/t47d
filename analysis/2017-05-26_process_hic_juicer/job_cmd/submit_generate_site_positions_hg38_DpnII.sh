#!/bin/bash
#$ -N submit_generate_site_positions_hg38_DpnII
#$ -q short-sl7
#$ -l virtual_free=10G
#$ -l h_rt=06:00:00
#$ -M javier.quilez@crg.eu
#$ -m abe
#$ -j y
#$ -o /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/job_out/submit_generate_site_positions_hg38_DpnII_$JOB_ID.out
#$ -e /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/job_out/submit_generate_site_positions_hg38_DpnII_$JOB_ID.err
#$ -pe smp 4
cd /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/data/juicer/restriction_sites
/software/mb/el7.2/anaconda2/bin/python /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/scripts/generate_site_positions.py DpnII hg38 /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/data/juicer/references/hg38_mmtv_chr1-22XYMUn.fa
