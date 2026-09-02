sudo apt update

# environment
sudo apt install -y zsh fastfetch flatpak btop

# tools
sudo apt install -y openssl nmap dirb neovim wget gpg apt-transport-https pwgen curl gnupg

# development
sudo apt install -y python3 npm ca-certificates
git config --global user.name "Lucas Aguiar"
git config --global user.email "7lucasdaniel@gmail.com"

# fonts
sudo apt install -y fonts-firacode
fc-cache -f -v

# execute installation files
find ./packages/* | xargs chmod +x
for script in ./packages/*; do
    echo $script
    "$script"
done
