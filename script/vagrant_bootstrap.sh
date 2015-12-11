#!/bin/sh
# Original script on https://github.com/orendon/vagrant-rails

# enable console colors
sed -i '1iforce_color_prompt=yes' ~/.bashrc

# disable docs during gem install
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

# essentials
sudo apt-get -y update
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libcurl4-openssl-dev curl wget libmysqlclient-dev phantomjs zsh sudo apt-get install qt4-dev-tools


# SQLite, Git and Node.js
sudo apt-get install -y libsqlite3-dev git nodejs

# Postgres
sudo apt-get install -y postgresql-9.3 postgresql-server-dev-9.3 postgresql-contrib-9.3

#setup Heroku toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

#setup oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# setup rbenv and ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build




# Install ruby 2.1.4 and bundler
export RBENV_ROOT="${HOME}/.rbenv"
export PATH="${RBENV_ROOT}/bin:${PATH}"
export PATH="${RBENV_ROOT}/shims:${PATH}"
#rbenv install 2.1.4
rbenv install 2.2.3
rbenv global 2.2.3
rbenv install 2.1.7
gem install bundler
rbenv rehash

# cleanup
sudo apt-get clean
