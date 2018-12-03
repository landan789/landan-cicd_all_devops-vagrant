# -*- mode: ruby -*-
# vi: set ft=ruby :

# Ensure yaml module is loaded
require 'yaml'

# Read yaml node definitions to create **Update nodes.yml to reflect any changes
NODES = YAML.load_file('configs/nodes.yml')

Vagrant.configure(2) do |config|
#  config.ssh.insert_key = false
#  config.vm.provision :shell, path: "bootstrap.sh"

  NODES.each do |node|
    config.vm.define node["name"] do |subconfig|
      subconfig.vm.hostname = node["name"]
      subconfig.vm.box = node["box"]
      #subconfig.vm.provision :shell, path: "bootstrap_ansible.sh"
      subconfig.vm.network "private_network", ip: node["priv_ip_1"]
      ints = node["priv_ips"]
      ints.each do |int|
        subconfig.vm.network "private_network", ip: int["ip"], virtualbox__intnet: int["desc"]
      end
      subconfig.vm.synced_folder ".", "/vagrant"
      subconfig.vm.provider "virtualbox" do |v|
        v.memory = node["mem"]
        v.cpus = node["cpus"]
      end
    end
  end
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "bootstrap.yml"
  end
end
