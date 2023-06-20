# todo get the alpine linux from outside microsoft store

if (-Not (Test-Path "Alpine.zip")) {
	irm "https://github.com/yuk7/AlpineWSL/releases/download/3.16.0-0/Alpine.zip" -outfile Alpine.zip
	Expand-Archive Alpine.zip
	if (-Not (Test-Path "Alpine.exe")) {
		mv Alpine\Alpine.exe .
	}
	if (-Not (Test-Path "rootfs.tar.gz")) {
		mv Alpine\rootfs.tar.gz .
	}
}
if (Test-Path "Alpine") {
	rm -Recurse -Force "Alpine\*"
	rm -Recurse -Force Alpine
}

$error.clear()
try {
	.\Alpine.exe run "./scripts/info.sh"
}
catch {	"Error occured" }
if (!$error) {
	.\Alpine.exe
	.\Alpine.exe run "./scripts/info.sh"
}
