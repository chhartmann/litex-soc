#!/bin/bash
source ./setup.sh
litex_sim --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --no-compile-gateware

mkdir -p build_sw
cd build_sw
export SOC_DIRECTORY=/opt/litex/litex/litex/soc
litex_bare_metal_demo --build-path /root/litex-soc/build/sim
cd ~/litex-soc

litex_sim --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --ram-init=/root/litex-soc/build_sw/demo.bin