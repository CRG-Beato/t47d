#!/bin/bash


#==================================================================================================
# Created on: 2017-05-26
# Usage: ./submit_generate_site_positions.sh
# Author: Javier Quilez (GitHub: jaquol)
# Goal: submit job to the cluster to execute the generate_site_positions.py script
#==================================================================================================

# variables
restriction_enzyme=DpnII
project=t47d
analysis=2017-05-26_process_hic_juicer
assembly_version=hg38
process=submit_generate_site_positions

# paths
ANALYSIS=$HOME/projects/$project/analysis/$analysis
JOB_CMD=$ANALYSIS/job_cmd 
JOB_OUT=$ANALYSIS/job_out
ODIR=$ANALYSIS/data/restriction_sites
mkdir -p $JOB_CMD
mkdir -p $JOB_OUT
mkdir -p $ODIR
python=`which python`
ifa=$ANALYSIS/data/juicer/references/hg38_mmtv_chr1-22XYMUn.fa
generate_site_positions=$ANALYSIS/data/juicer/scripts/generate_site_positions.py

# CRG cluster parameters
queue=short-sl7
memory=10G
max_time=06:00:00
slots=4



#==================================================================================================
# JOB
#==================================================================================================

# Build job: parameters
job_name=${process}_${assembly_version}_${restriction_enzyme}
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

# generate job
job_cmd="cd $ODIR"
echo $job_cmd >> $job_file
job_cmd="$python $generate_site_positions $restriction_enzyme $assembly_version $ifa"
echo $job_cmd >> $job_file

# submit job
chmod a+x $job_file
#qsub < $job_file
cat $job_file

