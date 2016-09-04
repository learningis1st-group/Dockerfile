# A Docker File for shadowsocksR
FROM centos:latest
MAINTAINER learningis1st-Group <cyj_sya@protonmail.com>

#Install base tools
RUN yum -y install git wget

#Install libsodium
RUN yum -y groupinstall "Development Tools" && \
    wget https://github.com/jedisct1/libsodium/releases/download/1.0.10/libsodium-1.0.10.tar.gz && \
    tar xf libsodium-1.0.10.tar.gz && cd libsodium-1.0.10 && \
    ./configure && make -j2 && make install && \
    echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf && \
    ldconfig

#Get shadowsocksR
RUN mkdir /data && \
    cd /data
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git

#Setup ENV
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD chacha20
ENV SS_TIMEOUT 300
ENV SS_OBFS
ENV SS_PROTOCAL

#Run
WORKDIR /data/shadowsocks
RUN ulimit -n 512000
RUN python ./server.py -p $SS_SERVER_PORT -k $SS_PASSWORD -m $SS_METHOD -P $SS_PROTOCAL -o $SS_OBFS