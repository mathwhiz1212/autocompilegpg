#!/bin/bash
#License GPLv3 GNU GPL version 3 <http://gnu.org/licenses/gpl.html>
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.

#This script installs GnuPG-1.4.19 or upgrades current version to GnuPG-1.4.19.

#Installs necessary software.
apt-get update
apt-get install build-essential

#Downloads install files.
wget ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-1.4.19.tar.bz2

#Asks user if they have installed gpg.
read -r -p "Do you have a trusted version of GnuPG installed? [y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
        #Attempts to download and import keys needed to verify the integrity of the files
        gpg --keyserver keys.gnupg.net --recv-keys 4F25E3B6 
        gpg --keyserver keys.gnupg.net --recv-keys E0856959
        gpg --keyserver keys.gnupg.net --recv-keys 33BD3F06
        gpg --keyserver keys.gnupg.net --recv-keys 7EFD60D9

        #Attempts to download signature and to verify the integrity of the files.
        wget ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-1.4.19.tar.bz2.sig
        gpg --verify gnupg-1.4.19.tar.bz2.sig gnupg-1.4.19.tar.bz2
        sleep 7

        #Extracts and compiles GnuPG.
        tar -xvjf gnupg-1.4.19.tar.bz2
        cd gnupg-1.4.19
        ./configure --prefix=/usr
        make 
        make install 

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
        #Attempts to verify the integrity of the files with sha1sum.
        echo "Please check if the sha1 checksums for gnupg-1.4.19.tar.bz2 match here if they do not immediately stop the installation."
        5503f7faa0a0e84450838706a67621546241ca50  gnupg-1.4.19.tar.bz2
        sha1sum gnupg-1.4.19.tar.bz2
        read -p "Then hit enter" response

        #Extracts and compiles GnuPG.
        tar -xvjf gnupg-1.4.19.tar.bz2
        cd gnupg-1.4.19
        ./configure --prefix=/usr
        make 
        make install 
        
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
