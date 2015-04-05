#!/bin/bash

# Necessary functions
function check_and_exit() {
	[[ $1 -eq 0 ]] && echo "Success." || {
	echo -e "Failed.\nStopping the script here.\nBye :)"
	exit $?	
}
}

function ask () {
	category="$1"
	package="$2"
	shift; shift;

	case "$category" in
		install)
			echo -e "Package : ${package}"	
			apt show "${package}" 2>/dev/null | grep -w Description
			[[ $? -eq 0 ]] || {
				echo "Package ${package} doesnt exist"
				exit $?
			}
			read -p "Do you want to install this package [y/n] ?" choice
			[[ "${choice}" == 'y' ]] && return 0
		;;
        clone)
            echo -e "Repo : ${package}"
            read -p "Do you want to clone this repository from GitHub [y/n] ?" choice
			[[ "${choice}" == 'y' ]] && return 0
}

function install () {
	[[ $# -eq 1 ]] && {
		[[ ask ('install', ${1}) -eq 0 ]] && {
			echo -ne "Installing Package : ${1} ... "
			echo -e "y\n" | sudo apt-get install "${1}"
			check_and_exit ($?)
		}
}

function clone (){
    # TODO: implement mulitple clones at a time      
    [[ $# -ge 1 ]] && {
    [[ ask ('clone', ${1}) -eq 0 ]] && {
        echo -ne "Cloning ${1} Repository from GitHub ... "
        #TODO : Move to specified repository first
        git clone ${1} .
        }
    }
}

# Run this program when ubuntu is first installed. 
# This will do necessary installations and other amendments.

read -p "Please enter your password which will be using for further instructions next in the script ... " PASS

# Making your sudo access allowed without password
read -p "Do you want to make your account bypass sudo access without password [y/n] ? " choice
[[ $choice -eq 'y' ]] && {
	echo -n "Bypassing your sudo access without password ... "
	echo $PASS | sudo sh -c 'echo "$USER ALL=(ALL:ALL) ALL" >> /etc/sudoers.d'
	check_and_exit($?)
}

# Settingup root password 
echo -e "Setting up root password\nPlease enter a password and confirm for root account access ... "
sudo passwd
check_and_exit($?)

# Speedingup internet using WIFI
echo -ne "Changing configurations for speeding up internet ... "
echo $PASS | sudo sh -c 'echo "options rt2800pci nohwcrypt=1" >> "/etc/modprobe.d/rt2800pci.conf" '
check_and_exit ($?)

# Disabling IPV6 for speeding up internet
echo -ne "Disabling IPV6 for WIFI speedup ... "
echo $PASS | sudo sh -c 'echo " 
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
" >> "/etc/sysctl.conf" '
check_and_exit ($?)

# Installing packages

# chrome browser
install ('google-chrome-stable')

# vlc player
install ("VLC")

# Vuze torrent client
install ('Vuze')

# latest python
install ('python3')

# vim
install ('vim')

# youtube-dl
install ('youtube-dl')

# GIT
install ('git')

cd $HOME
clone ("https://github.com/sravankghantasala/dotfiles" . )

# Aptana Studio 3.4.1
read -p 'Do you want to install Aptana Studio 3.4.1 ? [y/n] ... ' choice
[[ $choice == 'y' ]] && {
	read -p 'Enter the location you want to store ... ' loc
	[[ -w $loc ]] || mkdir -p $loc
	echo -n 'Downloading Aptana ... '
	wget -r 'http://d1iwq2e2xrohf.cloudfront.net/tools/studio/standalone/3.4.1.201306062137/linux/Aptana_Studio_3_Setup_Linux_x86_64_3.4.1.zip' 
	echo 'Done.'
	echo -n 'Installing zip archiver [ if not exists ] ... '
	sudo apt-get install zip >/dev/null
	check_and_exit ($?)
	unzip Aptana_Studio_3_Setup_Linux_x86_64_3.4.1.zip
	rsync -avz --delete 'Aptana_Studio_3' $loc/
	rm -rf Aptana_Studio_3
	echo 'Setting alias for aptana studio 3.4.1 as aptana ... '
	[[ -w ~/.bash_aliases ]] || touch ~/.bash_aliases
	echo 'alias aptana="./$loc/Aptana_Studio_3/AptanaStudio3"'
	check_exit ($?)
}
# Updating at the end
echo -e "Updating apt at the end ...\n"
echo $PASS | sudo apt-get update
check_and_exit ($?)

echo -e "Upgrading Ubuntu finally ... \n"
echo $PASS | sudp apt-get upgrade
check_and_exit ($?)
