#!/bin/bash
#SBATCH --job-name=vcf_stats
#SBATCH --partition=quick
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --time=00:30:00
#SBATCH --output=logs/vcf_stats_%j.out
#SBATCH --error=logs/vcf_stats_%j.err

echo "Job ID: ${SLURM_JOB_ID}"
echo "Start: $(date)"

source ~/.bashrc
conda activate local_pca

INPUT_DIR="/gs/gsfs0/users/raj-lab/rhone_galchen/rgalchen/first_week"
OUTPUT_DIR="/gs/gsfs0/users/raj-lab/rhone_galchen/rgalchen/first_week/results"

python vcf_stats.py ${INPUT_DIR} ${OUTPUT_DIR}

echo "End: $(date)"
