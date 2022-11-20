#!/bin/bash
source ./setup.sh
litex_sim --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --no-compile-gateware

BUILD_PATH=/root/litex-soc/build/sim
SOC_PATH=/opt/litex/litex/litex/soc

if ! grep -Fxq simulation /root/litex-soc/app/build.txt
then
   (cd app/baremetal; make BUILD_DIR=$BUILD_PATH SOC_DIRECTORY=$SOC_PATH clean)
   echo "simulation" > /root/litex-soc/app/build.txt
fi

(cd app/baremetal; make BUILD_DIR=$BUILD_PATH SOC_DIRECTORY=$SOC_PATH)

litex_sim --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --ram-init=/root/litex-soc/app/baremetal/main.bin
