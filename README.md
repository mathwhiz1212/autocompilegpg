# simpleautocompilegpg
Simple script that automatically downloads, verifies and compiles GnuPG. 

This script installs GnuPG-1.4.19 or upgrades current version to GnuPG-1.4.19.

The goal of this script is to upgrade all of the GnuPG V.1.* to V.1.4.19 as there are many vulnerable versions floating around, even the last version is vulnerable.

Currently this script requires: A debian based linux distro, A working internet connection, firefox or a firefox port that will start with the command firefox url and gpg or sha1sum.

Please import my public key (key.txt) and verify the .sh file with the signature. e.g. gpg --import key.txt && gpg --verify GnuPG1.4.19.sh.sig GnuPG1.4.19.sh 

This script has been tested to work on Linux mint and Trisquel. For operating systems that do not have sudo installed please use the nosudo version of the script, you may need to run the nosudo script as root for it to run successfully.
