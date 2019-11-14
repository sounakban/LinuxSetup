#!/bin/bash

# Run script with : bash install_scripts.sh

sudo apt update -y

echo "If you plan on installing anaconda and JDownloader, make sure the setup files are downloaded in the \"Installers\" Directory before continuing"
read response
echo "Installing ExFat and Java support, Press Enter to continue"
read response
sudo apt install default-jdk -y
sudo add-apt-repository universe -y
sudo apt-get install exfat-fuse exfat-utils -y

echo "Do you want to install anaconda? [type y/n]"
read var
if [ $var == "y" ] 
then 
    echo Anaconda Installation will start, press enter when ready
    read response
	sudo sh ./Installers/Anaconda*
fi

echo "Do you want to install E-mail client (MailSpring)? [type y/n]"
read mailsp_response
if [ $mailsp_response == "y" ] 
then
	sudo apt install gdebi-core wget -y
	wget -O ./mailspring.deb "https://updates.getmailspring.com/download?platform=linuxDeb"
	sudo gdebi ./mailspring.deb
	rm ./mailspring.deb
fi

echo "Do you want to install Jdownloader? [type y/n]"
read var
if [ $var == "y" ] 
then 
    echo Anaconda Installation will start, press enter when ready
    read response
	sudo sh ./Installers/JD2*
fi


echo "Do you want to install all deb files (updated?) in installers directory? [type y/n]"
read deb_response
echo "Do you want to install VLC Media Player? [type y/n]"
read vlc_response
echo "Do you want to install Disk-Utility? [type y/n]"
read DskUlt_response
echo "Do you want to install Partition Manager (GParted)? [type y/n]"
read pm_response
echo "Do you want to install Clipboard Manager (ClipIt)? [type y/n]"
read clpt_response
echo "Do you want to install Slack? [type y/n]"
read slack_response
echo "Do you want to install DarkTable? [type y/n]"
read darktable_response
echo "Do you want to install RawTherapee? [type y/n]"
read rawtp_response
echo "Do you want to install Git? [type y/n]"
read git_response
echo "Do you want to install Code Editor (VSCode)? [type y/n]"
read vscode_response


if [ $deb_response == "y" ] 
then
	sudo apt install ./Installers/*.deb -y
fi
if [ $vlc_response == "y" ] 
then
	sudo apt install vlc -y
fi
if [ $DskUlt_response == "y" ] 
then
	sudo apt install gnome-disk-utility -y
fi
if [ $pm_response == "y" ] 
then
	sudo apt install gparted -y
fi
if [ $clpt_response == "y" ] 
then
	sudo apt install clipit -y
fi
if [ $slack_response == "y" ] 
then
	sudo apt install slack -y
fi
if [ $darktable_response == "y" ] 
then
	sudo apt install darktable -y
fi
if [ $rawtp_response == "y" ] 
then
	sudo apt install rawtherapee -y
fi
if [ $git_response == "y" ] 
then
	sudo apt install git -y
fi
if [ $vscode_response == "y" ] 
then
	sudo apt install software-properties-common apt-transport-https wget -y
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	sudo apt update -y
	sudo apt install code -y
fi

sudo apt install upgrade -y
sudo apt autoremove -y
sudo apt purge -y


#!/bin/bash

echo "################################################################################"
echo "## Congrats! Everything has been installed!                                   ##"
echo "## Complete package list [Check whether everything was installed correctly]:  ##"
echo "## Exfat, Java, Anaconda, MailSpring, Jdownloader, VLC, Disk-Utility          ##"
echo "## GParted, Clipit, Slack, DarkTable, RawTherapee, Git, VSCode                ##"echo "##                      Designed by Sounak Banerjee                  ##"
echo "################################################################################"
read response
echo "Open a new terminal Window and run the following commands:"
echo "On Ubuntu:"
echo "sudo echo JAVA_HOME=\"/usr/lib/jvm/java-11-openjdk-amd64\" >> ~/.bashrc"
echo "On Other OS:"
echo "su"
echo "echo JAVA_HOME=\"/usr/lib/jvm/java-11-openjdk-amd64\" >> /etc/environment"
echo "exit"
echo "sudo echo \"source /etc/environment\" >> ~/.bashrc"

