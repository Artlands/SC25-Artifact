#!/bin/bash
#SBATCH --job-name=circustent                    # Job name
#SBATCH --nodes=2                                # Number of nodes
#SBATCH --ntasks-per-node=1                      # Number of tasks per node (1 PE per node)
#SBATCH --time=00:10:00                          # Time limit (hh:mm:ss)
#SBATCH --output=./results/circustent_%A_%a.out  # Standard output log
#SBATCH --partition=nocona                       # Partition to submit to (adjust based on your system)
#SBATCH --array=0-1                              # Array job indices

export OMPI_MCA_btl_base_warn_component_unused=0
export OMPI_MCA_pml="ob1"
export OMPI_MCA_btl="^openib"
export PMIX_MCA_gds="hash"

# Define an array of benchmarks
benchmarks=("RAND_ADD" "STRIDE1_CAS")

# Select the benchmarks based on the SLURM_ARRAY_TASK_ID
ben=${benchmarks[$SLURM_ARRAY_TASK_ID]}

srun -n 2 circustent -b $ben -m 16384 -p 2 -i 1000
