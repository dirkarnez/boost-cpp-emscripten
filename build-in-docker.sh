# /bin/bash
export PATH="/emsdk:/emsdk/upstream/emscripten:/emsdk/node/22.16.0_64bit/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

function announce () {
    echo "##########################################################################################"
    echo "##############################  $*  #################################"
    echo "##########################################################################################"
}

# ./bootstrap.sh \
#     --with-libraries="chrono,date_time,filesystem,log,headers,math,program_options,random,regex,system,serialization,thread" \
#     --prefix="/build/boost" && \
# /emsdk/upstream/emscripten/cache/sysroot/usr
# --prefix="/build/boost" && \

# https://stackoverflow.com/questions/15724357/using-boost-with-emscripten/60550627#60550627
cd /tmp && \
wget -c https://archives.boost.io/release/1.86.0/source/boost_1_86_0.tar.bz2 && \
    mkdir /boost && \
    tar --bzip2 -xf boost_1_86_0.tar.bz2 -C /boost --strip-components=1 && \
    rm -f boost_1_86_0.tar.bz2 && \
    rm -rf /boost/doc && \
cd /boost && \ 
mkdir -pv /boost/lib/emscripten && \
./bootstrap.sh && \
rm -rf stage && \
emconfigure ./b2 -a -j8 toolset=emscripten \
    link=static \
    variant=release \
    threading=single \
    variant=release --with-math --with-random stage \
	--prefix=/boost/lib/emscripten --build-dir=./build install && \
 rm -rf ./build && \
cmake -G"Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE="/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake" \
    -DBoost_ROOT="/boost" \
    -DBoost_INCLUDE_DIR="/boost" \
    -DBOOST_HAS_PTHREADS=ON \
    -B./cmake-build && \
    cd cmake-build && \
    cmake --build . && \
    announce "cmake completed"
