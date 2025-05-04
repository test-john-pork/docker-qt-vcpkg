FROM testjohnpork/docker-vcpkg:latest-alpine3.15

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

WORKDIR /root

RUN set -xe \
&&  export DEBIAN_FRONTEND=noninteractive \
    apk update \
&&  apk add --no-cache \
    autoconf automake libtool openssl-dev dpkg zlib-dev libffi-dev zip autoconf libcap zstd-dev \
&&  cd /tmp \
&&  CMAKE_VERSION=3.31.7 \
&&  curl -Lo cmake-$CMAKE_VERSION.tar.gz https://github.com/Kitware/CMake/archive/refs/tags/v$CMAKE_VERSION.tar.gz \
&&  tar -zxvf cmake-$CMAKE_VERSION.tar.gz \
&&  cd CMake-$CMAKE_VERSION \
&&  ./bootstrap \
&&  make -j$(nproc) \
&&  make -j$(nproc) install \
&&  update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force \
&&  cd /tmp \
&&  curl -lo Python-3.13.3.tgz https://www.python.org/ftp/python/3.13.3/Python-3.13.3.tgz \
&&  tar -zxvf Python-3.13.3.tgz \
&&  cd Python-3.13.3 \
&&  ./configure --without-tests \
&&  make -j$(nproc) \
&&  make -j$(nproc) install \
&&  vcpkg install qt

