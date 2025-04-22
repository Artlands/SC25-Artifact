#!/bin/bash
#SBATCH --job-name=ct_16_sst                         # Job name
#SBATCH --nodes=1                                    # Number of nodes
#SBATCH --ntasks-per-node=16                         # Number of tasks per node
#SBATCH --time=02:00:00                              # Time limit (hh:mm:ss)
#SBATCH --output=../results/ct_16_%A_%a.out          # Standard output log
#SBATCH --partition=nocona                           # Partition to submit to (adjust based on your system)
#SBATCH --array=0-3                                  # Array job indices

export OMPI_MCA_btl_base_warn_component_unused=0
export OMPI_MCA_pml="ob1"
export OMPI_MCA_btl="^openib"
export PMIX_MCA_gds="hash"

# Define an array of simulation configurations
configurations=("config-rand-100ns" "config-rand-200ns" "config-striden-100ns" "config-striden-200ns")

# Select the configuration based on the SLURM_ARRAY_TASK_ID
conf=${configurations[$SLURM_ARRAY_TASK_ID]}

srun -n 1 sst -n 16 ../rev-xbgas-ct-topo.py --model-options="-c ../$conf/sim16.cfg"
