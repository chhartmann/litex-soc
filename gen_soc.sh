#!/bin/bash
source ./setup.sh
/opt/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --output-dir $PWD/build --build --no-compile-gateware

(cd app/baremetal; make BUILD_DIR=/root/litex-soc/build SOC_DIRECTORY=/opt/litex/litex/litex/soc)

/opt/litex/litex-boards/litex_boards/targets/sipeed_tang_primer.py --integrated-rom-init=/root/litex-soc/app/baremetal/main.bin --build --no-compile-software
