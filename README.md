# litex
This repository is indended to provide an environment to build a SOC with https://github.com/enjoy-digital/litex.
The board used is https://tang.sipeed.com/en/hardware-overview/lichee-tang/

# how to build
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/chhartmann/litex-soc)

* run the container with: ./run_docker_env.sh
* in the container: ./gen_soc.sh

# how to download
* Run locally installed version of Tang Dynasty: td -gui
* In Tang Dynasty: Tools/Download
* To download to RAM, use Mode "JTAG". To Download to Flash, use Mode "PROGRAM FLASH"
* Add the bit-file sipeed_tang_primer.bit located in build/soc/gateware
* Press the Run button

# simulation
* run the container with: ./run_docker_env.sh
* in the container: ./gen_sim.sh

# misc notes
* Download and flashing works over the integrated jtag adapter of the board.
* Serial interface had to be connected to J13 and H13 in my case (even though the serial port is also connected to the on-board jtag interface)

# docker container
The docker container is in a private repository, because it contains the Tang Dynasty IDE from https://dl.sipeed.com/TANG/Premier/IDE.
You can use the dockerfile and create your own container.

# TODOs
* try support of sdcard
* build zephyr
* build own fpga function
* build riscv extension
* automate download from container (with Tang Dynasty or try to get OpenFPGALoader to work, which is intended to be used)

# other related links
* https://github.com/Lichee-Pi/Tang_FPGA_Examples

