# This is a bash script that performs initial setup to optimize the fedora experience
# !!!!!!! IMPORTANT NOTE: Run this file with sudo permissions !!!!!!!!!


# Change DNF settings
## Use fast mirrors for download
sudo echo "cat fastestmirror=True" >> /etc/dnf/dnf.conf
## Download packages parallely when installing
sudo echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf


# Add DNF fusion repos for more package options
## Repo for free software
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
## Repo for non-free software
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y


# Add media plugins for playing online and offline media
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y

sudo dnf install lame\* --exclude=lame-devel -y

sudo dnf group upgrade --with-optional Multimedia -y


# Enable flathub Repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
