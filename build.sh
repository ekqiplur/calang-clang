#!/bin/bash
set -e

mv clang slim-clang
cd slim-clang

# Hapus file besar yang tidak wajib untuk compiling kernel
rm -rf libexec/ share/ source.properties ndk-metadata
rm -f lib64/libclang*.so*         # clang-cpp, libclang
rm -f lib64/liblldb*              # debugger
rm -f bin/clang-check             # tool helper
rm -f bin/lld                     # optional
rm -f bin/clang-14                # kita bisa pakai symlink `clang`

# Strip semua binary jika bisa
find bin -type f -exec strip --strip-unneeded {} \; || true
find lib -name '*.a' -delete || true