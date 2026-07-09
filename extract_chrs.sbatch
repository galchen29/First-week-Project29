#!/bin/bash
#SBATCH --job-name=extract_chrs
#SBATCH --partition=quick
#SBATCH --array=20-22
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=00:30:00
#SBATCH --output=rgalchen/logs/chr%a_%j.out
#SBATCH --error=rgalchen/logs/chr%a_%j.err

# SLURM_ARRAY_TASK_ID is automatically set to the current array index
CHR=${SLURM_ARRAY_TASK_ID}

echo "Processing chromosome ${CHR}"
echo "Job ID: ${SLURM_JOB_ID}, Array Task: ${SLURM_ARRAY_TASK_ID}"

# Set paths
VCF="/gs/gsfs0/users/raj-lab/rhone_galchen/test_vcf/chr22.homogenous.vcf.gz"
OUTDIR="/gs/gsfs0/users/raj-lab/rhone_galchen/rgalchen/first_week"

mkdir -p ${OUTDIR}

zcat ${VCF} | grep "^#" > ${OUTDIR}/chr${CHR}.vcf
zcat ${VCF} | grep -v "^#" | awk -v chr="${CHR}" '$1 == chr || $1 == "chr"chr' >> ${OUTDIR}/chr${CHR}.vcf

echo "Chr${CHR} variants: $(grep -cv '^#' ${OUTDIR}/chr${CHR}.vcf)"
echo "Done: $(date)"
