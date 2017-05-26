#!/bin/bash
#$ -N run_juicer_
#$ -q short-sl7
#$ -l virtual_free=10G
#$ -l h_rt=06:00:00
#$ -M javier.quilez@crg.eu
#$ -m abe
#$ -j y
#$ -o /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/job_out/run_juicer__$JOB_ID.out
#$ -e /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/job_out/run_juicer__$JOB_ID.err
#$ -pe smp 1
/users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/data/juicer/scripts/juicer.sh -z /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/data/juicer/references/hg38_mmtv_chr1-22XYMUn.fa -p /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/data/juicer/references/hg38_mmtv_chr1-22XYMUn.chrom.sizes -s DpnII -g hg38 -D /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/data/juicer -d /users/GR/mb/jquilez/projects/t47d/analysis/2017-05-26_process_hic_juicer/data/samples/
