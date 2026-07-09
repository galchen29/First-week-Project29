#!/bin/bash
#SBATCH --job-name=extract_chr22
#SBATCH --partition=quick
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=00:30:00
#SBATCH --output=logs/chr22_%j.out
#SBATCH --error=logs/chr22_%j.err

echo "Job ID: ${SLURM_JOB_ID}"
echo "Node: ${SLURM_NODELIST}"
echo "Start time: $(date)"

VCF="/gs/gsfs0/users/raj-lab/rhone_galchen/test_vcf/chr22.homogenous.vcf.gz"
OUTDIR="/gs/gsfs0/users/raj-lab/rhone_galchen/rgalchen/first_week"

mkdir -p ${OUTDIR}

zcat ${VCF} | grep "^#" > ${OUTDIR}/chr22.vcf
zcat ${VCF} | grep -v "^#" | awk '$1 == "22" || $1 == "chr22"' >> ${OUTDIR}/chr22.vcf

echo "Variants extracted: $(grep -cv '^#' ${OUTDIR}/chr22.vcf)"
echo "End time: $(date)"
