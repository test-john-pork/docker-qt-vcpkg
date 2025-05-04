FROM alpine:3.21.3

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV VCPKG_DISABLE_METRICS=true

WORKDIR /root

RUN set -xe \
&&  export DEBIAN_FRONTEND=noninteractive \
    apk update \
&&  apk add --no-cache \
    git clang autoconf automake libtool openssl-dev dpkg zlib-dev libffi-dev zip autoconf libcap zstd-dev python3 cmake curl \
&&  cd /opt \
&&  git clone -b 2025.04.09 https://github.com/microsoft/vcpkg.git \
&&  cd vcpkg \
&&  CC=clang \
&&  CXX=clang++ \
&&  ./bootstrap-vcpkg.sh \
&&  ./vcpkg install qt \
&&  echo "install qt: OK"
