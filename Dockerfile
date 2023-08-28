FROM ubuntu:22.04
RUN apt-get update \
    && apt-get install -y sudo python3-pip lsb-release \
    && pip3 install ansible \
    && useradd -mU --shell /bin/bash nick \
    && usermod -aG sudo nick \
    && echo nick:pass | chpasswd \
    && sed -i "/^%sudo/s/ALL\$/NOPASSWD:ALL/g" /etc/sudoers \
    && su nick
WORKDIR /home/nick