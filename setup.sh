#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

# Function to print messages
echo_info() {
    echo -e "\e[1;32m[INFO]\e[0m $1"
}

echo_info "Updating and upgrading the system"
sudo apt update && sudo apt upgrade -y

echo_info "Installing utilities"
sudo apt install -y git wget gpg curl build-essential bat fzf libarchive-tools

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Cortile Window Manager
echo_info "Installing Cortile"
curl -LO https://github.com/leukipp/cortile/releases/download/v2.5.0/cortile_2.5.0_linux_amd64.tar.gz
sudo tar -xzf cortile_2.5.0_linux_amd64.tar.gz -C /usr/local/bin cortile
rm cortile_2.5.0_linux_amd64.tar.gz


echo_info "Creating Cortile service"
cat << EOF | sudo tee /etc/systemd/system/cortile.service
[Unit]
Description=Cortile Window Manager

[Service]
ExecStart=/usr/local/bin/cortile
Restart=always
User=$USER

[Install]
WantedBy=default.target
EOF

sudo systemctl enable cortile.service
sudo systemctl start cortile.service

echo_info "Installing Neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

echo_info "Installing Brave browser"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo_info "Installing Visual Studio Code"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https

echo_info "Updating package lists"
sudo apt update

echo_info "Installing programs"
sudo apt install -y alacritty code gimp inkscape plank vlc steam-installer brave-browser

# Download Discord
echo_info "Downloading Discord"
curl -L -o discord.deb "https://discord.com/api/download?platform=linux&format=deb"

# Install Discord
echo_info "Installing Discord"
sudo dpkg -i discord.deb
sudo apt install -f
rm discord.deb

# Install Ulacuncher
echo_info "Installing Ulacuncher"
sudo apt update && sudo apt install -y gnupg
gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] \
          http://ppa.launchpad.net/agornostal/ulauncher/ubuntu jammy main" \
          | sudo tee /etc/apt/sources.list.d/ulauncher-jammy.list
sudo apt update && sudo apt install ulauncher -y

echo_info "Installing and setting themes"
# Download and set everforest-gtk theme
mkdir -p ~/.themes
git clone https://github.com/germanfr/adara-theme ~/.themes/
git clone https://github.com/theory-of-everything/everforest-gtk ~/.themes/everforest-gtk

# Custom css for theme
cp -f ./everforest-gtk/gtk.css ~/.themes/everforest-gtk/gtk-3.20

# Download and install an icon pack
mkdir -p ~/.icons
git clone https://github.com/vinceliuice/Colloid-icon-theme
./Colloid-icon-theme/install.sh -s everforest -t green

# Set themes
gsettings set org.cinnamon.theme name "Adara-Dark"
gsettings set org.cinnamon.desktop.interface gtk-theme "everforest-gtk"
gsettings set org.cinnamon.desktop.interface icon-theme "Colloid-Green-Everforest-Dark"
gsettings set org.cinnamon.desktop.interface cursor-theme "Adwaita"


# Install Cinnamon applets
echo_info "Installing and setting up applets"
wget -qO- https://cinnamon-spices.linuxmint.com/files/applets/gpaste-reloaded@feuerfuchs.eu.zip | bsdtar -xvf- -C ~/.local/share/cinnamon/applets/
wget -qO- https://cinnamon-spices.linuxmint.com/files/applets/color-picker@fmete.zip | bsdtar -xvf- -C ~/.local/share/cinnamon/applets/
wget -qO- https://cinnamon-spices.linuxmint.com/files/applets/temperature@fevimu.zip | bsdtar -xvf- -C ~/.local/share/cinnamon/applets/
wget -qO- https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip | bsdtar -xvf- -C ~/.local/share/cinnamon/applets/

echo_info "Installing applets packages"
sudo apt install gpaste-2 gir1.2-gpaste-2 -y

sudo apt-get install xclip python3-xlib


# Copy existing dconf configuration
echo_info "Importing Cinnamon settings"
dconf load /org/cinnamon/ < ./cinnamon/cinnamon-settings.dconf

# Copy configuration files
echo_info "Copying configuration files"

# Git configuration
echo_info "Setting up Git"
cp ./git/.gitconfig ~/.gitconfig

# Neovim configuration
echo_info "Setting up Neovim"
mkdir -p ~/.config/nvim
cp ./nvim/init.lua ~/.config/nvim/init.lua

# Brave configuration
echo_info "Setting up Brave"
mkdir -p ~/.config/BraveSoftware/Brave-Browser/Default
cp ./brave/Preferences ~/.config/BraveSoftware/Brave-Browser/Default/

# Ulauncher configuration
echo_info "Setting up Ulauncher"
mkdir -p ~/.config/ulauncher
cp -r ./ulauncher/* ~/.config/ulauncher/

echo_info "Creating Ulauncher service"
mkdir -p ~/.config/autostart
cat << EOF > ~/.config/autostart/ulauncher.desktop
[Desktop Entry]
Type=Application
Exec=ulauncher --hide-window
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Ulauncher
Name=Ulauncher
Comment[en_US]=Start Ulauncher at login
Comment=Start Ulauncher at login
EOF

# Alacritty configuration
echo_info "Setting up Alacritty"
mkdir -p ~/.config/alacritty
cp ./alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

echo_info "Cleaning up"
sudo apt autoremove -y
sudo apt clean

echo_info "Setup complete!, please restart your computer."
