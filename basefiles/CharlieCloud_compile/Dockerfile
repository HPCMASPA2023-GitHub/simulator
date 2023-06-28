 
FROM ubuntu:22.04

LABEL desc="Batsim simulator made ready"

# get the right repos
USER root
RUN \
    apt-get update && \
    apt update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata && \
    apt-get install build-essential -y && \
    apt-get install cmake python3 python3-venv python3-pip git-all patch -y

RUN \
    apt-get update && \
    apt-get install -y pkg-config wget gcc g++ libtool texinfo nano iproute2
   

RUN \
    apt update && \
    apt-get install apt-transport-https ca-certificates -y && \
    update-ca-certificates 

RUN \
    mkdir -p /home/sim

COPY ./boost_1_75_0 /home/sim/Downloads/boost_1_75_0
USER root
RUN \
    chmod -R 777 /home/sim/Downloads/boost_1_75_0
ARG VERSION=1.0
USER sim
RUN \
    cd /home/sim && \
    git clone https://github.com/HPCMASPA2023-GitHub/simulator.git
RUN \
    cd /home/sim/basefiles && \
    export HOME=/home/sim && \
    ./deploy.sh --format bare-metal --prefix /home/sim --line-number 4
#RUN \
#    cd /home/sim/basefiles && \
#    export GOROOT=/home/sim/Downloads/go && \
#    export GOBIN=/home/sim/Install/bin && \
#    export GO111MODULE=on && \
#    export GOPATH=/home/sim/Downloads/go && \
#    export HOME=/home/sim && \
#    /home/sim/Install/bin/go install -v framagit.org/batsim/batexpe/cmd/robin@latest

RUN mkdir -p /home/sim/experiments


COPY ./.rootbashrc /root/.bashrc
USER sim
COPY ./.bashrc /home/sim/.bashrc

USER sim
WORKDIR /home/sim/basefiles
CMD ["/bin/bash"]
