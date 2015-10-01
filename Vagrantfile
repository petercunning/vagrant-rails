# -*- mode: ruby -*-
# vi: set ft=ruby :
# Original script on https://github.com/orendon/vagrant-rails

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/precise32"
  
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "10884"]
    vb.cpus = 4 
  end

  # Forward rails server port to your host machine
  #
  config.vm.network "forwarded_port", guest: 3000, host: 4000 ,host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 3001, host: 4001 ,host_ip: "127.0.0.1"
  #config.vm.network :forwarded_port, guest: 3000, host: 1234

  # Install linux packages
  #
  config.vm.provision :shell, path: "https://github.com/petercunning/vagrant-rails/raw/master/script/vagrant_bootstrap.sh", privileged: false

  # Uncomment this line if you want to bundle install and setup/create database (optional)
  # The path: option accepts a script on your local filesystem in case you want to provide your own
  #
  # config.vm.provision :shell, path: "https://github.com/petercunning/vagrant-rails/raw/master/script/app_specifics.sh", privileged: false

  # Use an specific IP address on your local network
  #
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Share additional folders to the guest VM
  #
  config.vm.synced_folder "." , "/vagrant",:mount_options => ["dmode=777","fmode=666"]

  # Provider-specific configuration so you can fine-tune various
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #

  #config.vm.provision :chef_solo do |chef|
   #chef.add_recipe "apt"
   #chef.add_recipe "vim"
   #chef.add_recipe "openssl"
   #chef.add_recipe "mysql"
   #chef.add_recipe "mysql::server"
   #chef.add_recipe "nodejs"
   #chef.add_recipe "ruby_build"
   #chef.add_recipe "rbenv::user"
   #chef.add_recipe "rbenv::vagrant"
  #end
end
