#!/bin/bash
#SBATCH --job-name=get_profile                       # Job name
#SBATCH --nodes=2                                    # Number of nodes
#SBATCH --ntasks-per-node=1                          # Number of tasks per node (1 PE per node)
#SBATCH --time=00:05:00                              # Time limit (hh:mm:ss)
#SBATCH --output=./results/get_simple_ucx_%a.out     # Standard output log
#SBATCH --partition=nocona                           # Partition to submit to (adjust based on your system)
#SBATCH --array=0-11                                 # Array indices
#SBATCH --exclusive

# Define the message sizes (in bytes)
MESSAGE_SIZES=(1 4 16 64 256 1024 4096 16384 65536 262144 1048576 2097152)

# Get the message size for this array task
MESSAGE_SIZE=${MESSAGE_SIZES[$SLURM_ARRAY_TASK_ID]}

DEST_DIR=./results

export PRTE_MCA_plm_slurm_disable_warning=true

# Profile with UCX
UCX_PROFILE_MODE=log,accum UCX_PROFILE_FILE=$DEST_DIR/ucx_simple_$MESSAGE_SIZE.prof \
  oshrun -np 2 --map-by ppr:1:node ./oshm_get_simple.exe $MESSAGE_SIZE

ucx_read_profile $DEST_DIR/ucx_simple_$MESSAGE_SIZE.prof > $DEST_DIR/ucx_simple_$MESSAGE_SIZE.txt

rm -f $DEST_DIR/ucx_simple_$MESSAGE_SIZE.prof