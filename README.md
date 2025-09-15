boost-cpp-emscripten
====================
- [emscripten-ports/boost](https://github.com/emscripten-ports/boost)
- https://github.com/CaptorAB/quantlib-wasm/blob/master/Dockerfile
  - [React App](https://captorab.github.io/quantlib-wasm-demo/)
- [tee3/boost-build-emscripten: A Boost.Build toolset for Emscripten](https://github.com/tee3/boost-build-emscripten)
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
- [Emscripten:编译的boost库，如何使cmake看到它们？-腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/ask/sof/107453571)
- [使用Cmake编译boost测试-腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/ask/sof/102288582)
- [来自CMake的Emscripten库无法链接-腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/ask/sof/115765329)
- [如何通过Emscripten使用Boost库-腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/ask/sof/2000805)
- [link 和 runtime-link，搭配shared 和 static（转） - ~小小鸟~ - 博客园](https://www.cnblogs.com/happykoukou/p/6992806.html)
- [随手集 信手写: boost 安装(VC 和 mingw)](https://noteonx.blogspot.com/2009/04/boost.html)

### Examples
- https://github.com/werckme/werckmeister/blob/ef6577e9d8e0c4a238911c09c3d56a134f504d9b/cmake/DownloadBoost.cmake#L22
- https://github.com/dpar39/clp-wasm/blob/b95eebdc01270e6494540ba78ee7683079c36afa/Dockerfile#L13
- https://github.com/marcnewlin/uhd.js/blob/192386da475aef0573cc6452d63111dff94f9435/scripts/build-boost.sh#L22
- https://github.com/marcnewlin/uhd.js/blob/192386da475aef0573cc6452d63111dff94f9435/scripts/build-boost.sh#L22
- https://github.com/Victor-Haefner/polyvr-packaging/blob/ffab26ca7ea53b2125effafc8dde549ca82a085d/webassembly/setupOSG.sh#L45
- https://github.com/Victor-Haefner/polyvr-packaging/blob/ffab26ca7ea53b2125effafc8dde549ca82a085d/webassembly/setupOSG.sh#L45
- https://github.com/zebreus/qt-webassembly-boost-docker/blob/a6f8ab4a52a3525075a7ba1512c71933600c75de/Dockerfile#L14
- https://github.com/codeforboston/anypia-js/blob/d4d1d154bae6b97acc619d5588d9a7515d220338/installbuild-emscripten-anypiab-mac.sh#L9
- https://github.com/codeforboston/anypia-js/blob/d4d1d154bae6b97acc619d5588d9a7515d220338/installbuild-emscripten-anypiab-mac.sh#L9
- https://github.com/geohot/solidity/blob/62e64e673775a6296571938d0b671fac09b3e46e/scripts/travis-emscripten/build_emscripten.sh#L69
- https://github.com/tee3/boost-build-emscripten/blob/107b6f7cad0a9d622c8ab83e0936bdcbefec137b/emscripten.rst#L49
- https://github.com/marcnewlin/gnuradio-web/blob/7d1729347b9bf5aa85e3d86856976354be1a7ccf/dockerfiles/boost.dockerfile#L22
- https://github.com/ochafik/openscad-wasm/blob/fb7d65c6787e329bba2f34c344eeffd327990ba0/Dockerfile.base#L4
