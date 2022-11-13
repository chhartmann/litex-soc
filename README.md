# litex
This repository is indended to provide an environment to build a SOC with https://github.com/enjoy-digital/litex.
The board used is https://tang.sipeed.com/en/hardware-overview/lichee-tang/

# how to use
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/chhartmann/litex-soc)

* run the container with: ./run_docker_env.sh
* in the container: ./gen_soc.sh

# docker container
The docker container is in a private repository, because it contains the Tang Dynasty IDE from https://dl.sipeed.com/TANG/Premier/IDE.
You can use the dockerfile and create your own container.

# TODOs
* optimize build (currently generation is executed twice)
* describe how to download and flash
* describe how to use simulation and add script (like in https://github.com/enjoy-digital/litex/wiki/SoC-Simulator)
* build zephyr
* setup github action

# other related links
* https://github.com/Lichee-Pi/Tang_FPGA_Examples

