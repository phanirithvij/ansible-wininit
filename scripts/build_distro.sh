#!/usr/bin/env sh

apk add make curl libarchive-tools sudo git

git clone https://github.com/yuk7/AlpineWSL

cd AlpineWSL
git apply ../alpine-3.18.2.patch
make -j8
mv Alpine.zip ..
cd ..

rm -rf AlpineWSL
apk del make curl sudo git libarchive-tools
