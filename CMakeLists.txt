cmake_minimum_required(VERSION 3.5)

project(qml-orientation-demo LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(CLICK "Build project for click packaging" off)

set(PROJECT_NAME "qml-orientation-demo")

if(CLICK)
    set(CMAKE_INSTALL_PREFIX /)
    set(DATA_DIR ${CMAKE_INSTALL_PREFIX})
    set(CMAKE_INSTALL_BINDIR ${CMAKE_INSTALL_PREFIX})
endif()

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

if(ANDROID)
    add_library(qml-orientation-demo SHARED main.cpp qml.qrc)
else()
    add_executable(qml-orientation-demo main.cpp qml.qrc)
    install(TARGETS qml-orientation-demo
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
endif()

target_compile_definitions(qml-orientation-demo
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(qml-orientation-demo
  PRIVATE Qt5::Core Qt5::Quick)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check http://doc.qt.io/qt-5/deployment-android.html for more information.
# These variables must use CACHE, otherwise QtCreator won't see them.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android" CACHE INTERNAL "")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so CACHE INTERNAL "")
#    endif()
#endif()

if(CLICK)
    add_subdirectory(click)
endif()
