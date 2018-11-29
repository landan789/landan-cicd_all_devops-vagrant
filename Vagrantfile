BOX_IMAGE = "centos/7"
NODE_COUNT = 2
MYSQL_COUNT = 3

Vagrant.configure("2") do |config|
  config.vm.define "lb1" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "lb1"     # linux ssh 登入顯示的 vagrant@lb1
    subconfig.vm.network "forwarded_port", adapter: 1, guest: 80, host: 80
    subconfig.vm.network "forwarded_port", adapter: 1, guest: 3000, host: 3000
    subconfig.vm.network "private_network", ip: "10.0.0.11"
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "9thflr_lb1" # virtual box 的顯示名稱
      vb.gui = false
      vb.cpus = 1
      vb.memory = "256"
      end
  end

  (1..NODE_COUNT).each do |i|
    config.vm.define "nd#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "nd#{i}"
      subconfig.vm.network :private_network, ip: "10.0.0.#{i + 20}"
      subconfig.vm.provider "virtualbox" do |vb|
        vb.name = "9thflr_nd#{i}"
        vb.gui = false
        vb.cpus = 1
        vb.memory = "256"
        end
    end
  end

  (1..MYSQL_COUNT).each do |i|
    config.vm.define "db#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "db#{i}"
      subconfig.vm.network :private_network, ip: "10.0.0.#{i + 30}"
      subconfig.vm.provider "virtualbox" do |vb|
        vb.name = "9thflr_db#{i}"
        vb.gui = false
        vb.cpus = 1
        vb.memory = "256"
        end
    end
  end


  # Install avahi on all machines

end
