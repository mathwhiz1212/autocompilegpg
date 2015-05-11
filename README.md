# autocompilegpg
Script that automatically downloads, verifies and compiles GnuPG. 

This script installs GnuPG-1.4.19 or upgrades current version to GnuPG-1.4.19.

The goal of this script is to upgrade all of the GnuPG V.1.* to V.1.4.19 as there are many vulnerable versions floating around, even the last version is vulnerable.

Currently this script requires: A debian based linux distro, A working internet connection, wget, apt, tar and gpg or sha1sum. Most debian based linux distros meet all of these.

Please check the sha checksum with sha1sum e.g. sha1sum GnuPG1.4.19.sh and compare it with .sha file.

This script has been tested to work on Linux mint and Trisquel. For operating systems that do not have sudo installed please use the nosudo version of the script, you need to run the nosudo script as root for it to run successfully.

In enviroments with unreliable or nonexistant internet please use the offline script found here: https://github.com/mathwhiz1212/autocompilegpg-offline

This script is licensed under GPLv3 any software other than the script that may be included or used here you will have to look at the license(s) for that software. This version of the script uses GPG which is licensed under GPLv3+ and I am not aware of the licenses for the dependecies.
