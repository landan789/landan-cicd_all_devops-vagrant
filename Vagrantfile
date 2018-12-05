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
      subconfig.ssh.username = "vagrant"
      #subconfig.ssh.password = "vagrant"
      subconfig.ssh.forward_agent = true
      subconfig.ssh.insert_key = false # must be false, ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5
      #subconfig.ssh.private_key_path = "./.ssh/id_rsa" # must be comment , ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5

      subconfig.vm.hostname = node["name"] + "-centos7x"
      subconfig.vm.box = node["box"]
      #subconfig.vm.provision :shell, path: "bootstrap_ansible.sh"

      shells = node["shells"]
      shells.each do |shell|
        subconfig.vm.provision "shell", path: SCRIPTS_PATH + shell["path"], args: [ssh_pub_key]
      end

      private_networks = node["private_networks"]
      private_networks.each do |private_network|
        # :private_network INSTEAD OF "private_network"
        subconfig.vm.network :private_network, ip: private_network["ip"]
      end

      if node["forwarded_ports"]
        forwarded_ports = node["forwarded_ports"]
        forwarded_ports.each do |forwarded_port|
        subconfig.vm.network :forwarded_port, guest: forwarded_port["guest"], host: forwarded_port["host"]
        end
      end

      # dmode配置目录权限，fmode配置文件权限  //默认权限777
      # ansible/ansible.cfg 必须设定为不可写入
      subconfig.vm.synced_folder "../../projects", "/home/vagrant/www", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=664"]

      subconfig.vm.synced_folder ".", "/vagrant", disabled: true
      subconfig.vm.provider "virtualbox" do |vb|
        vb.name = node["name"] + "-centos7x"  # virtual box 的顯示名稱
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
