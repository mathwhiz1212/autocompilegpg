#!/bin/bash
#License GPLv3 GNU GPL version 3 <http://gnu.org/licenses/gpl.html>
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.

#This script downloads, verifies, compiles and installs GnuPG v1.4.19 or upgrades current version to GnuPG v1.4.19.

#Variables for the script.

CDU="cd .."
RD="rm -rf gnupg-1.4.19"
RF="rm gnupg-1.4.19.tar.bz2"
RS="rm gnupg-1.4.19.tar.bz2.sig"
C="clear"
PV="gpg --version"
AU="echo Please make sure the installed version of GnuPG displayed at the top of the terminal window is GnuPG 1.4.19."
S="sleep 7"
EG="tar -xvjf gnupg-1.4.19.tar.bz2"
CD="cd gnupg-1.4.19" 
CG="./configure --prefix=/usr"
MG="make"
IG="sudo make install"

#Installs necessary software.
sudo apt-get update
sudo apt-get install build-essential -y

#Downloads install files.
$C
wget ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-1.4.19.tar.bz2

#Asks user if they have installed gpg.
$C
read -r -p "Do you have a trusted version of GnuPG installed? [y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
        #Attempts to download and import keys needed to verify the integrity of the files.
        gpg --keyserver keys.gnupg.net --recv-keys 4F25E3B6 
        gpg --keyserver keys.gnupg.net --recv-keys E0856959
        gpg --keyserver keys.gnupg.net --recv-keys 33BD3F06
        gpg --keyserver keys.gnupg.net --recv-keys 7EFD60D9

        #Attempts to download signature and to verify the integrity of the files.
        wget ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-1.4.19.tar.bz2.sig
        gpg --verify gnupg-1.4.19.tar.bz2.sig gnupg-1.4.19.tar.bz2
        $S && $S

        #Extracts and compiles GnuPG.
        $EG && $CD && $CG && $MG && $IG

        #Prints version of GnuPG and asks user if it is GnuPG 1.4.19.
        $C && $PV && $AU && $S

        #Cleans up.
        $CDU && $RD && $RF && $RS
        ;;
    *)
        #Attempts to verify the integrity of the files with sha1sum.
        echo 5503f7faa0a0e84450838706a67621546241ca50  gnupg-1.4.19.tar.bz2 > gpg.sha
sha=$( sha1sum -c gpg.sha )
        if [ "$sha" == "gnupg-1.4.19.tar.bz2: OK" ]; then
        $C
        echo "The sha1sum checksums match, continuing installation."
        $S

        #Extracts and compiles GnuPG.
        $EG && $CD && $CG && $MG && $IG
        
        #Prints version and asks user if it is GnuPG v1.4.19. 
        $C && $PV && $AU && $S

        #Cleans up.
        $CDU && $RD && $RF  
        echo "Cleaned up."
        else
        echo "The sha1 checksums do not match try re-downloading files."
        $S && $S
        fi
    ;;
    esac
