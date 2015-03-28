#!/bin/bash
#License GPLv3 GNU GPL version 3 <http://gnu.org/licenses/gpl.html>
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.

#This scirpt installs GnuPG-1.4.19 or upgrades current version to GnuPG-1.4.19.

#Installs nessary software.
sudo apt-get update
sudo apt-get install build-essential -y

#Download install files.
wget ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-1.4.19.tar.bz2

#Asks user if they have installed gpg.
read -r -p "Do you have a trusted gpg installed? [y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
        #Attempts to download and import key needed to verify the integrity of the files
        gpg --keyserver keys.gnupg.net --recv-keys 4F25E3B6 
        echo "Please check if this key matches what it says on the webpage."
        sleep 3
        firefox https://www.gnupg.org/signature_key.html </dev/null &>/dev/null &
        read -p "Then hit enter" response

        #Attempts to download signature and to verify the integrity of the files.
        wget ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-1.4.19.tar.bz2.sig
        gpg --verify gnupg-1.4.19.tar.bz2.sig gnupg-1.4.19.tar.bz2
        sleep 7

        #Extracts and compiles GnuPG.
        tar -xvjf gnupg-1.4.19.tar.bz2
        cd gnupg-1.4.19
        ./configure
        make 
        sudo make install 

        #Prints version and asks user if it is the right version.
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
        echo "Please check this webpage and see if the sha1 checksum for gnupg-1.4.19.tar.bz2 is the same as given here."
        sha1sum gnupg-1.4.19.tar.bz2
        sleep 3
        firefox https://www.gnupg.org/download/integrity_check.html  </dev/null &>/dev/null &
        read -p "Then hit enter" response

        #Extracts and compiles GnuPG.
        tar -xvjf gnupg-1.4.19.tar.bz2
        cd gnupg-1.4.19
        ./configure
        make 
        sudo make install 
        
        #Prints version and asks user if it is the right version. 
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

   
