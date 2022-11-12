#!/bin/bash

# for sipeed anlogic tool
export PATH="${PATH}:/home/gitpod/TD_5.0.3_28716_NL/bin"

# for cross compiler
export PATH="${PATH}:/home/gitpod/litex/riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14/bin"

# for litex
directories=(litedram liteeth liteiclink litepcie litesata litescope litevideo litex litex-boards litex-renode migen nmigen pythondata-cpu-vexriscv pythondata-software-compiler_rt pythondata-software-picolibc)

for directory in "${directories[@]}";
do
    export PYTHONPATH="$PYTHONPATH:/home/gitpod/litex/$directory"
done