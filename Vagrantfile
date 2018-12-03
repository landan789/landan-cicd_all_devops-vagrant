# -*- mode: ruby -*-
# vi: set ft=ruby :

# Ensure yaml module is loaded
require 'yaml'

# Read yaml node definitions to create **Update nodes.yml to reflect any changes
NODES = YAML.load_file('configs/nodes.yml')
SCRIPTS_PATH = "shells/"
ssh_pub_key = File.readlines("C:/Users/Administrator/.ssh/id_rsa.pub").first.strip

Vagrant.configure(2) do |config|
#  config.ssh.insert_key = false
#  config.vm.provision :shell, path: "bootstrap.sh"

  NODES.each do |node|
    config.vm.define node["name"] do |subconfig|

      subconfig.ssh.forward_agent = true
      subconfig.ssh.insert_key = false # must be false, ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5
      #subconfig.ssh.private_key_path = "./.ssh/id_rsa" # must be comment , ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5

      subconfig.vm.hostname = "centos7x-" + node["name"]
      subconfig.vm.box = node["box"]
      #subconfig.vm.provision :shell, path: "bootstrap_ansible.sh"

      shells = node["shells"]
      shells.each do |shell|
        subconfig.vm.provision "shell", path: SCRIPTS_PATH + shell["path"], args: [ssh_pub_key]
      end

      private_networks = node["private_networks"]
      private_networks.each do |private_network|
        subconfig.vm.network "private_network", ip: private_network["ip"], virtualbox__intnet: private_network["desc"]
      end

      subconfig.vm.synced_folder "../../projects", "/home/vagrant/www"
      subconfig.vm.synced_folder ".", "/vagrant", disabled: true
      subconfig.vm.provider "virtualbox" do |vb|
        vb.name = "centos7x-" + node["name"] # virtual box 的顯示名稱
        vb.gui = false
        vb.cpus = node["cpus"]
        vb.memory = node["memory"]

      end
    end
  end
  # config.vm.provision :ansible do |ansible|
  #   ansible.playbook = "bootstrap.yml"
  # end
end
