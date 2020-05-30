# install boost from sources

include( ExternalProject )

set( boost_URL "https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.bz2" )
set( boost_SHA256 "59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722" )
set( boost_INSTALL ${CMAKE_CURRENT_BINARY_DIR}/third_party/boost )
set( boost_INCLUDE_DIR ${boost_INSTALL}/include )
set( boost_LIB_DIR ${boost_INSTALL}/lib )

ExternalProject_Add( boost
        PREFIX boost
        URL ${boost_URL}
        URL_HASH SHA256=${boost_SHA256}
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND
        ./bootstrap.sh
        --with-libraries=container
        --with-libraries=iostreams
        --with-libraries=stacktrace
        --with-libraries=system
        --with-libraries=test
        --prefix=<INSTALL_DIR>
        BUILD_COMMAND
        ./b2 install link=static variant=debug threading=single runtime-link=static
        INSTALL_COMMAND ""
        INSTALL_DIR ${boost_INSTALL}
        LOG_DOWNLOAD TRUE
        LOG_OUTPUT_ON_FAILURE TRUE
)

set( Boost_LIBRARIES
        ${boost_LIB_DIR}/libboost_container.a
        ${boost_LIB_DIR}/libboost_iostreams.a
        ${boost_LIB_DIR}/libboost_system.a  
#        ${boost_LIB_DIR}/libboost_stacktrace_addr2line.a
## another options for stack traces
#        ${boost_LIB_DIR}/libboost_stacktrace_backtrace.a
#        ${boost_LIB_DIR}/libboost_stacktrace_basic.a
#        ${boost_LIB_DIR}/libboost_stacktrace_noop.a
)

set( Boost_TEST_LIBRARIES
        ${boost_LIB_DIR}/libboost_prg_exec_monitor.a
        ${boost_LIB_DIR}/libboost_test_exec_monitor.a
        ${boost_LIB_DIR}/libboost_unit_test_framework.a  
)

#message( STATUS "Boost static libs: " ${Boost_LIBRARIES} )
