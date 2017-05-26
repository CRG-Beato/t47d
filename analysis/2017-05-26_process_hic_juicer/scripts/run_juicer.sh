#!/bin/bash


#==================================================================================================
# Created on: 2017-05-26
# Usage: ./run_juicer.sh
# Author: Javier Quilez (GitHub: jaquol)
# Goal: submit job to the cluster to execute the generate_site_positions.py script
#==================================================================================================

# variables
sample=test1
restriction_enzyme=DpnII
project=t47d
analysis=2017-05-26_process_hic_juicer
assembly_version=hg38
process=run_juicer

# paths
ANALYSIS=$HOME/projects/$project/analysis/$analysis
JOB_CMD=$ANALYSIS/job_cmd 
JOB_OUT=$ANALYSIS/job_out
DATA=$ANALYSIS/data
SAMPLE=$DATA/samples/$sample
JUICER=$DATA/juicer
mkdir -p $JOB_OUT
mkdir -p $JOB_CMD
ifa=$DATA/juicer/references/hg38_mmtv_chr1-22XYMUn.fa
chrom_sizes=$DATA/juicer/references/hg38_mmtv_chr1-22XYMUn.chrom.sizes

# CRG cluster parameters
queue=short-sl7
memory=10G
max_time=06:00:00
slots=1



#==================================================================================================
# COMMANDS
#==================================================================================================

# Build job: parameters
job_name=${process}_${sample}
job_file=$JOB_CMD/$job_name.sh
m_out=$JOB_OUT
echo "#!/bin/bash
#$ -N $job_name
#$ -q $queue
#$ -l virtual_free=$memory
#$ -l h_rt=$max_time
#$ -M javier.quilez@crg.eu
#$ -m abe
#$ -j y
#$ -o $m_out/${job_name}_\$JOB_ID.out
#$ -e $m_out/${job_name}_\$JOB_ID.err
#$ -pe smp $slots" > $job_file

# execute juicer
job_cmd="$JUICER/scripts/juicer.sh -z $ifa -p $chrom_sizes -s $restriction_enzyme -g $assembly_version -D $JUICER -d $SAMPLE"
echo $job_cmd >> $job_file

# remove intermediate files
job_cmd="cd $SAMPLE; bash ../../juicer/scripts/common/cleanup.sh"
echo $job_cmd >> $job_file

# submit job
chmod a+x $job_file
qsub < $job_file
#$job_file


