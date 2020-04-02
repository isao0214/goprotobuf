FROM golang:1.13.4
MAINTAINER isao0214 <isao0214@gmail.com>
WORKDIR /go
ENV PROTOBUF_VER 3.11.4
RUN apt update \
  && apt install -y --no-install-recommends \
    autoconf \
    automake \
    libtool \
    curl \
    unzip \
  && apt -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOBUF_VER/protobuf-all-$PROTOBUF_VER.tar.gz \
  && tar xzf protobuf-all-$PROTOBUF_VER.tar.gz \
  && rm protobuf-all-$PROTOBUF_VER.tar.gz \
  && cd protobuf-$PROTOBUF_VER \
  && ./configure \
  && make \
  && make check \
  && make install \
  && ldconfig