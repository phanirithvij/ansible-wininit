## Intro


## Purpose

Bootstrap ansible on windows

## TODO

- [ ] Each of the implementations live in thier own branches?
	- [ ] This is bad, own directories will allow making an install script than own branches
	- [ ] Todo readme per sub dir and remove all the branches
- [ ] Implement ps1 scripts for various ways of boostrapping ansible on windows
	- [ ] msys2
	- [ ] wsl2
		- [ ] wsl1 (worth?)
	- [ ] vagrant
- [ ] A script which allows choosing what to setup like an ansible_bootstrap.ps1
	- [ ] that script should have a cli option `--no-auto-select`
	      which by default would detect and select in the above order.
	- [ ] cli arg like -u msys2/wsl2/wsl/vagrant
	      or prompt the user

## Notes

- [ ] ...

### Frequently used Commands
