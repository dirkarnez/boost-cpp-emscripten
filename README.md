boost-cpp-emscripten
====================
[emscripten-ports/boost](https://github.com/emscripten-ports/boost)
```
git clone --recurse-submodules -b boost-1.87.0 https://github.com/boostorg/boost.git


 printf "using gcc : emscripten : emcc -s USE_ZLIB=1 -s : <archiver>emar <ranlib>emranlib <linker>emlink <cxxflags>\"-std=c++11 -fPIC\" ;" | tee -a ./project-config.jam >/dev/null
 
 ./b2 -j 8 -q link=static threading=multi address-model=64 toolset=gcc-emscripten variant=release install
toolset=emscripten link=static
 ```

### URLs
- https://www.boost.org/doc/libs/1_87_0/boost/math/distributions.hpp

### TODOs
- [Math Toolkit 4.2.1 - 1.87.0](https://www.boost.org/doc/libs/1_87_0/libs/math/doc/html/index.html)
- Study [scipy/boost-headers-only: Boost header directory.](https://github.com/scipy/boost-headers-only)
- Study [ki11roy/header_only_boost: Scripts producing a header only subset of Boost libraries](https://github.com/ki11roy/header_only_boost)

### Tutorials
- [Dockerfile/postgres/Dockerfile at 57a0e0f00bd45736558c30d411c61c687a1ef5e9 · cyclica/Dockerfile](https://github.com/cyclica/Dockerfile/blob/57a0e0f00bd45736558c30d411c61c687a1ef5e9/postgres/Dockerfile#L12)
