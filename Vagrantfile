# 10.0.0.11 Ansible Tower
# 10.0.0.21 Nginx
# 10.0.0.3* PHP or NodeJS
# 10.0.0.4* MySQL

BOX_IMAGE = "centos/7"
NODE_COUNT = 2
MYSQL_COUNT = 3
SCRIPTS_PATH = "shell/"

ssh_pub_key = File.readlines("C:/Users/Administrator/.ssh/id_rsa.pub").first.strip

Vagrant.configure("2") do |config|
  config.vm.define "ansible" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "centos7x6-ansible"     # linux ssh 登入顯示的 vagrant@lb1
    subconfig.vm.network "private_network", ip: "10.0.0.11"
    subconfig.vm.synced_folder "../../projects", "/home/vagrant/www"
    subconfig.vm.synced_folder ".", "/vagrant", disabled: true

    subconfig.ssh.forward_agent = true
    subconfig.ssh.insert_key = false # must be false, ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5
    #subconfig.ssh.private_key_path = "./.ssh/id_rsa" # must be comment , ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5
    subconfig.vm.provision "shell", path: SCRIPTS_PATH + "install_ansible.sh"
    subconfig.vm.provision "shell", path: SCRIPTS_PATH + "restart_sshd.sh", args: [ssh_pub_key]

    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "centos7x6-ansible" # virtual box 的顯示名稱
      vb.gui = false
      vb.cpus = 1
      vb.memory = "256"
    end
  end


  config.vm.define "loadbalance" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "centos7x6-loadbalance"     # linux ssh 登入顯示的 vagrant@lb1
    subconfig.vm.network "forwarded_port", adapter: 1, guest: 80, host: 80
    subconfig.vm.network "forwarded_port", adapter: 1, guest: 3000, host: 3000
    subconfig.vm.network "private_network", ip: "10.0.0.21"
    subconfig.vm.synced_folder "../../projects", "/home/vagrant/www"
    subconfig.vm.synced_folder ".", "/vagrant", disabled: true

    subconfig.ssh.forward_agent = true
	  subconfig.ssh.insert_key = false # must be false, ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5
	  #subconfig.ssh.private_key_path = "./.ssh/id_rsa" # must be comment , ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5

 	  subconfig.vm.provision "shell", path: SCRIPTS_PATH + "restart_sshd.sh", args: [ssh_pub_key]

    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "centos7x6-loadbalance" # virtual box 的顯示名稱
      vb.gui = false
      vb.cpus = 1
      vb.memory = "256"
    end
  end

  (1..NODE_COUNT).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "centos7x6-node#{i}"
      subconfig.vm.network :private_network, ip: "10.0.0.#{i + 30}"
      subconfig.vm.synced_folder "../../projects", "/home/vagrant/www"
      subconfig.vm.synced_folder ".", "/vagrant", disabled: true
	  
	    subconfig.ssh.forward_agent = true
	    subconfig.ssh.insert_key = false # must be false, ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5
	    #subconfig.ssh.private_key_path = "./.ssh/id_rsa" # must be comment , ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5

 	    subconfig.vm.provision "shell", path: SCRIPTS_PATH + "restart_sshd.sh", args: [ssh_pub_key]
      
      subconfig.vm.provider "virtualbox" do |vb|
        vb.name = "centos7x6-node#{i}"
        vb.gui = false
        vb.cpus = 1
        vb.memory = "256"
      end
    end
  end

  (1..MYSQL_COUNT).each do |i|
    config.vm.define "mysql#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "centos7x6-mysql#{i}"
      subconfig.vm.network :private_network, ip: "10.0.0.#{i + 40}"
      subconfig.vm.synced_folder "../../projects", "/home/vagrant/www"
      subconfig.vm.synced_folder ".", "/vagrant", disabled: true
	    #subconfig.ssh.private_key_path = "./.ssh/id_rsa" # must be comment , ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5

 	    subconfig.vm.provision "shell", path: SCRIPTS_PATH + "restart_sshd.sh", args: [ssh_pub_key]

      subconfig.vm.provider "virtualbox" do |vb|
        vb.name = "centos7x6-mysql#{i}"
        vb.gui = false
        vb.cpus = 1
        vb.memory = "256"
        end
    end
  end


  # Install avahi on all machines

end
