#!/bin/bash
#License GPLv3 GNU GPL version 3 <http://gnu.org/licenses/gpl.html>
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.

#This script installs GnuPG-1.4.19 or upgrades current version to GnuPG-1.4.19.

#Installs necessary software.
cd debs
sudo dpkg -i *.deb
<<<<<<< HEAD
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
   
=======
cd ..

#Asks user if they have installed gpg.
read -r -p "Do you have a trusted version of GnuPG installed? [y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 

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
        rm gnupg-1.4.19.tar.bz2
        rm gnupg-1.4.19.tar.bz2.sig
        ;;
    *)

        #Extracts and compiles GnuPG.
        tar -xvjf gnupg-1.4.19.tar.bz2
        cd gnupg-1.4.19
        ./configure --prefix=/usr
        make 
        sudo make install 
        
        #Prints version and asks user if it is GnuPG 1.4.19. 
        clear
        gpg --version
        read -p "Please make sure the installed version of GnuPG displayed at the top of the terminal window is GnuPG 1.4.19 then hit enter." response

        #Cleans up.
        cd ..
        rm -rf gnupg-1.4.19
        rm gnupg-1.4.19.tar.bz2
        rm gnupg-1.4.19.tar.bz2.sig          
        ;;
esac
>>>>>>> deb2166b840bd9a1effb287198a927ec9d2e37b2

   
