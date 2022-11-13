#!/bin/bash
source ./setup.sh
/opt/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --build --output-dir $PWD/build

mkdir -p build_sw
cd build_sw
export SOC_DIRECTORY=/opt/litex/litex/litex/soc
litex_bare_metal_demo --build-path /root/litex-soc/build

/opt/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --integrated-rom-init=/root/litex-soc/build_sw/demo.bin --build

cd ~/litex-soc