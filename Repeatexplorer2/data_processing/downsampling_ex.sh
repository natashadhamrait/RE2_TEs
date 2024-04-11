#!/bin/bash

#SBATCH -D /home/ndhamra/projects/NAM_shortreads_RE/files/clean_files
#SBATCH -o /home/ndhamra/projects/NAM_shortreads_RE/SLURM_logs/downsample2-stdout-%j.txt
#SBATCH -e /home/ndhamra/projects/NAM_shortreads_RE/SLURM_logs/downsample2-stderr-%j.txt
#SBATCH --job-name=downsample2
#SBATCH -p high2
#SBATCH --mem=18G
#SBATCH -t 50:00:00
set -e
set -u

#SBATCH --mail-type=Begin
#SBATCH --mail-type=End

# send mail here
#SBATCH --mail-user=ndhamrait@ucdavis.edu

module load seqtk

####for each file pair
#CML103-A
        #seqtk subsamples, random seed is the -s, number after file level of subsampling (number of reads OR fraction of the reads>
seqtk sample -s 32  CML103_R1_clean.fastq.gz 2400000 >  CML103_R1_subsample.fastq
seqtk sample -s 32  CML103_R2_clean.fastq.gz 2400000 >  CML103_R2_subsample.fastq

        #join paired reads into one file
seqtk mergepe CML103_R1_subsample.fastq CML103_R2_subsample.fastq seqtk  > CML103_clean_sample_merged.fastq

        #Convert to FASTA
seqtk seq -a CML103_clean_sample_merged.fastq > CML103_clean_sample_merged.fasta

        #add prefixes
seqtk rename CML103_clean_sample_merged.fastq A > prefix_CML103_clean_sample_merged.fastq

#CML277-B
seqtk sample -s 32  CML277_R1_clean.fastq.gz 2400000 >  CML277_R1_subsample.fastq
seqtk sample -s 32  CML277_R2_clean.fastq.gz 2400000 >  CML277_R2_subsample.fastq
seqtk mergepe CML277_R1_subsample.fastq CML277_R2_subsample.fastq seqtk  > CML277_clean_sample_merged.fastq
seqtk seq -a CML277_clean_sample_merged.fastq > CML277_clean_sample_merged.fasta
seqtk rename CML277_clean_sample_merged.fastq B > prefix_CML277_clean_sample_merged.fastq

#CML322-C
seqtk sample -s 32  CML322_R1_clean.fastq.gz 2400000 >  CML322_R1_subsample.fastq
seqtk sample -s 32  CML322_R2_clean.fastq.gz 2400000 >  CML322_R2_subsample.fastq
seqtk mergepe CML322_R1_subsample.fastq CML322_R2_subsample.fastq seqtk  > CML322_clean_sample_merged.fastq
seqtk seq -a CML322_clean_sample_merged.fastq > CML322_clean_sample_merged.fasta
seqtk rename CML322_clean_sample_merged.fastq C > prefix_CML322_clean_sample_merged.fastq

#CML333-E
seqtk sample -s 32 CML333_R1_clean.fastq.gz 2400000 > CML333_R1_subsample.fastq
seqtk sample -s 32 CML333_R2_clean.fastq.gz 2400000 > CML333_R2_subsample.fastq
seqtk mergepe CML333_R1_subsample.fastq CML333_R2_subsample.fastq seqtk > CML333_clean_sample_merged.fastq
seqtk seq -a CML333_clean_sample_merged.fastq > CML333_clean_sample_merged.fasta
seqtk rename CML333_clean_sample_merged.fastq E > prefix_CML333_clean_sample_merged.fastq

#CML69-F
seqtk sample -s 32 CML69_R1_clean.fastq.gz 2400000 > CML69_R1_subsample.fastq
seqtk sample -s 32 CML69_R2_clean.fastq.gz 2400000 > CML69_R2_subsample.fastq
seqtk mergepe CML69_R1_subsample.fastq CML69_R2_subsample.fastq seqtk > CML69_clean_sample_merged.fastq
seqtk seq -a CML69_clean_sample_merged.fastq > CML69_clean_sample_merged.fasta
seqtk rename CML69_clean_sample_merged.fastq F > prefix_CML69_clean_sample_merged.fastq

#IL14H-G
seqtk sample -s 32 IL14H_R1_clean.fastq.gz 2400000 > IL14H_R1_subsample.fastq
seqtk sample -s 32 IL14H_R2_clean.fastq.gz 2400000 > IL14H_R2_subsample.fastq
seqtk mergepe IL14H_R1_subsample.fastq IL14H_R2_subsample.fastq seqtk > IL14H_clean_sample_merged.fastq
seqtk seq -a IL14H_clean_sample_merged.fastq > IL14H_clean_sample_merged.fasta
seqtk rename IL14H_clean_sample_merged.fastq G > prefix_IL14H_clean_sample_merged.fastq

#Ki11-H
seqtk sample -s 32 Ki11_R1_clean.fastq.gz 2400000 > Ki11_R1_subsample.fastq
seqtk sample -s 32 Ki11_R2_clean.fastq.gz 2400000 > Ki11_R2_subsample.fastq
seqtk mergepe Ki11_R1_subsample.fastq Ki11_R2_subsample.fastq seqtk > Ki11_clean_sample_merged.fastq
seqtk seq -a Ki11_clean_sample_merged.fastq > Ki11_clean_sample_merged.fasta
seqtk rename Ki11_clean_sample_merged.fastq H > prefix_Ki11_clean_sample_merged.fastq

#Ki3-I
seqtk sample -s 32 Ki3_R1_clean.fastq.gz 2400000 > Ki3_R1_subsample.fastq
seqtk sample -s 32 Ki3_R2_clean.fastq.gz 2400000 > Ki3_R2_subsample.fastq
seqtk mergepe Ki3_R1_subsample.fastq Ki3_R2_subsample.fastq seqtk > Ki3_clean_sample_merged.fastq
seqtk seq -a Ki3_clean_sample_merged.fastq > Ki3_clean_sample_merged.fasta
seqtk rename Ki3_clean_sample_merged.fastq I > prefix_Ki3_clean_sample_merged.fastq

#Ky21v-J
seqtk sample -s 32 Ky21v_R1_clean.fastq.gz 2400000 > Ky21v_R1_subsample.fastq
seqtk sample -s 32 Ky21v_R2_clean.fastq.gz 2400000 > Ky21v_R2_subsample.fastq
seqtk mergepe Ky21v_R1_subsample.fastq Ky21v_R2_subsample.fastq seqtk > Ky21v_clean_sample_merged.fastq
seqtk seq -a Ky21v_clean_sample_merged.fastq > Ky21v_clean_sample_merged.fasta
seqtk rename Ky21v_clean_sample_merged.fastq J > prefix_Ky21v_clean_sample_merged.fastq

#Mo18w-K
seqtk sample -s 32 Mo18W_R1_clean.fastq.gz 2400000 > Mo18w_R1_subsample.fastq
seqtk sample -s 32 Mo18W_R2_clean.fastq.gz 2400000 > Mo18w_R2_subsample.fastq
seqtk mergepe Mo18w_R1_subsample.fastq Mo18w_R2_subsample.fastq seqtk > Mo18w_clean_sample_merged.fastq
seqtk seq -a Mo18w_clean_sample_merged.fastq > Mo18w_clean_sample_merged.fasta
seqtk rename Mo18w_clean_sample_merged.fastq K > prefix_Mo18w_clean_sample_merged.fastq

#NC350-L
seqtk sample -s 32 NC350_R1_clean.fastq.gz 2400000 > NC350_R1_subsample.fastq
seqtk sample -s 32 NC350_R2_clean.fastq.gz 2400000 > NC350_R2_subsample.fastq
seqtk mergepe NC350_R1_subsample.fastq NC350_R2_subsample.fastq seqtk > NC350_clean_sample_merged.fastq
seqtk seq -a NC350_clean_sample_merged.fastq > NC350_clean_sample_merged.fasta
seqtk rename NC350_clean_sample_merged.fastq L > prefix_NC350_clean_sample_merged.fastq

#TZi8-M
seqtk sample -s 32 TZi8_R1_clean.fastq.gz 2400000 > TZi8_R1_subsample.fastq
seqtk sample -s 32 TZi8_R2_clean.fastq.gz 2400000 > TZi8_R2_subsample.fastq
seqtk mergepe TZi8_R1_subsample.fastq TZi8_R2_subsample.fastq seqtk > TZi8_clean_sample_merged.fastq
seqtk seq -a TZi8_clean_sample_merged.fastq > TZi8_clean_sample_merged.fasta
seqtk rename TZi8_clean_sample_merged.fastq M > prefix_TZi8_clean_sample_merged.fastq

###final processing
        cat prefix* > NAM_final3.fasta
        mv NAM_final3.fasta ../../../../repeatexplorer/
