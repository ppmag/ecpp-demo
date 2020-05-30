cmake_minimum_required(VERSION 3.14)
project(ecpp-demo VERSION 0.0.1 LANGUAGES CXX)

# Verbose is usefull for cmakefile debugging
#set(CMAKE_VERBOSE_MAKEFILE ON)

include("cmake/StandardProjectSettings.cmake")
include("CMakeDependentOption")

include("cmake/compiler.cmake")
#include("cmake/clangformat.cmake")
include("cmake/StaticAnalyzers.cmake")
include("cmake/boost.cmake")

#include("cmake/conan.cmake")
#run_conan()

add_subdirectory(src)

#if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
#    include(CTest)
#endif()

#if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME AND BUILD_TESTING)
#    add_subdirectory(test)
#endif()