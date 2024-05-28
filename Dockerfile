FROM ubuntu:20.04
#FROM python:3.8
# Install wget
RUN apt-get update
RUN apt-get install -y wget

# install git
RUN apt-get install -y git

# install https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2?rev=78196d3461ba4c9089a67b5f33edf82a&hash=D484B37FF37D6FC3597EBE2877FB666A41D5253B
# Download https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2?rev=78196d3461ba4c9089a67b5f33edf82a&hash=D484B37FF37D6FC3597EBE2877FB666A41D5253B
RUN wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2?rev=78196d3461ba4c9089a67b5f33edf82a&hash=D484B37FF37D6FC3597EBE2877FB666A41D5253B" -O gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
# print to >> $GITHUB_OUTPUT

#COPY ./gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 .
RUN tar -xjvf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
# add to path
ENV PATH="/gcc-arm-none-eabi-10.3-2021.10/bin:${PATH}"
RUN ls -a
# install python3
RUN apt-get install -y python3-minimal python3-pip

# install pros-cli
RUN python3 -m pip install pros-cli

# check if python3 is installed
RUN python3 --version nocache

# check pros-cli version
RUN pros --version nocache

# check if arm-none-eabi-gcc is installed
RUN arm-none-eabi-g++ --version