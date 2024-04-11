#!/bin/bash

#SBATCH -D /home/ndhamra/projects/NAM_shortreads_RE/files
#SBATCH -o /home/ndhamra/projects/NAM_shortreads_RE/SLURM_logs/trim_CML103-stdout-%j.txt
#SBATCH -e /home/ndhamra/projects/NAM_shortreads_RE/SLURM_logs/trim_CML103-stderr-%j.txt
#SBATCH --job-name=trim_CML103
#SBATCH -p high2
#SBATCH --mem=100G
#SBATCH -t 10:00:00
set -e
set -u

#SBATCH --mail-type=Begin
#SBATCH --mail-type=End

# send mail here
#SBATCH --mail-user= ndhamrait@ucdavis.edu

#######script#####
#trim adapters off all .fastq files (needed for proper clustering) used in paired end mode
module load trimmomatic/0.39

trimmomatic PE -phred33 CML103_R1.fastq.gz CML103_R2.fastq.gz\
                CML103_R1_clean.fastq.gz CML103_R1_unpaired.fastq.gz\
                CML103_R2_clean.fastq.gz CML103_R2_unpaired.fastq.gz\
                SLIDINGWINDOW:4:10 CROP:100 HEADCROP:10 MINLEN:90
