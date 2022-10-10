#! /bin/sh
wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

apt update
apt install regolith-desktop
apt upgrade
apt install regolith-look-*
apt install i3xrocks-rofication i3xrocks-info i3xrocks-app-launcher i3xrocks-memory i3xrocks-battery i3xrocks-time i3xrocks-disk-capacity i3xrocks-memory && 
	i3xrocks-volume i3xrocks-temp
apt install neovim
