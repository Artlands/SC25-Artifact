## Get Profiling

### Overview
This folder contains the source code and the job submission script for profiling the *get* operation in OpenSHMEM.

### Directory Structure
```
OSU_MicroBenchmarks/
├── Makefile                # Build script
├── oshm_get_simple.c       # Get operation
├── submit_get_ucx_prof.sh  # Submission script for running the get
└── results/                # Directory for storing benchmark and profiling results
```

### Building the Benchmark
To build the benchmark, navigate to the OpenSHMEM-baseline/communication_overhead directory and run:
```
make
```
This will compile the benchmark program and link it with the OpenSHMEM runtime.

### Running the Benchmark
Run the following slurm job submission script to run the benchmark on a HPC system:
```
sbatch submit_get_ucx_prof.sh
```


### Results
Benchmark abd profiling results are stored in the `results/` directory.