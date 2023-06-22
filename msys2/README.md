## Intro


## Purpose

Bootstrap ansible on windows with msys2 minimal setup

## TODO

- [ ] msys2 config in general
- [ ] init.ps1
	- [ ] scoop installation
	- [ ] scoop install msys2
	- [ ] pacman update
	- [ ] pacman -S sshpass ansible openssh
- [ ] Setup openssh on windows with this ansible and msys ssh

## Notes

- For creating the init/backup/restore scripts I used these resources
	- https://github.com/agowa/WSL-DistroLauncher-Alpine/issues/2

### Frequently used Commands

```
sudo powershell -File D:\ansible-wininit\init.ps1
dos2unix.exe **/** && dos2unix.exe ** && dos2unix.exe .**
```
