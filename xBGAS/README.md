### Overview
The xBGAS folder contains the `circustent` and `OSU_MicroBenchmarks` benchmarks adapted from the original benchmarks.

### Prerequisites
- **xBGAS C Compiler**: A C compiler ([GCC](https://github.com/Artlands/riscv-gnu-toolchain-xbgas.git)) with support for xBGAS extensions.
- **xBGAS Runtime**: Ensure [the xBGAS runtime library](https://github.com/Artlands/rev-xbgas-runtime.git) is installed and accessible.
- **SST Simulator**: Install [SST](https://sst-simulator.org/) (v 13.1.0) and [REV-xBGAS](https://github.com/Artlands/rev-xbgas.git) for running simulations.
- **Perl (Optional)**: Required if need for generating the input index and dataset in the `circustent` benchmarks.