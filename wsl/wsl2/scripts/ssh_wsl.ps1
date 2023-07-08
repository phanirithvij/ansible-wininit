# $wslipv4addr = (.\Alpine.exe run "./scripts/wsl_ipv4.sh")
$wslipv4addr = $(wsl -d Alpine -- ip -o -4 addr show eth0).split(" ").where({$_ -ne ""})[3].split("/")[0]
ssh -p 2022 -o StrictHostKeyChecking=no root@$wslipv4addr
