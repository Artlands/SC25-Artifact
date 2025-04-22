## OSU Micro-Benchmarks

### Overview
The **OSU Micro-Benchmarks (OMB)** are a set of performance tests designed to evaluate the communication and memory access capabilities of systems using the OpenSHMEM model. These benchmarks are adapted from the original OSU Micro-Benchmarks and include tests including get/put latency and get/put message rate (i.e., bandwidth).

### Features
- **Point-to-Point Communication**: Benchmarks for measuring latency and bandwidth between 2 processing elements (PEs).

### Directory Structure
```
OSU_MicroBenchmarks/
├── Makefile                # Build script for the benchmarks
├── osu_oshm_get.c          # Latency benchmark using get
├── osu_oshm_put.c          # Latency benchmark using put
├── osu_oshm_get_mr.c       # Bandwidth benchmark using get
├── osu_oshm_put_mr.c       # Bandwidth benchmark using put
├── osu_utils.c             # Utility file for the benchmark
├── osu_utils.h             # Utility header file for the benchmark
├── submit_all.sh           # Submission script for running benchmarks
└── results/                # Directory for storing benchmark results
```

### Building the Benchmark
To build the benchmark, navigate to the OpenSHMEM-baseline/OSU_MicroBenchmarks directory and run:
```
make
```
This will compile the benchmark programs and link them with the OpenSHMEM runtime.

### Running the Benchmark
Run the following slurm job submission script to run the benchmark on a HPC system:
```
sbatch submit_all.sh
```

### Results
Benchmark results are stored in the `results/` directory.