FROM ubuntu:22.04
LABEL MAINTAINER="Julien ARMENGAUD <julien.armengaud@viveris.fr>"
LABEL description="Docker with GHDL and CocoTB tools"

ARG GHDL_VERSION=v4.0.0
ARG VERILATOR_VERSION=v5.022

# Install GHDL dependencies
RUN apt-get update && \
	apt-get install --yes git make python3 python3-pip gnat zlib1g-dev ca-certificates && \
	apt-get clean

# GHDL build and install
RUN git clone https://github.com/ghdl/ghdl /tmp/ghdl
RUN	cd /tmp/ghdl && git checkout ${GHDL_VERSION} && \
	./configure --prefix=/usr/local && \
	make -j 5 && \
	make install && \
	rm -rf /tmp/ghdl

# Install Verilator dependencies
RUN apt-get update && \
	apt-get install --yes git help2man perl python3 make g++ libfl2 libfl-dev zlib1g zlib1g-dev autoconf flex bison && \
	apt-get clean

# Verilator build and install
RUN git clone -b ${VERILATOR_VERSION} https://github.com/verilator/verilator.git /tmp/verilator
RUN	cd /tmp/verilator && \
	autoconf && \
	./configure --prefix=/usr/local && \
	make -j 5 && \
	make install && \
	rm -rf /tmp/verilator

# CocoTB install
RUN pip3 install cocotb
RUN pip3 install cocotbext-axi

# Workdir
WORKDIR /root

# Start command
CMD bash
