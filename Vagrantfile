# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  # Box Setting
  config.vm.box = "ubuntu/trusty64"

  
  # Provider-specific 
  config.vm.provider "virtualbox" do |vb|

    #---asa oferi denumirea masini pe care ai creat-o
    config.vm.provider :virtualbox do |vb|
      vb.name = "TibiForta"
    end
    # ----Display the VirtualBox GUI when booting the machine
    #vb.gui = true
    # ---Customize the amount of memory on the VM:
    vb.memory = "1024"
    vb.cpus = 4
    #----- in cmd: vagrant reload
   end

  # Network Settings 
  #---guest is my vm.box, where 80 is default for apache and the host is my localmachine
  config.vm.network "forwarded_port", guest: 80, host: 8081
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  #---nu va merge dinaafara (trebuie sa modifici host-ul in etc dar nu merge)
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  # Folder settings
  #---pentru a edita index.html din interiorul VM putem folosi:
  # guest "../data" ce forlder vreau sa deschid ("." pentru cel in care ma aflu)
  # si "/var/www/html".In momentul in care vom incarca aceasta pagina se va deschide 
  #lista de html din folderul curent 

  #nfs netw file sistem ce ar trebui sa il faca mai rapid si permisiunile :mount_option => ["dmode=777", "fmode=666"] 
  config.vm.synced_folder ".", "/var/www/html" 

  # Provider-specific 
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  
  # Provision Settings
  #--- cand ii dai vagrant up va prelucra si ce este mai jos
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  config.vm.provision "shell", path: "bootstrap.sh"
end
