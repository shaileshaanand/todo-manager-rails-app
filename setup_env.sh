#!/bin/bash
RUBY_VERSION="2.6.3"
sudo apt-get update -y
sudo apt-get install -y gnupg2 curl postgresql postgresql-contrib libpq-dev
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.6.3
rvm alias create default 2.6.3
# sudo -i -u postgres
sudo service postgresql start
sudo su -c "psql -c \"alter user postgres password 'changeme'\"" postgres
sudo su -c "psql -c \"create database saas_db\"" postgres

curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
source ~/.profile
gem install rails pg rufo
yarn install
bundle install
