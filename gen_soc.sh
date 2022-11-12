#!/bin/bash
cd /workspace/litex-soc
source setup.sh

~/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --build

mkdir -p build_sw
cd build_sw
litex_bare_metal_demo --build-path /workspace/litex-soc/build/sipeed_tang_primer

~/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --integrated-rom-init=build_sw/demo.bin --build
