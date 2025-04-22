## circustent Benchmark for xBGAS

### Overview
The **circustent** benchmark suite is adapted from [the original circustent benchmark](https://github.com/tactcomplabs/circustent.git) to support xBGAS-specific features. It is used to evaluate the performance of the remote atomic memory operations and includes two tests and a variety of simulation configurations to evaluated the xBGAS system. 

### Features
- **Remote Atomic Memory Operations**: Includes tests like atomic add with randon access (`rand_add.c`) and compare-and-swap with striden access (`striden_cas.c`).
- **Integration with SST Simulator**: Uses the Structural Simulation Toolkit (SST) for detailed simulation of memory hierarchies and interconnects.
- **Preconfigurated Parameters**: Includes preconfigurated parameters for the experiments of the SC25 submission. The configurations include various numbers of processing elements (PEs) ranging from 2 to 256. 

### Directory Structure
```
circustent/
├── Makefile                # Build script for the benchmark
├── rand_add.c              # Random access benchmark
├── striden_cas.c           # Strided access benchmark
├── idx1.h                  # Input index for the rand_add benchmark
├── dataset1.h              # Input dataset for the rand_add benchmark
├── genidx.pl               # Perl script for generating the index file (idx1.h)
├── gendata.pl              # Perl script for generating the random-access dataset file (dataset1.h)
├── utils.py                # Python script for parsing the simulation configurations
├── rev-xbgas-ct-topo.py    # Python script for SST simulation with topology
├── config-rand-100ns/      # Configuration files for rand_add with 100ns network latency
├── config-rand-200ns/      # Configuration files for rand_add with 200ns network latency
├── config-striden-100ns/   # Configuration files for striden_cas with 100ns network latency
├── config-striden-200ns/   # Configuration files for striden_cas with 200ns network latency
├── scripts/                # Slurm submission scripts for running benchmarks on HPC
└── results/                # Directory for storing benchmark results
```

### Building the Benchmark
To build the benchmark, navigate to the xBGAS/circustent directory and run:
```
make
```
This will compile the benchmark programs and link them with the xBGAS runtime.

### Running the Benchmark
Submission scripts are available in the `scripts/` directory for batch execution. For example:
```
sbatch scripts/submit4.sh
```
This script will submit an array of jobs for simulations of 4 PEs using `rand_add` and `striden_cas` with 100ns/200ns network latency. 

### Results
Benchmark results are stored in the `results/` directory.