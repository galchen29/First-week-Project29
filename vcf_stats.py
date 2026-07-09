"""Compute basic stats from extracted VCF files and generate a plot."""

import sys
import os
import pandas as pd
import matplotlib
matplotlib.use('Agg')  # Non-interactive backend (no display needed on HPC)
import matplotlib.pyplot as plt

# Input: directory containing chr*.vcf files
input_dir = sys.argv[1]
output_dir = sys.argv[2]
os.makedirs(output_dir, exist_ok=True)

# Count variants per chromosome
results = []
for vcf_file in sorted(os.listdir(input_dir)):
    if vcf_file.startswith("chr") and vcf_file.endswith(".vcf"):
        chr_name = vcf_file.replace(".vcf", "")
        filepath = os.path.join(input_dir, vcf_file)

        n_variants = 0
        with open(filepath) as f:
            for line in f:
                if not line.startswith("#"):
                    n_variants += 1

        results.append({"chromosome": chr_name, "n_variants": n_variants})
        print(f"{chr_name}: {n_variants} variants")

# Create DataFrame and save
df = pd.DataFrame(results)
df.to_csv(os.path.join(output_dir, "variant_counts.csv"), index=False)
print(f"\nSaved variant counts to {output_dir}/variant_counts.csv")

# Plot
fig, ax = plt.subplots(figsize=(8, 4))
ax.bar(df["chromosome"], df["n_variants"], color="steelblue")
ax.set_xlabel("Chromosome")
ax.set_ylabel("Number of Variants")
ax.set_title("Variant Counts per Chromosome")
plt.tight_layout()

plot_path = os.path.join(output_dir, "variant_counts.png")
fig.savefig(plot_path, dpi=150)
print(f"Saved plot to {plot_path}")