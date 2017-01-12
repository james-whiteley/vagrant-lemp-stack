# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Install Ubuntu 16.04
  config.vm.box = "ubuntu/xenial64"

  # Forward traffic from port 8080 on host to port 80 on guest
  # (auto-correct if any port clashes on host)
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  # Automatically assign IP address from reserved address space
  # (use ifconfig on box to find IP)
  config.vm.network "private_network", type: "dhcp"

  # Sync project-src directory with /var/www/html directory on box
  # All project source code should be put in this directory
  config.vm.synced_folder "project-src", "/var/www/html", :mount_options => ["dmode=755","fmode=755"]

  # Run Chef cookbook
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "lemp-stack"
  end

  # Reboot the box to ensure any upgrades/updates/installs are implemented correctly
  config.vm.provision "shell", inline: "sudo reboot"
end
