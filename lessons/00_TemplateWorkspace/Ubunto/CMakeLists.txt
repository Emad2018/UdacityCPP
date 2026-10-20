cmake_minimum_required(VERSION 3.22.1)

# Set the C++ standard we will use

# set(CMAKE_CXX_STANDARD 20) 
# set(CMAKE_C_COMPILER /usr/bin/gcc-13)
# set(CMAKE_CXX_COMPILER /usr/bin/g++-13) 



project(Foundations)

include_directories(
        ${PROJECT_SOURCE_DIR}/SW/inc/ 
)
file(GLOB all_SRCS
        "${PROJECT_SOURCE_DIR}/SW/inc/*.hpp"
        "${PROJECT_SOURCE_DIR}/SW/src/*.cpp"
        
        ) 
# Add project executable

add_executable(main ${all_SRCS})



