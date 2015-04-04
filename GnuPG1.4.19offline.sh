#!/bin/bash
#License GPLv3 GNU GPL version 3 <http://gnu.org/licenses/gpl.html>
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.

#This script installs GnuPG-1.4.19 or upgrades current version to GnuPG-1.4.19.

#Installs necessary software.
cd debs
sudo dpkg -i *.deb
cd .. 

#Extracts and compiles GnuPG.
tar -xvjf gnupg-1.4.19.tar.bz2
cd gnupg-1.4.19
./configure --prefix=/usr
make 
sudo make install 

#Prints version of GnuPG and asks user if it is GnuPG 1.4.19.
clear
gpg --version
read -p "Please make sure the installed version of GnuPG displayed at the top of the terminal window is GnuPG 1.4.19 then hit enter." response

#Cleans up.
cd ..
rm -rf gnupg-1.4.19
   

   
