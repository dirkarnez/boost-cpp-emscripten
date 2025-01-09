# /bin/bash
export PATH="/emsdk:/emsdk/upstream/emscripten:/emsdk/node/20.18.0_64bit/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

git clone --branch=boost-1.71.0 --depth=1 https://github.com/boostorg/boost /opt/boost && \
cd /opt/boost && \
git submodule update --init --recursive --depth=1 && \
sed -i "s/emcc/em++/g" tools/build/src/tools/emscripten.jam && \
sed -i "s/\$(AROPTIONS) -o /\$(AROPTIONS) -r -o /g" tools/build/src/tools/emscripten.jam && \
sed -i "s/\-L\"\$(LINKPATH)\" -o /-L\"\$(LINKPATH)\" -c -o /g" tools/build/src/tools/emscripten.jam && \
sed -i "s/generators.register/#generators.register/g" tools/build/src/tools/generators/searched-lib-generator.jam && \
./bootstrap.sh \
    --with-libraries="chrono,date_time,filesystem,log,headers,math,program_options,random,regex,system,serialization,thread" \
    --prefix="/build/boost" && \
./b2 toolset=emscripten \
    threading=multi \
    link=static \
    runtime-link=shared \
    cflags="-pthread -O3" \
    cxxflags="-pthread -O3 --std=c++17" \
    linkflags="-s WASM_BIGINT" \
    define=BOOST_BIND_GLOBAL_PLACEHOLDERS \
    install && \
    for f in $(ls /build/boost/lib/libboost*.bc); do emar rcs $(echo $f | sed s/\.bc\$/.a/) $f; rm $f; done

read -p "ad" d

cmake -G"Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_TOOLCHAIN_FILE="/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake" \
    -DBoost_ROOT="/opt/boost" \
    -B./cmake-build && \
    cd cmake-build && \
    cmake --build . && \
    cd ..
cmake -G"Unix Makefiles"  -DCMAKE_BUILD_TYPE=Debug  -DCMAKE_TOOLCHAIN_FILE="/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake"  -DBoost_ROOT="/build/boost"  -DBoost_INCLUDE_DIR="/build/boost/include" -B./cmake-build && cd cmake-build &&  cmake --build . && cd ..