#!/bin/bash
cd
source ~/litex/setup.sh

/opt/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --build

mkdir -p build_sw
cd build_sw
litex_bare_metal_demo --build-path ~/litex/build/sipeed_tang_primer

/opt/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --integrated-rom-init=build_sw/demo.bin --build
