# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Variables
  # Setup as `.11` to avoid clashing with `salt-developer`
  master_ip = "192.168.33.11"

  # Configuration
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "code", "/srv/", type: "nfs_guest"
  config.vm.host_name = "dev1"
  config.vm.network "private_network", ip: master_ip

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :salt do |salt|
    salt.minion_config = "saltstack/etc/dev1"
    salt.minion_key = "saltstack/keys/dev1.pem"
    salt.minion_pub = "saltstack/keys/dev1.pub"
    salt.bootstrap_options = "-P -c /tmp"
  end

end
