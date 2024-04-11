#!/bin/bash

#SBATCH -D /home/ndhamra/projects/NAM_shortreads_RE/files/BioSample10_CML277
#SBATCH -o /home/ndhamra/projects/NAM_shortreads_RE/SLURM_logs/cat_CML277-stdout-%j.txt
#SBATCH -e /home/ndhamra/projects/NAM_shortreads_RE/SLURM_logs/cat_CML277-stderr-%j.txt
#SBATCH --job-name=cat_CML277
#SBATCH -p bigmemm
#SBATCH --mem=18G
#SBATCH -t 15:00:00
set -e
set -u

cat $(find -type f -name "*R1*") > CML277_R1.fastq
cat $(find -type f -name "*R2*") > CML277_R2.fastq

mv CML277_R1.fastq ../CML277_R1.fastq
mv CML277_R2.fastq ../CML277_R2.fastq
