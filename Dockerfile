FROM testjohnpork/docker-qt-vcpkg:0.1.1

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV VCPKG_DISABLE_METRICS=true

WORKDIR /root

RUN set -xe \
&&  export DEBIAN_FRONTEND=noninteractive \
&&  cd /opt/vcpkg \
&&  CC=clang \
&&  CXX=clang++ \
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
