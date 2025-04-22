#!/bin/bash
#SBATCH --job-name=omb_xbga_200ns                      # Job name
#SBATCH --nodes=1                                      # Number of nodes
#SBATCH --ntasks-per-node=2                            # Number of tasks per node (2 PE per node)
#SBATCH --time=5:00:00                                 # Time limit (hh:mm:ss)
#SBATCH --output=../results/omb_xbgas_200ns_%A_%a.out  # Standard output log (%j expands to job ID)
#SBATCH --partition=nocona                             # Partition to submit to (adjust based on your system)
#SBATCH --array=0-5                                    # Array job indices (adjust based on the number of applications)

export OMPI_MCA_btl_base_warn_component_unused=0
export OMPI_MCA_pml="ob1"
export OMPI_MCA_btl="^openib"
export PMIX_MCA_gds="hash"

# Define an array of application executables
applications=("osu_oshm_get.exe" "osu_oshm_put.exe" "osu_oshm_get_mr.exe" "osu_oshm_put_mr.exe" "osu_oshm_get_seq.exe" "osu_oshm_get_seq_mr.exe")

# Select the application based on the SLURM_ARRAY_TASK_ID
app=${applications[$SLURM_ARRAY_TASK_ID]}

srun -n 1 sst -n 2 ../rev-xbgas-omb-200ns.py --model-options="../$app 2"
