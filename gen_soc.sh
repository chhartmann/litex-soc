#!/bin/bash
source ./setup.sh
/opt/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --output-dir $PWD/build --build --no-compile-gateware

mkdir -p build_sw
cd build_sw
export SOC_DIRECTORY=/opt/litex/litex/litex/soc
litex_bare_metal_demo --build-path /root/litex-soc/build
cd ~/litex-soc

/opt/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --integrated-rom-init=/root/litex-soc/build_sw/demo.bin --build --no-compile-software
