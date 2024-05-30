# PROS Build Container
[![Docker Image CI](https://github.com/ABUCKY0/pros-build-container/actions/workflows/docker-image.yml/badge.svg)](https://github.com/ABUCKY0/pros-build-container/actions/workflows/docker-image.yml)

A Base Container that builds everything required for [PROS-Build](https://github.com/ABUCKY0/pros-build)

Installs the following packages:

- jq (Command-Line JSON Parser)
- wget (Used to Download the ARM Toolchain)
- git (Git Client, Used to retrieve the short SHA of a push/pr)
- gawk (Scripting Language, used to extract certain lines from the Makefile)
- python3-minimal (Minimal Install of Python, used for PROS)
- python3-pip (PIP is used to install PROS)
- unzip (Used to Unzip the template)

Also installs the following:

- pros-cli (Python)
- arm-none-eabi toolchain (From https://developer.arm.com)