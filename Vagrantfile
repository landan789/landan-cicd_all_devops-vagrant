# -*- mode: ruby -*-
# vi: set ft=ruby :

# Ensure yaml module is loaded
require 'yaml'

# Read yaml node definitions to create **Update nodes.yml to reflect any changes
NODES = YAML.load_file('configs/nodes.yml')

Vagrant.configure(2) do |config|
#  config.ssh.insert_key = false
#  config.vm.provision :shell, path: "bootstrap.sh"

  NODES.each do |nodes|
    config.vm.define nodes["name"] do |node|
      node.vm.hostname = nodes["name"]
      node.vm.box = nodes["box"]
#      node.vm.provision :shell, path: "bootstrap_ansible.sh"
      node.vm.network "private_network", ip: nodes["priv_ip_1"]
      ints = nodes["priv_ips"]
      ints.each do |int|
        node.vm.network "private_network", ip: int["ip"], virtualbox__intnet: int["desc"]
      end
      node.vm.synced_folder ".", "/vagrant"
      node.vm.provider "virtualbox" do |v|
        v.memory = nodes["mem"]
        v.cpus = nodes["cpus"]
      end
    end
  end
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "bootstrap.yml"
  end
end
