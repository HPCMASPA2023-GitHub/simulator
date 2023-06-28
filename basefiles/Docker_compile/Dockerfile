 
FROM ubuntu:22.04

LABEL desc="Batsim simulator made ready"

# get the right repos
USER root
RUN \
    apt-get update && \
    groupadd ccu && \
    groupadd wheel && \
    useradd -d /home/sim -ms /bin/bash sim && \
    usermod -aG wheel sim && \
    usermod -aG ccu sim && \
    echo "sim:sim" | chpasswd && \
    echo "Added sim user" && \
    apt update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata && \
    apt-get install build-essential -y && \
    apt-get install cmake python3 python3-venv python3-pip git-all patch -y

RUN \
    apt-get update && \
    apt-get install -y pkg-config wget gcc g++ libtool texinfo nano && \
    gcc --version
   

RUN \
    apt update && \
    apt-get install apt-transport-https ca-certificates -y && \
    update-ca-certificates 

USER sim

COPY ./boost_1_75_0 /home/sim/Downloads/boost_1_75_0
USER root
RUN \
    chown -R sim:sim /home/sim/Downloads
ARG VERSION=1.0
USER sim
RUN \
    cd /home/sim && \
    git clone https://github.com/HPCMASPA2023-GitHub/simulator.git
RUN \
    cd /home/sim/simulator/basefiles && \
    ./deploy.sh --format bare-metal --prefix /home/sim/simulator --line-number 4

USER root
RUN \
    echo "root:root"| chpasswd 
USER sim
RUN mkdir /home/sim/experiments
USER root
RUN apt-get update && apt-get install iproute2 -y

COPY ./.rootbashrc /root/.bashrc
USER sim
COPY ./.bashrc /home/sim/.bashrc

USER sim
WORKDIR /home/sim/basefiles
CMD ["/bin/bash"]
