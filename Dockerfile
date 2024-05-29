FROM ubuntu:20.04
#FROM python:3.8


LABEL version="1.0" \
      description="This is a base image that builds an environment capable of building PROS projects." \
      maintainer="@ABUCKY0 (And LemLib Contributors)"

# Avoid timezone prompt during package installation
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "tzdata tzdata/Areas select America" | debconf-set-selections \
    && echo "tzdata tzdata/Zones/America select Los_Angeles" | debconf-set-selections


# Install wget
RUN apt-get update
RUN apt-get install -y wget git gawk

# install https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2?rev=78196d3461ba4c9089a67b5f33edf82a&hash=D484B37FF37D6FC3597EBE2877FB666A41D5253B
# Download https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2?rev=78196d3461ba4c9089a67b5f33edf82a&hash=D484B37FF37D6FC3597EBE2877FB666A41D5253B
RUN wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2?rev=78196d3461ba4c9089a67b5f33edf82a&hash=D484B37FF37D6FC3597EBE2877FB666A41D5253B" -O gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2

#COPY ./gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 .
RUN tar -xjvf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
# add to path
ENV PATH="/gcc-arm-none-eabi-10.3-2021.10/bin:${PATH}"
RUN ls -a
# install python3
RUN apt-get install -y python3-minimal python3-pip

# install unzip
RUN apt-get install -y unzip
# install pros-cli
RUN python3 -m pip install pros-cli

# check if python3 is installed
RUN python3 --version nocache

# check pros-cli version
RUN pros --version nocache

# check if arm-none-eabi-gcc is installed
RUN arm-none-eabi-g++ --version