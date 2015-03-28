# simpleautocompilegpg
Simple script that automatically downloads, verifies and compiles GnuPG. 

This scirpt installs GnuPG-1.4.19 or upgrades current version to GnuPG-1.4.19.

The goal of this script is to upgrade all of the GnuPG V.1.* to V.1.4.19 as there are many vulnerable versions floating around, even the last version is vulnerable.

<<<<<<< HEAD
Currently this script requires: A debian based linux distro with sudo installed and usable. A working internet connection, firefox and gpg or sha1sum.

Please import my public key (key.txt) and verify the .sh file with the signature. e.g. gpg --import key.txt && gpg --verify GnuPG1.4.19.sh.sig GnuPG1.4.19.sh 

This script has been tested to work on Linux mint and Trisquel.
=======
Currently this script requires: A debian based linux distro. A working internet connection, firefox and gpg or sha1sum.

This script has been tested to work on Linux mint.
>>>>>>> 77d52c10bc31ba19c5422251d4b70888d96d37e4
