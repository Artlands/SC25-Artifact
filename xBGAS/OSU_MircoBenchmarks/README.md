## OSU Micro-Benchmarks for xBGAS

### Overview
The **OSU Micro-Benchmarks (OMB)** for xBGAS are a set of performance tests designed to evaluate the communication and memory access capabilities of systems using the xBGAS (Extended Base Global Address Space) model. These benchmarks are adapted from the original OSU Micro-Benchmarks to support xBGAS-specific features and include tests including get/put latency and get/put message rate (i.e., bandwidth).

### Features
- **Point-to-Point Communication**: Benchmarks for measuring latency and bandwidth between 2 processing elements (PEs).
- **Single-word Transfer vs. Bulk Transfer**: Includes a single-word transfer version (`_seq`, `_seq_mr`) and a bulk transfer version of the `get` operation. 

### Directory Structure
```
OSU_MicroBenchmarks/
├── Makefile                # Build script for the benchmarks
├── osu_oshm_get.c          # Latency benchmark using get
├── osu_oshm_put.c          # Latency benchmark using put
├── osu_oshm_get_mr.c       # Bandwidth benchmark using get
├── osu_oshm_put_mr.c       # Bandwidth benchmark using put
├── osu_oshm_get_seq.c      # Latency benchmark using get (single-word)
├── osu_oshm_get_seq_mr.c   # Bandwidth benchmark using get (single-word)
├── xbgas_osu_utils.c       # Utility file for the benchmark
├── xbgas_osu_utils.h       # Utility header file for the benchmark
├── rev-xbgas-omb-100ns.py  # Python script for SST simulation with 100ns network latency
├── rev-xbgas-omb-200ns.py  # Python script for SST simulation with 200ns network latency
├── scripts/                # Submission scripts for running benchmarks
└── results/                # Directory for storing benchmark results
```

### Building the Benchmark
To build the benchmark, navigate to the xBGAS/OSU_MicroBenchmarks directory and run:
```
make
```
This will compile the benchmark programs and link them with the xBGAS runtime.

### Running the Benchmark
Submission scripts are available in the `scripts/` directory for batch execution. For example:
```
sbatch scripts/submit_all_100ns.sh
```
This script will submit an array of jobs for simulations of all the benchmarks 100ns network latency. 

### Results
Benchmark results are stored in the `results/` directory.