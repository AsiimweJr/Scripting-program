#!/bin/bash
# The "Shebang": Tells Linux to execute this script using the Bash shell interpreter.

# ==================== SLURM RESOURCE DIRECTIVES ====================
#SBATCH --job-name=HIV_PhyML_3_100
# Names your job in the cluster queue so you can easily spot it in squeue.

#SBATCH --output=phyml3_%j.out
# Directs normal output (stdout) into this file. 
# '%j' is automatically replaced by SLURM with your unique numeric Job ID (e.g., phyml3_45892.out).

#SBATCH --error=phyml3_%j.err
# Directs any errors or warnings (stderr) into this separate file so you can debug if it crashes.

#SBATCH --nodes=1
# Requests 1 physical server machine (node) from the rack.

#SBATCH --ntasks=1
# Requests 1 independent running program instance (process).

#SBATCH --cpus-per-task=4
# Gives this 1 program 4 CPU processor cores so it can compute branches in parallel.

#SBATCH --mem=8G
# Reserves 8 Gigabytes of RAM on the compute node so the program doesn't run out of memory.

# ==================== SCRIPT EXECUTION ====================
# Stop on errors (Strict Bash safety mode):
set -euo pipefail
# -e: Abort the script immediately if any command fails (returns an error).
# -u: Abort if you accidentally use an undefined/empty variable.
# -o pipefail: If a piped command fails, fail the whole script rather than silently continuing.

# Load the exact module from your cluster:
module load phyml/3.2.0--0
# Pulls PhyML version 3.2.0 out of cluster storage and adds it to your active $PATH.

echo "Job started on $(hostname) at $(date)"
# Prints the exact worker computer name and start timestamp to your log file.

# Run PhyML with exact parameters:
# Note: The backslashes (\) allow a single command to be split across multiple readable lines.
phyml -i MTCT_clean_2.phy \   # -i : Input sequence file (PHYLIP format)
      -d nt \                 # -d : Data type is nucleotide (DNA)
      -m GTR \                # -m : General Time Reversible substitution model
      -v e \                  # -v : Proportion of invariable sites is 'estimated' (not fixed)
      -c 4 \                  # -c : 4 discrete Gamma rate categories for rate variation across sites
      -a e \                  # -a : Gamma shape parameter (alpha) is 'estimated'
      -b 100 \                # -b : 100 non-parametric bootstrap replicates for branch support
      -o tlr                  # -o : Optimize Tree topology (t), branch Lengths (l), and Rate parameters (r)

echo "Job completed successfully at $(date)"
# Prints completion confirmation and finish timestamp.
