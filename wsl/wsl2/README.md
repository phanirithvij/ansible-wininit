## Intro


## Purpose

Bootstrap ansible on windows with wsl with a minimal alpine linux setup

## TODO

- [x] Get an alpine wsl distro which is available for installation from outside microsoft store
	- As of now using `agowa/WSL-DistroLauncher-Alpine` which can only be installed from microsoft store
	- [ ] See https://wsldl-pg.github.io/docs/Using-wsldl/#distros
		- [x] https://github.com/yuk7/AlpineWSL
			- Seems kind of abandoned and is still at alpine 3.16
			- I locally patched to update alpine to the latest version

## Notes

- For creating the init/backup/restore scripts I used these resources
	- https://github.com/agowa/WSL-DistroLauncher-Alpine/issues/2

### Frequently used Commands

```
killall sshd; sshd -r

powershell -File .\destroy.ps1
sudo powershell -File .\init.ps1

powershell -File D:\ansible-wininit\destroy.ps1
sudo powershell -File D:\ansible-wininit\init.ps1

.\Alpine.exe run "./scripts/wsl_ipv4.sh"

dos2unix.exe **/** && dos2unix.exe ** && dos2unix.exe .**

# https://github.com/yuk7/wsldl#how-to-import

.\Alpine.exe backup --vhdxgz
```
