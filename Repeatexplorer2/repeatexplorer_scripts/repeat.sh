#!/bin/bash

#SBATCH -D /home/ndhamra/repeatexplorer
#SBATCH -o /home/ndhamra/repeatexplorer/re_NAM/SLURM_logs/repeat-stdout-%j.txt
#SBATCH -e /home/ndhamra/repeatexplorer/re_NAM/SLURM_logs/repeat-stderr-%j.txt
#SBATCH --job-name=repeat
#SBATCH -p high2
#SBATCH --mem=360G
#SBATCH -t 8-10:00:00
set +e
set +u


in=$1
out=$2

#script
eval "$(conda shell.bash hook)"

conda activate singularity

singularity --version

singularity exec --no-home --env TEMP=/tmp --bind ../tmp:/tmp -e --bind ${PWD}:${PWD} repex_tarean  seqclust --cpu 120 --paired --prefix_length 1 -p -v $out.output $in --cleanup --database NAM.EDTA1.8.0.MTEC02052020.TElib.clean.fa NAM_EDTA
