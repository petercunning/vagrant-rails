#!/bin/sh
# Original script on https://github.com/orendon/vagrant-rails

# enable console colors
sed -i '1iforce_color_prompt=yes' ~/.bashrc

# disable docs during gem install
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

# essentials
sudo apt-get -y update
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libcurl4-openssl-dev curl wget


# SQLite, Git, Node.js & Phantom.js
sudo apt-get install -y libsqlite3-dev git nodejs phantomjs

# mysql
sudo apt-get install -y libmysqlclient-dev 

# python 
sudo apt-get install python-pip python-dev

# Postgres
sudo apt-get install -y postgresql postgresql-client postgresql-contrib libpq-dev
	# creating user
	#sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'password';"
	# creating new db if needed .. might need 2 (dev/test)
	#createdb -U vagrant development

#setup Zsh 
sudo apt-get install -y zsh qt4-dev-tools

#setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# setup Heroku toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# setup rbenv and ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build




# Install ruby 2.1.4 and bundler
export RBENV_ROOT="${HOME}/.rbenv"
export PATH="${RBENV_ROOT}/bin:${PATH}"
export PATH="${RBENV_ROOT}/shims:${PATH}"
rbenv install 2.2.3
rbenv global 2.2.3
rbenv install 2.1.7
gem install bundler
rbenv rehash

# cleanup
sudo apt-get clean
