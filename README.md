boost-cpp-emscripten
====================
[emscripten-ports/boost](https://github.com/emscripten-ports/boost)
```
git clone --recurse-submodules -b boost-1.87.0 https://github.com/boostorg/boost.git


 printf "using gcc : emscripten : emcc -s USE_ZLIB=1 -s : <archiver>emar <ranlib>emranlib <linker>emlink <cxxflags>\"-std=c++11 -fPIC\" ;" | tee -a ./project-config.jam >/dev/null
 
 ./b2 -j 8 -q link=static threading=multi address-model=64 toolset=gcc-emscripten variant=release install
 ```
### TODOs
- [Math Toolkit 4.2.1 - 1.87.0](https://www.boost.org/doc/libs/1_87_0/libs/math/doc/html/index.html)

### Tutorials
- [Dockerfile/postgres/Dockerfile at 57a0e0f00bd45736558c30d411c61c687a1ef5e9 · cyclica/Dockerfile](https://github.com/cyclica/Dockerfile/blob/57a0e0f00bd45736558c30d411c61c687a1ef5e9/postgres/Dockerfile#L12)
