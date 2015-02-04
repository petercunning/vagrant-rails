# -*- mode: ruby -*-
# vi: set ft=ruby :
# Original script on https://github.com/orendon/vagrant-rails

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Forward rails server port to your host machine
  #
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Install linux packages
  #
  #config.vm.provision :shell, path: "https://github.com/petercunning/vagrant-rails/raw/master/script/vagrant_bootstrap.sh", privileged: false

  # Uncomment this line if you want to bundle install and setup/create database (optional)
  # The path: option accepts a script on your local filesystem in case you want to provide your own
  #
  # config.vm.provision :shell, path: "https://github.com/petercunning/vagrant-rails/raw/master/script/app_specifics.sh", privileged: false

  # Use an specific IP address on your local network
  #
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Share additional folders to the guest VM
  #
  # config.vm.synced_folder "../folder_on_your_host_machine", "/folder_on_vagrant_vm"

  # Provider-specific configuration so you can fine-tune various
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end


  config.vm.provision :chef_solo do |chef|
	chef.add_recipe "apt"
	chef.add_recipe "vim"
    chef.add_recipe "openssl"
    chef.add_recipe "mysql"
    chef.add_recipe "mysql::server"
	chef.add_recipe "nodejs"
	chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv::user"
    chef.add_recipe "rbenv::vagrant"
    chef.add_recipe "vim"
  
	chef.json = {
	  rbenv: {
        user_installs: [{
          user: 'vagrant',
          rubies: ["2.2.0"],
          global: "2.2.0",
          gems: {
            "2.2.0" => [
              { name: "bundler" }
            ]
          }
        }]
      },
	  "mysql" => {
				  "server_root_password" => "password",
				  "server_repl_password" => "password",
				  "server_debian_password" => "password"
				 }
	}
  end
end
