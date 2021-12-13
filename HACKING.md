# Dependencies - can be found in meson.build
sudo apt-get install meson gettext appstream-util itstool libglibmm-2.4-dev libgtkmm-3.0-dev libgtop2-dev librsvg2-dev libxml2-dev libsystemd-dev

# Meson

## configure creates the build directory
meson build --prefix /home/

## build - compiles the source
ninja -C build

## install - required to be able to run the application
ninja -C build install

## clean - removes built files to do a clean build
ninja -C build -t clean

## start from scratch
rm -rf build


