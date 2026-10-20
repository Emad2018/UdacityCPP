cmake_minimum_required(VERSION 3.22.1)

# Force the final executable to be placed in the project root's "output" folder
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/output")

# Ensure Release builds also put the executable in the exact same spot (ignoring subfolders)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_SOURCE_DIR}/output")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_SOURCE_DIR}/output")

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

project(Foundations)

include_directories(
        ${PROJECT_SOURCE_DIR}/SW/inc/ 
)
file(GLOB all_SRCS
        "${PROJECT_SOURCE_DIR}/SW/inc/*.hpp"
        "${PROJECT_SOURCE_DIR}/SW/src/*.cpp"
        
        ) 
# Add project executable

add_executable(Main ${all_SRCS})



