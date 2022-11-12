FROM ubuntu:22.04

RUN apt-get update && apt-get install -y unzip wget python3 python3-pip git

# sipeed toolchain
ARG TD_NAME=TD_5.0.3_28716_NL
ARG TD_ZIP="${TD_NAME}_Linux.zip"
ADD tang-dynasty-ide/${TD_ZIP} /opt
WORKDIR "/opt"
RUN unzip ${TD_ZIP}
RUN rm *.zip
RUN chmod a+x /opt/${TD_NAME}/bin/td
ADD tang-dynasty-ide/Anlogic_20230606.lic /opt/${TD_NAME}/license/Anlogic.lic
ENV PATH="${PATH}:/opt/${TD_NAME}/bin"
RUN apt-get update && apt-get install -y libgtk2.0-0 libxcb-glx0 libx11-xcb1 libgl1

# litex
RUN mkdir /opt/litex
WORKDIR "/opt/litex"
RUN wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py
RUN chmod +x litex_setup.py
RUN ./litex_setup.py --init --install --tag=2022.08
RUN pip install -U meson
RUN ./litex_setup.py --gcc=riscv
RUN rm *.tar.gz

# for simulation
RUN apt-get update && apt-get install -y libevent-dev libjson-c-dev verilator
WORKDIR /root
