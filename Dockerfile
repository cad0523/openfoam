FROM ubuntu:22.04

LABEL maintainer="t_kado <t_kado@hotmail.com>"


# 
RUN apt update \
 && apt install -y \
    git \
    curl \
    gnupg \
 && apt autoremove -y \
 && apt clean \
 && apt autoclean \
 && rm -rf /var/lib/apt/lists/* /root/.[acpw]*


# OpenFOAM
# ENV TZ=Asia/Tokyo
RUN curl -s https://dl.openfoam.com/add-debian-repo.sh | bash \
 && DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Tokyo \ 
    apt install -y \
    openfoam2306-default \
    paraview \
 && apt autoremove -y \
 && apt clean \
 && apt autoclean \
 && rm -rf /var/lib/apt/lists/* /root/.[acpw]* https://dl.openfoam.com/add-debian-repo.sh

# RUN echo "source /usr/lib/openfoam/openfoam2306/etc/bashrc" >> /root/.bashrc

WORKDIR "/home"
