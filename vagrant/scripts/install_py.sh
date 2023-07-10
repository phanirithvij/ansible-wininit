#!/bin/bash
is_user_not_root () { [ "${EUID:-$(id -u)}" -ne 0 ]; }

declare -A osInfo;
osInfo[/etc/debian_version]="apt"
osInfo[/etc/alpine-release]="apk"
osInfo[/etc/centos-release]="yum"
osInfo[/etc/fedora-release]="dnf"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done

if is_user_not_root;
then
    exec sudo /bin/bash "$0" "$@"
fi

if [[ $package_manager == "apk" ]]; then
    apk add python3 --no-progress
else
    $package_manager install python3
fi
