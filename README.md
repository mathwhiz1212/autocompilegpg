# simpleautocompilegpg
Simple script that automatically downloads, verifies and compiles GnuPG. 

The current version installs/upgrades GnuPG to GnuPG V.1.4.19.
if you are running an ealier version than 1.4.19 you are at risk because of some serious vulnerabilities: "This release mitigates two new of side channel attack methods as well as a couple of other bugs." https://www.gnupg.org/index.html

Currently this script requires: A debian based linux distro. A working internet connection, firefox and gpg or sha1sum.

This script should work on most debian based distros, with a little modification someone else could make it work on others.

This script has been tested to work on Linux mint.
