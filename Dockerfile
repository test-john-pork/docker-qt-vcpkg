FROM testjohnpork/docker-qt-vcpkg:0.1.1

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV VCPKG_DISABLE_METRICS=true

WORKDIR /root

RUN set -xe \
&&  export DEBIAN_FRONTEND=noninteractive \
&&  apk add autoconf-archive \
&&  cd /opt/vcpkg \
&&  ./vcpkg install xcb \
&&  ./vcpkg install \
    qtbase[core,vulkan] || ( cat /opt/vcpkg/buildtrees/vulkan-loader/config-x64-linux-* && sleep 10 && false ) \
&&  echo "install qt: OK" 
    # qtbase[core,dnslookup,doubleconversion,egl,fontconfig,freetype,gles2,gles3,gui,harfbuzz,icu,jpeg,network,opengl,openssl,pcre2,png,sql,testlib,thread,vulkan,widgets,xcb,xkb,xlib,xrender,zstd] \
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
