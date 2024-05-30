# FROM ubuntu:20.04
#FROM python:3.8
FROM frolvlad/alpine-glibc:latest

LABEL version="1.0" \
      description="This is a base image that builds an environment capable of building PROS projects." \
      maintainer="@ABUCKY0 (And LemLib Contributors)"

# ------------
# Install Required Packages
# ------------   
COPY packagelist /packagelist
# RUN apt-get update && apt-get install -y $(cat /packagelist) && apt-get clean
# RUN rm /packagelist # Cleanup Image

RUN apk add --no-cache $(cat packagelist) && rm packagelist
# ------------
# Set Timezone and set frontend to noninteractive
# ------------
# ENV DEBIAN_FRONTEND=noninteractive
# RUN echo "tzdata tzdata/Areas select America" | debconf-set-selections \
#     && echo "tzdata tzdata/Zones/America select Los_Angeles" | debconf-set-selections

# ------------
# Install ARM Toolchain
# ------------
RUN wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2" -O gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
RUN tar -xjvf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
RUN rm gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 # Cleanup Image

ENV PATH="/gcc-arm-none-eabi-10.3-2021.10/bin:${PATH}"

RUN ls -a /gcc-arm-none-eabi-10.3-2021.10/bin
# ------------
# Install PROS CLI
# ------------
ENV PYTHONUNBUFFERED=1
RUN python3 -m pip install pros-cli --break-system-packages

# ------------
# Verify Installation
# ------------

RUN ldd /gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-g++

RUN python3 --version
RUN pros --version
RUN arm-none-eabi-g++ --version
RUN arm-none-eabi-gcc --version

RUN jq --version
RUN git --version
RUN make --version
RUN unzip 
RUN awk --version