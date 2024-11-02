# Guaranteed to work with this. Likely works with earlier versions as well.
# Feel free to try, but I'm not going to.
cmake_minimum_required(VERSION 3.25)
project(dwm VERSION 6.2.3)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED YES)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pedantic -Wall -Os")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DVERSION=${VERSION}")

add_executable(dwm
    src/dwm.c
    src/drw.c
    src/layouts.c
    src/movestack.c
    src/util.c
)

include_directories(dwm
    /usr/X11R6/include
    /usr/include/freetype2
)

target_include_directories(dwm
    PRIVATE
        include
)

target_link_libraries(dwm
    X11
    Xinerama
    fontconfig
    Xft
#    X11-xcb
#    xcb
#    xcb-res
    Xrender
)

add_subdirectory(submodules)

include(PackagingInstructions)
include(CPack)
