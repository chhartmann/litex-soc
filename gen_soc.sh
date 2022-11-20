#!/bin/bash
source ./setup.sh

export PYTHONPATH="$PYTHONPATH:/root/litex-soc/board"

BUILD_PATH=/root/litex-soc/build/soc
SOC_PATH=/opt/litex/litex/litex/soc

/root/litex-soc/board/sipeed_tang_primer_target.py --output-dir $BUILD_PATH --build --no-compile-gateware #--with-sdcard

if ! grep -Fxq target /root/litex-soc/app/build.txt
then
   (cd app/baremetal; make BUILD_DIR=$BUILD_PATH SOC_DIRECTORY=$SOC_PATH clean)
   echo "target" > /root/litex-soc/app/build.txt
fi

(cd app/baremetal; make BUILD_DIR=$BUILD_PATH SOC_DIRECTORY=$SOC_PATH)

/root/litex-soc/board/sipeed_tang_primer_target.py --output-dir $BUILD_PATH --integrated-rom-init=/root/litex-soc/app/baremetal/main.bin --build --no-compile-software #--with-sdcard
