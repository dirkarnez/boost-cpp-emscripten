# /bin/bash
cmake -G"Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_TOOLCHAIN_FILE="/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake" \
    -B./cmake-build && \
    cd cmake-build && \
    cmake --build . && \
    cd .. 