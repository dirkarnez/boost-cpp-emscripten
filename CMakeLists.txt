cmake_minimum_required(VERSION 3.18)

# set(CMAKE_CXX_STANDARD 20)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_EXTENSIONS OFF)
# ENV EMSDK=/emsdk PATH=/emsdk:/emsdk/upstream/emscripten:/emsdk/node//bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# set(EMSDK "/emsdk")
# set(EMSDK_NODE_BIN_DIR "${EMSDK}/node/20.18.0_64bit/bin")
# set(EMSDK_NODE_EXECUTABLE "${EMSDK_NODE_BIN_DIR}/node")
# set(EMSDK_PYTHON "${EMSDK}/python/3.9.2-nuget_64bit/python")
# set(JAVA_HOME "${EMSDK}/java/8.152_64bit")
# set(EMSDK_EMSCRIPTEN_DIR "${EMSDK}/upstream/emscripten")
# set(CMAKE_TOOLCHAIN_FILE "${EMSDK_EMSCRIPTEN_DIR}/cmake/Modules/Platform/Emscripten.cmake")
# set(ENV{PATH} "$ENV{PATH};${EMSDK};${EMSDK_EMSCRIPTEN_DIR};${EMSDK_NODE_BIN_DIR};")

project("boost-cpp-emscripten")

find_package(Git)
if(Git_FOUND)
    message("Git found: ${GIT_EXECUTABLE}")
else()
    message(FATAL "Git Not Found")
endif()

find_package(Python)
if(Python_FOUND)
    message("Python found: ${Python_EXECUTABLE}")
else()
    message(FATAL "Python Not Found")
endif()

# if(NOT EXISTS "${EMSDK}")
#     execute_process(COMMAND 
#         ${GIT_EXECUTABLE} clone
#         --recurse-submodules
#         https://github.com/emscripten-core/emsdk.git
#     )
# endif()

# execute_process(COMMAND 
#     ${GIT_EXECUTABLE} 
#     checkout 
#     3.1.56 
#     WORKING_DIRECTORY emsdk
# )

# execute_process(COMMAND 
#     emsdk.bat 
#     "install" 
#     "latest"
#     WORKING_DIRECTORY emsdk
# )

# execute_process(COMMAND 
#     emsdk.bat 
#     "activate" 
#     "latest"
#     WORKING_DIRECTORY emsdk
# )


find_package(Boost REQUIRED)

if(Boost_FOUND)
    message(STATUS "YES")
    # set(Boost_USE_STATIC_LIBS OFF)
    include_directories(${Boost_INCLUDE_DIRS})
else()
    message(STATUS "NO")
endif()

add_executable(${PROJECT_NAME}
    "src/main.cpp"
)

target_link_libraries(${PROJECT_NAME} ${Boost_LIBRARIES})
# target_link_options(${PROJECT_NAME} PRIVATE "-static")

set_target_properties(
    ${PROJECT_NAME}
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/emscripten"
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "--bind -flto -s ALLOW_MEMORY_GROWTH=1 -s MAXIMUM_MEMORY=4GB -s STACK_SIZE=5MB -s EXPORT_NAME=PolyuworldEmscriptenAddonTemplate -s EXPORT_ES6=1 -s MODULARIZE=1 -s ENVIRONMENT=web,worker")
