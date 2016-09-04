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
    ldconfig && \
    yum clean all

#Get shadowsocksR
RUN mkdir /data && \
    cd /data && \
    git clone -b manyuser https://github.com/breakwa11/shadowsocks.git

#Setup ENV
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD chacha20
ENV SS_TIMEOUT 300
ENV SS_OBFS http_simple
ENV SS_PROTOCAL auth_sha1_v2

#Run
WORKDIR /data/shadowsocks/shadwosocks
ADD start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["sh", "-c", "/start.sh"]
