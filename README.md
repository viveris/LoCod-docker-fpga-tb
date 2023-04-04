# locod-tb-docker : Docker with GHDL and CocoTB

## Description

This repository contains a Dockerfile to make a Docker image with the followings components :

- **GHDL** : an open-source simulator for the VHDL language. GHDL allows to compile and execute VHDL in order to simulate it. GHDL is compatible for co-simulation through several interfaces (VPI, VHPI, etc...)

- **CocoTB** : an open source coroutine-based cosimulation testbench environment for verifying VHDL and SystemVerilog RTL using Python. cocotb interface with the simulator to stimulate the FPGA design from commands written in Python.

In the context of the Locod project, these tools are used to test each component of the global FPGA design and also to allow the automation of these tests in continuous integration.

<br>

## Dependencies

Here are the dependencies installed within the Dockerfile to make these tools working :

`git make python3 python3-pip gnat zlib1g-dev ca-certificates`

<br>

## Run command and usage

Once built, the Docker image can be used to create a container with the following command :

```console
docker create -it --name locod-tb -v ... DOCKER_IMAGE_NAME
```


