#!/bin/bash
source ./setup.sh
litex_sim --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --no-compile-gateware

(cd app/baremetal; make BUILD_DIR=/root/litex-soc/build/sim SOC_DIRECTORY=/opt/litex/litex/litex/soc)

litex_sim --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --ram-init=/root/litex-soc/app/baremetal/main.bin