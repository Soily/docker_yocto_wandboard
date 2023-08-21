# ubuntu-22.04-base
# Copyright (C) 2020-2021 Intel Corporation
# Copyright (C) 2022 Konsulko Group
#
# SPDX-License-Identifier: GPL-2.0-only
#

FROM ubuntu:22.04

# gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect 
# xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit 
# mesa-common-dev zstd liblz4-tool file locales

ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"

# LABEL about the custom image
LABEL maintainer="crymeariver33@gmail.com"
LABEL version="0.1"
LABEL description="This is a custom Docker Image for Yocto Build Environment based on Ubuntu 22.04"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install \
    wget \
    git \
    diffstat \
    unzip \
    sysstat \
    texinfo \
    gcc \
    build-essential \
    chrpath \
    socat \
    python2 \
    python-is-python3 \
    python3 \
    python3-pip \
    python3-pexpect \
    xz-utils  \
    debianutils \
    locales \
    cpio \
    screen \
    tmux \
    sudo \
    iputils-ping \
    python3-git \
    python3-jinja2 \
    libegl1-mesa \
    libsdl1.2-dev \
    python3-subunit \
    mesa-common-dev \
    xterm \
    iproute2 \
    fluxbox \
    tightvncserver \
    lz4 \
    zstd \
    liblz4-tool \
    file \
    nano \
    curl \
    gawk


ENV TITTEN = "Dies ist ein Titten-Beispiel!"

RUN useradd -U -m yocto_user && \
    /usr/sbin/locale-gen en_US.UTF-8

RUN echo "yocto_user:root" | chpasswd
RUN usermod -aG sudo yocto_user

RUN mkdir /home/yocto_user/bin
RUN curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /home/yocto_user/bin/repo
RUN chmod a+x /home/yocto_user/bin/repo
RUN chown -R yocto_user:yocto_user /home/yocto_user/bin
RUN PATH=${PATH}:/home/yocto_user/bin

RUN mkdir /home/yocto_user/edm_yocto
RUN chmod a+x /home/yocto_user/edm_yocto
RUN chown -R yocto_user:yocto_user /home/yocto_user/edm_yocto

RUN whoami

WORKDIR /home/yocto_user/edm_yocto

RUN git config --global user.mail "crymeariver33@gmail.com"
RUN git config --global user.name "Paddy Freethinker"

RUN ./../bin/repo init -u https://github.com/TechNexion/tn-imx-yocto-manifest.git -b kirkstone_5.15.y-stable -m imx-5.15.71-2.2.0.xml
RUN ./../bin/repo sync -j8

RUN chown -R yocto_user:yocto_user /home/yocto_user/edm_yocto
# RUN DISPLAY=hdmi WIFI_FIRMWARE=y WIFI_MODULE=qca DISTRO=fsl-imx-wayland MACHINE=wandboard-imx6 source tn-setup-release.sh -b build-wayland-wandboard-imx6

USER yocto_user
CMD /bin/bash