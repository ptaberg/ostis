sudo apt remove --purge nodejs npm
sudo apt clean
sudo apt autoclean
sudo apt install -f
sudo apt autoremove

apt install -y curl
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs
sudo curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg > pubkey.gpg
sudo apt-key add pubkey.gpg
sudo apt-get update && apt-get install -y yarn
rm pubkey.gpg