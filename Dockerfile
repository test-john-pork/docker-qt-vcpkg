FROM testjohnpork/docker-qt-vcpkg:0.1.1

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV VCPKG_DISABLE_METRICS=true

WORKDIR /root

RUN set -xe \
&&  export DEBIAN_FRONTEND=noninteractive \
&&  apk add autoconf-archive linux-headers libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev libegl1-mesa-dev \
&&  cd /opt/vcpkg \
&&  ./vcpkg install \
    qtbase[core,dnslookup,doubleconversion,egl,fontconfig,freetype,gles2,gles3,gui,harfbuzz,icu,jpeg,network,opengl,openssl,pcre2,png,sql,testlib,thread,widgets,xcb,xkb,xlib,xrender,zstd] || cat /opt/vcpkg/buildtrees/qtbase/config-x64-linux-* \
&&  echo "install qt: OK" 
    # qt3d \
    # qt5compat \
    # qtcharts \
    # qtcoap \
    # qtconnectivity \
    # qtdatavis3d \
    # qtdeclarative \
    # qtdeviceutilities \
    # qtdoc \
    # qtgraphs \
    # qtgrpc \
    # qthttpserver \
    # qtimageformats \
    # qtinterfaceframework \
    # qtlocation \
    # qtlottie \
    # qtmqtt \
    # qtmultimedia \
    # qtnetworkauth \
    # qtopcua \
    # qtpositioning \
    # qtquick3d \
    # qtquick3dphysics \
    # qtquickeffectmaker \
    # qtquicktimeline \
    # qtremoteobjects \
    # qtscxml \
    # qtsensors \
    # qtserialbus \
    # qtserialport \
    # qtshadertools \
    # qtspeech \
    # qtsvg \
    # qttools \
    # qttranslations \
    # qtvirtualkeyboard \
    # qtwayland \
    # qtwebchannel \
    # qtwebsockets \
    # qtwebview \
