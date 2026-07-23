#!/bin/bash

export TOOLCHAIN=/home/$USER/Android/Toolchains/clang

export PATH=$TOOLCHAIN/bin:$TOOLCHAIN/lib:${PATH}
export CLANG_TRIPLE=$TOOLCHAIN/bin/aarch64-linux-gnu-
export CROSS_COMPILE=$TOOLCHAIN/bin/aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=$TOOLCHAIN/bin/arm-linux-gnueabi-
export CC=$TOOLCHAIN/bin/clang
export REAL_CC=$TOOLCHAIN/bin/clang
export LD=$TOOLCHAIN/bin/ld.lld
export AR=$TOOLCHAIN/bin/llvm-ar
export NM=$TOOLCHAIN/bin/llvm-nm
export OBJCOPY=$TOOLCHAIN/bin/llvm-objcopy
export OBJDUMP=$TOOLCHAIN/bin/llvm-objdump
export READELF=$TOOLCHAIN/bin/llvm-readelf
export STRIP=$TOOLCHAIN/bin/llvm-strip
export LLVM=1 && export LLVM_IAS=1
export KALLSYMS_EXTRA_PASS=1
export ARCH=arm64 && export SUBARCH=arm64

rm -rf vmlinux.* drivers/gator_5.27/gator_src_md5.h scripts/dtbtool_exynos/dtbtool arch/arm64/boot/dtb.img arch/arm64/boot/dts/exynos/*dtb*

make exynos9810-starlte_defconfig -j$(nproc --all)
make -j$(nproc --all)
