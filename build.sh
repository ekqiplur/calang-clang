#!/bin/bash
set -e

# Rename hasil extract
mv clang slim-clang
cd slim-clang

# Bersihkan file tidak penting
rm -rf libexec/ share/ source.properties ndk-metadata
find bin -type f -exec strip --strip-unneeded {} \; || true
find lib -name '*.a' -delete || true