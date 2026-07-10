# First Week Project Notes

## Date
2026-07-09

## Data Location
- **Input VCF:** /gs/gsfs0/users/raj-lab/rhone_galchen/test_vcf/chr22.homogenous.vcf.gz/
- **Output directory:** /gs/gsfs0/users/raj-lab/rhone_galchen/rgalchen/logs
- **Results:** /gs/gsfs0/users/raj-lab/rhone_galchen/rgalchen/first_week/results

## Scripts
| Script | Purpose | How to run |
|--------|---------|-----------|
| extract_chr22.sbatch | Extract chr22 from VCF | `sbatch extract_chr22.sbatch` |
| extract_chrs.sbatch | Array job for chr20-22 | `sbatch extract_chrs.sbatch` |
| vcf_stats.py | Compute variant counts, generate plot | Called by run_vcf_stats.sbatch |
| run_vcf_stats.sbatch | SLURM wrapper for vcf_stats.py | `sbatch run_vcf_stats.sbatch` |

## Results Summary
- Total lines in VCF: 100100___
- Number of samples: 1748___
- Chr22 variants: 100055___
- Top 3 alternate alleles: 29200 A
                           29105 T
                           20898 C___

## Lessons Learned
[What was confusing? What do you want to remember?]

The github stuff was kind of confusing. There werent any instructions on how to actually make the git.ignore and etc so I had to figure that out. I alos need to do a better job with organization because, as seen with the output logs, it got pretty messy. Also, it took me some time to understand sbatch files and that theyre actually almost like a local function or script you create rather than something you can paste in the terminal.

I definitely want to remember basic simple functions like cd, pwd, scp, cp, and zcat as well as to use this learning experience to get better at organizing data.

Particular Points of Confusion:

I would add a little more explanation into what a batch script actually is. I was super confused when I first saw it and didnt realize that it was something that actually serves as a script for the functions needed.

Also, for part 4a, make sure people understand that R and python are unable to be used in the same environment. Possibly as part of the quickstart walk ppl through text editors what they are, how to use them, etc.

5b. Make sure that it is clear how to create the git.ignore. I had to use a cat command to create it and there may be another way that I am not aware of but I don't think it was in the how-to

Overall super clear though.
