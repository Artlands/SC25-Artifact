## Slurm Job Submission Scripts for CircusTent

### Overview
This folder contains a series of slurm job submission scripts for running the CircusTent benchmark to evaluate the performance of the remote atomic memory operations. 

### Running the Benchmark
For example:
```
sbatch submit4.sh
```
This script will submit an array of jobs for running circustent in 4 PEs using `RAND_ADD` and `STRIDE1_CAS` with 16 KB allocated memory and 1000 iterations. 

### Results
Benchmark results are stored in the `results/` directory.