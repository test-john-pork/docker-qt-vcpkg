FROM alpine:3.21.3

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV VCPKG_DISABLE_METRICS=true

WORKDIR /root

RUN set -xe \
&&  export DEBIAN_FRONTEND=noninteractive \
    apk update \
&&  apk add --no-cache \
    git clang autoconf automake libtool openssl-dev dpkg zlib-dev libffi-dev zip autoconf libcap zstd-dev python3 cmake curl make bash \
&&  cd /opt \
&&  git clone -b v1.12.1 https://github.com/ninja-build/ninja.git \
&&  cd ninja \
&&  cmake -Bbuild-cmake \
&&  cmake --build build-cmake \
&&  update-alternatives --install /usr/bin/ninja ninja /opt/ninja/build-cmake/ninja 1 --force \
&&  cd /opt \
&&  git clone -b 2025.04.09 https://github.com/microsoft/vcpkg.git \
&&  cd vcpkg \
&&  CC=clang \
&&  CXX=clang++ \
&&  ./bootstrap-vcpkg.sh \
&&  ./vcpkg install \
    qt3d \
    qt5compat \
    qtbase \
    qtcharts \
    qtcoap \
    qtconnectivity \
    qtdatavis3d \
    qtdeclarative \
    qtdeviceutilities \
    qtdoc \
    qtgraphs \
    qtgrpc \
    qthttpserver \
    qtimageformats \
    qtinterfaceframework \
    qtlanguageserver \
    qtlocation \
    qtlottie \
    qtmqtt \
    qtmultimedia \
    qtnetworkauth \
    qtopcua \
    qtpositioning \
    qtquick3d \
    qtquick3dphysics \
    qtquickeffectmaker \
    qtquicktimeline \
    qtremoteobjects \
    qtscxml \
    qtsensors \
    qtserialbus \
    qtserialport \
    qtshadertools \
    qtspeech \
    qtsvg \
    qttools \
    qttranslations \
    qtvirtualkeyboard \
    qtwayland \
    qtwebchannel \
    qtwebsockets \
    qtwebview \
&&  echo "install qt: OK"
