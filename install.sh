sudo apt update

# Environment
sudo apt install -y zsh neofetch flatpak btop fonts-firacode

# Tools
sudo apt install -y openssl nmap dirb neovim wget gpg apt-transport-https pwgen

# Development
sudo apt install -y python3 npm

fc-cache -f -v

### Execute Packages Installation
find ./packages/* | xargs chmod +x
for script in ./packages/*; do
    echo $script
    "$script"
done