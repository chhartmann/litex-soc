#!/bin/bash
source ./setup.sh

export PYTHONPATH="$PYTHONPATH:/root/litex-soc/board"
/root/litex-soc/board/sipeed_tang_primer_target.py --output-dir /root/litex-soc/build --build --no-compile-gateware #--with-sdcard

if ! grep -Fxq target /root/litex-soc/app/build.txt
then
   (cd app/baremetal; make BUILD_DIR=/root/litex-soc/build SOC_DIRECTORY=/opt/litex/litex/litex/soc clean)
   echo "target" > /root/litex-soc/app/build.txt
fi

(cd app/baremetal; make BUILD_DIR=/root/litex-soc/build SOC_DIRECTORY=/opt/litex/litex/litex/soc)

/root/litex-soc/board/sipeed_tang_primer_target.py --integrated-rom-init=/root/litex-soc/app/baremetal/main.bin --build --no-compile-software #--with-sdcard
