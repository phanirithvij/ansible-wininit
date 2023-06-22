#!/usr/bin/env sh

apk add make curl libarchive-tools sudo git

git clone https://github.com/yuk7/AlpineWSL

patchver="3.18.2"

cd AlpineWSL
git apply ../alpine-$patchver.patch
make -j8
mv Alpine.zip ..
echo "Alpine.zip now has alpine wsl distro $patchver"
cd ..

rm -rf AlpineWSL
apk del make curl sudo git libarchive-tools
