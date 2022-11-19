#!/bin/bash
source ./setup.sh
litex_sim --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --no-compile-gateware

if ! grep -Fxq simulation /root/litex-soc/app/build.txt
then
   (cd app/baremetal; make BUILD_DIR=/root/litex-soc/build/sim SOC_DIRECTORY=/opt/litex/litex/litex/soc clean)
   echo "simulation" > /root/litex-soc/app/build.txt
fi

(cd app/baremetal; make BUILD_DIR=/root/litex-soc/build/sim SOC_DIRECTORY=/opt/litex/litex/litex/soc)

litex_sim --integrated-main-ram-size=0x10000 --cpu-type=vexriscv --ram-init=/root/litex-soc/app/baremetal/main.bin
