dwm - dynamic window manager
============================
dwm is an extremely fast, small, and dynamic window manager for X.


Requirements
------------
In order to build dwm you need the Xlib header files.

```
apt-get install -y \
    libx11-dev \
    libx11-xcb-dev \
    libxinerama-dev \
    libxft-dev \
    libxcb-res0-dev
```

Installation
------------
```
git submodule update --recursive
mkdir build
cd build
cmake ..
make package
sudo apt-get install ./dwm-all-in-one*.deb
```

Running dwm
-----------
Add the following line to your .xinitrc to start dwm using startx:

```
dwmblocks &  # Only if installed
exec dwm
```
