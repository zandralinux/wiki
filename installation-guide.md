# Zandra Installation Guide

## Prerequisites

* GNU Binutils with target triplet
* GCC with target triplet
* mk (from [9base](http://tools.suckless.org/9base) or
  [plan9port](https://9fans.github.io/plan9port/))
* [pkgtools](http://git.zandra.xyz/pkgtools)

## Building the base packages

First, it is necessary to configure the build system. To do so, create a
`config.mk` by copying `config.def.mk` and edit it. You can change the target
architecture, compile flags, and more here. Also, check to make sure
`$TOOLCHAIN_TRIPLET` matches your toolchain's naming format.

After this, you can begin the build process:

```
# required definitions for mkbuild
export configmk=$(pwd)/config.mk # in zandra base directory
export mkbuild=$(pwd)/mkbuild # in zandra base directory

# add cross compiler to $PATH (replace /opt/cross/bin if installed somewhere else)
# also make sure your pkgtools installation is in $PATH
export PATH="/opt/cross/bin:$PATH"

mk init # initialize git submodules
mk # build base packages
```

## Installing the packages to a root directory

```
export ROOT="rootdir" # replace with desired path (an existing directory)
mk install
```

## Making a bootable image

If you would like to create an image complete with a bootloader to use in a VM
or put on a USB drive, make sure `/dev/loop0` is not being used on your host
system, and then run `ROOT="rootdir" mk bootable`, replacing "rootdir" with a
path to the root directory used previously.
