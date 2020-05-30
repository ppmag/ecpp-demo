# BOOST_STACKTRACE_LINK allow different boost's stack tracing libs linking
#add_definitions(-DBOOST_STACKTRACE_LINK=1)  
add_definitions(-DBOOST_STACKTRACE_USE_BACKTRACE=1)

add_library(common
    "${CMAKE_SOURCE_DIR}/include/dummy.hpp"
    dummy.cpp)


target_link_libraries(common PRIVATE ${Boost_LIBRARIES} compiler_options)
target_include_directories(common PUBLIC "${CMAKE_SOURCE_DIR}/include"
                                        ${boost_INCLUDE_DIR}
)

#if(${BP_BUILD_TESTS_COVERAGE})
#    target_compile_options(common PUBLIC -fprofile-arcs -ftest-coverage)
#    target_link_libraries(common PUBLIC gcov)
#endif()

add_executable(app "main.cpp")
add_dependencies(app boost)

target_include_directories(app PRIVATE ${boost_INCLUDE_DIR})
target_link_libraries(app
    PRIVATE ${Boost_LIBRARIES} common compiler_options "-lunwind"
)

#add_clangformat(app)
