#!/bin/bash
#License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.

#Installs or upgrades to gnupg-1.4.19

#Installs nessary software.
sudo apt-get update
sudo apt-get install build-essential -y

#Download install files.
wget ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-1.4.19.tar.bz2

#Asks user if they have installed gpg.
read -r -p "Do you have gpg installed? [y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
        #Attempts to Download and import key to verify the integrity of the files
        gpg --keyserver keys.gnupg.net --recv-keys 4F25E3B6 
        echo "Check if this key matches what it says on the webpage."
        sleep 3
        firefox https://www.gnupg.org/signature_key.html </dev/null &>/dev/null &
        read -p "Then hit enter" response

        #Attempts to Download signature to verify the integrity of the files.
        wget ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-1.4.19.tar.bz2.sig
        gpg --verify gnupg-1.4.19.tar.bz2.sig gnupg-1.4.19.tar.bz2
        sleep 7
        tar -xvjf gnupg-1.4.19.tar.bz2
        cd gnupg-1.4.19
        ./configure
        make 
        sudo make install 
        gnome-terminal -e "bash -c \"gpg --version && sleep 30 \""
        read -p "Please make sure the installed version of GnuPG at the top of the page in the terminal window that just appeared is GnuPG 1.4.19 then hit enter." response

        #Cleans up.
        cd ..
        rm -rf gnupg-1.4.19
        rm gnupg-1.4.19.tar.bz2
        rm gnupg-1.4.19.tar.bz2.sig
        ;;
    *)
        #Attempts to check with sha1sum
        echo "Please check this webpage and see if the sha1 checksum for gnupg-1.4.19.tar.bz2 is the same as given here."
        sha1sum gnupg-1.4.19.tar.bz2
        sleep 3
        firefox https://www.gnupg.org/download/integrity_check.html  </dev/null &>/dev/null &
        read -p "Then hit enter" response
        tar -xvjf gnupg-1.4.19.tar.bz2
        cd gnupg-1.4.19
        ./configure
        make 
        sudo make install 
        gnome-terminal -e "bash -c \"gpg --version && sleep 30 \""
        read -p "Please make sure the installed version of GnuPG at the top of the page in the terminal window that just appeared is GnuPG 1.4.19 then hit enter." response

        #Cleans up.
        cd ..
        rm -rf gnupg-1.4.19
        rm gnupg-1.4.19.tar.bz2
        rm gnupg-1.4.19.tar.bz2.sig          
        ;;
esac

   
