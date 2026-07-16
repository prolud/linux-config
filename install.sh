sudo apt update

# Environment
sudo apt install zsh neofetch flatpak btop

# Tools
sudo apt install openssl nmap dirb neovim wget gpg apt-transport-https pwgen

# Development
sudo apt install python3 npm

### Execute Packages Installation
for script in ./packages/*; do
    [[ -x "$script" ]] && "$script"
done