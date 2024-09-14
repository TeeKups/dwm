set(CPACK_PACKAGE_VERSION ${VERSION})
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE amd64)
set(CPACK_DEBIAN_PACKAGE_MAINTAINER juhani@jkupiainen.fi)

set(CPACK_DEBIAN_PACKAGE_SECTION x11)
set(CPACK_DEBIAN_ARCHIVE_TYPE gnutar)
set(CPACK_DEBIAN_COMPRESSION_TYPE gzip)

# Generate .deb only
set(CPACK_GENERATOR DEB)
set(CPACK_DEB_COMPONENT_INSTALL ON)
set(CPACK_COMPONENTS_GROUPING ONE_PER_GROUP)
set(CPACK_COMPONENTS_ALL "dwm-all-in-one;dwm;dwmblocks;dmenu")

# ALL -metapackage
set(CPACK_DEBIAN_DWM-ALL-IN-ONE_PACKAGE_NAME dwm-all-in-one)
set(CPACK_DEBIAN_DWM-ALL-IN-ONE_PACKAGE_DESCRIPTION "Dynamic Window Manager (DWM) All-in-One installer")
set(CPACK_DEBIAN_DWM-ALL-IN-ONE_PACKAGE_DEPENDS dwm dmenu dwmblocks)
set(CPACK_DEBIAN_DWM-ALL-IN-ONE_FILE_NAME DEB-DEFAULT)

# DWM
set(CPACK_PACKAGE_NAME dwm)
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "Dynamic Window Manager (DWM)")
set(CPACK_DEBIAN_DWM_PACKAGE_NAME ${CPACK_PACKAGE_NAME})
set(CPACK_DEBIAN_DWM_PACKAGE_DESCRIPTION ${CPACK_DEBIAN_PACKAGE_DESCRIPTION})
set(CPACK_DEBIAN_DWM_FILE_NAME DEB-DEFAULT)

string(CONCAT DEPENDENCIES
    "xorg, "
    "libxinerama1, "
    "fontconfig, "
    "libxft2, "
    "libx11-xcb1, "
    "libxcb-res0, "
    "libxrender1"
)
set(CPACK_DEBIAN_PACKAGE_DEPENDS ${DEPENDENCIES})
set(CPACK_DEBIAN_DWM_PACKAGE_DEPENDS ${CPACK_DEBIAN_PACKAGE_DEPENDS})

string(CONCAT RECOMMENDS
    "kitty, "
    "dmenu, "
    "dwmblocks, "
    "xclip"
)
set(CPACK_DEBIAN_PACKAGE_RECOMMENDS ${RECOMMENDS})
set(CPACK_DEBIAN_DWM_PACKAGE_RECOMMENDS ${CPACK_DEBIAN_PACKAGE_RECOMMENDS})

install(
    TARGETS
        dwm
    DESTINATION /usr/local/bin/
    COMPONENT dwm
)

install(
    FILES
        man/dwm.1
    DESTINATION /usr/local/man1/
    COMPONENT dwm
)

# DMENU
set(CPACK_DEBIAN_DMENU_PACKAGE_NAME dmenu)
set(CPACK_DEBIAN_DMENU_FILE_NAME DEB-DEFAULT)
install(
    TARGETS
        dmenu
        stest
    DESTINATION /usr/local/bin/
    COMPONENT dmenu
)
install(
    FILES
        submodules/dmenu/man/dmenu.1
        submodules/dmenu/man/stest.1
    DESTINATION /usr/local/man1/
    COMPONENT dmenu
)
install(
    PROGRAMS
        submodules/dmenu/packaging/dmenu_path
        submodules/dmenu/packaging/dmenu_run
    DESTINATION /usr/local/bin/
    COMPONENT dmenu
)
string(CONCAT DEPENDENCIES
    "xorg, "
    "libxinerama1, "
    "fontconfig, "
    "libxft2"
)
set(CPACK_DEBIAN_DMENU_PACKAGE_DEPENDS ${DEPENDENCIES})
string(CONCAT RECOMMENDS
    "dwm"
)
set(CPACK_DEBIAN_DMENU_PACKAGE_RECOMMENDS ${RECOMMENDS})

# DWMBLOCKS
set(CPACK_DEBIAN_DWMBLOCKS_PACKAGE_NAME dwmblocks)
set(CPACK_DEBIAN_DWMBLOCKS_FILE_NAME DEB-DEFAULT)
install(
    TARGETS
        dwmblocks
    DESTINATION /usr/local/bin/
    COMPONENT dwmblocks
)
set(CPACK_DEBIAN_DWMBLOCKS_PACKAGE_DEPENDS dwm)
