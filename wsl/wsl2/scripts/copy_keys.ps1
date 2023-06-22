.\Alpine.exe runp cp C:\Users\Rithvij\.ssh\id_rsa ~/.ssh/id_rsa
.\Alpine.exe runp cat C:\Users\Rithvij\.ssh\id_rsa.pub >> ~/.ssh/authorized_keys
#$wslipv4addr = (.\Alpine.exe run "./scripts/wsl_ipv4.sh")
#cat $env:USERPROFILE\.ssh\id_rsa.pub | ssh -p 2022 root@$wslipv4addr "cat >> ~/.ssh/authorized_keys"
#cat $env:USERPROFILE\.ssh\id_rsa.pub | ssh -p 2022 root@$wslipv4addr "cat > ~/.ssh/id_rsa.pub"
#cat $env:USERPROFILE\.ssh\id_rsa     | ssh -p 2022 root@$wslipv4addr "cat > ~/.ssh/id_rsa"
.\Alpine.exe run "./scripts/ssh_keys_copy_hook.sh"
