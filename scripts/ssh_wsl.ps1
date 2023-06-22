$wslipv4addr = (.\Alpine.exe run "./scripts/wsl_ipv4.sh")
ssh -p 2022 -o StrictHostKeyChecking=no root@$wslipv4addr
