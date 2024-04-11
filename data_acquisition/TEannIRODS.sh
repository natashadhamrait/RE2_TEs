#!/bin/bash

#SBATCH -D /home/ndhamra/projects/NAM_shortreads_RE
#SBATCH -o /home/ndhamra/projects/NAM_shortreads_RE/SLURM_logs/TEannIRODS_download-stdout-%j.txt
#SBATCH -e /home/ndhamra/projects/NAM_shortreads_RE/SLURM_logs/TEannIRODS_download-stderr-%j.txt
#SBATCH --job-name=TEannIRODS
#SBATCH -p high2
#SBATCH --mem=18G
#SBATCH -t 10:00:00
set -e
set -u

#SBATCH --mail-type=Begin
#SBATCH --mail-type=End

# send mail here
#SBATCH --mail-user= ndhamrait@ucdavis.edu

#script
eval "$(conda shell.bash hook)"

conda activate singularity

singularity run irods.sif iget -K -P -r -T -f  /iplant/home/shared/NAM/NAM_genome_and_annotation_Jan2021_release/TRANSPOSABLE_ELEMENTS/TE_ANNOTATIONS_metadata.txt

