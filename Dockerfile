FROM ubuntu:bionic
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
MAINTAINER Julien ARMENGAUD <julien.armengaud@viveris.fr>
LABEL description="Docker with GHDL and CocoTB tools"


#Install packages
RUN 	apt-get update && \
	apt-get install --yes git make python3 python3-pip gnat zlib1g-dev ca-certificates && \
	apt-get clean


# PandA build and install
RUN git clone https://github.com/ghdl/ghdl /tmp/ghdl
RUN	cd /tmp/ghdl && \
	./configure --prefix=/usr/local && \
	make && \
	make install && \
	rm -rf /tmp/ghdl


# CocoTB install
RUN pip3 install cocotb
RUN pip3 install cocotbext-axi


# Workdir
WORKDIR /root


# Start command
CMD bash
