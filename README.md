# ARCHIVE

Hope there doesn't come a time when I have to manage a fleet of windows machines, if I find myself in that hell, here is some rope to hold on to. But I hope by then I can use nix on windows.

## Intro


## Purpose

Bootstrap ansible on windows

## TODO

- [ ] Implement ps1 scripts for various ways of boostrapping ansible on windows
	- [ ] msys2
	- [ ] wsl2
		- [ ] wsl1 (worth?)
		- [ ] Alpine
		- [ ] Ubuntu (As others might've already have ubuntu wsl installed)
	- [ ] vagrant
- [ ] A script which allows choosing what to setup like an ansible_bootstrap.ps1
	- [ ] that script should have a cli option `--no-auto-select`
	      which by default would detect and select in the above order.
	- [ ] cli arg like -u msys2/wsl2/wsl/vagrant
	      or prompt the user

## Notes

- shell history on ubuntu wsl
   -  7  apt install openssh-server
   - 10  mkdir /run/sshd
   - 11  sshd -r
   - 16  apt install net-tools
   - 17  netstat -tuplen

### Frequently used Commands
