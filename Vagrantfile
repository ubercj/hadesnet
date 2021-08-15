# -*- mode: ruby -*-
# vi: set ft=ruby :

# -----------------------------------------------------------------------------
#  Rails Development Vagrantfile
# -----------------------------------------------------------------------------
#
#   Assumes Ubuntu VirtualBox installation
#
#   This file intalls:
#
#   Vim
#   Curl
#   Git
#   SQLite3
#   PostgreSQL
#   NodeJS
#   Yarn
#   Rbenv
#   Ruby
#   Rails
#
#   And installs these gems:
#
#   Bundler
#   SQLite3
#   PG
#   Rails
#
#
# Setup
#
#   1. Create a directory for the Rails app and run 'vagrant init'.
#
#   2. Paste in the contents of this Vagrantfile, specifying the Ruby and Rails versions.
#
#   3. Issue 'vagrant up' to start and provision the server.
#
#   4. SSH into the machine using 'vagrant ssh'.
#
#   5. Configure Postgres if required.
#       i.    `sudo su - postgres`
#       ii.   `createuser -s -r postgres`
#       iii.  `rails db:create`
#       iv.   `rails db:migrate`
#
#   6. If Rails app is not already created, create it with 'rails new /vagrant'.
#
#   7. In the shell, run 'cd /vagrant' to switch to the directory for the app.
#
#   8. Run 'bundle install'.
#
#   Note: If the Rails development server won't work, you may have to run `rails webpacker:install`
# -----------------------------------------------------------------------------

$as_root = <<AS_ROOT
echo Running root script...
sudo apt-get -y update

echo Installing vim...
sudo apt-get -y install vim

echo Installing curl...
sudo apt-get -y install curl

echo Installing git...
sudo apt-get -y install git

echo Installing sqlite3...
sudo apt-get -y install sqlite3

echo Installing postgres...
sudo apt-get -y install postgresql-client postgresql libpq-dev

echo Installing nodejs...
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

echo Installing yarn...
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

echo Root script complete.
AS_ROOT

$as_vagrant = <<AS_VAGRANT
echo Running vagrant script...

echo Installing rbenv...
sudo apt-get -y install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
rbenv init
sudo mkdir -p "$(rbenv root)"/plugins
sudo git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

echo Installing ruby...
sudo rbenv install 2.7.2 -v
sudo rbenv global 2.7.2

echo Vagrant script complete.
AS_VAGRANT

$install_gems = <<INSTALL_GEMS
echo Verifying global ruby version...
ruby -v

echo Installing gems...
sudo gem update --system --no-document --verbose
sudo gem install bundler --no-document --verbose
sudo gem install sqlite3 --no-document --verbose
sudo gem install pg --no-document --verbose
sudo gem install rails --version 6.1.3 --no-document --verbose
sudo rbenv rehash

echo All gems installed.
INSTALL_GEMS

Vagrant.configure("2") do |config|
    config.vm.box = "hashicorp/bionic64"
    config.vm.network :forwarded_port, guest: 3000, host: 3000
    config.vm.provision :shell, :inline => $as_root, :privileged => true
    config.vm.provision :shell, :inline => $as_vagrant, :privileged => false
    config.vm.provision :reload
    config.vm.provision :shell, :inline => $install_gems, :privileged => false
end
