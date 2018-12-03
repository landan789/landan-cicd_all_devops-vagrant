SCRIPTS_PATH = "shells/"
ssh_pub_key = File.readlines("C:/Users/Administrator/.ssh/id_rsa.pub").first.strip

SERVERS = [
  {
    :define => "gitlab",
    :box => "centos/7",
    :private_network => "10.0.0.11",
    :shells => [
      {
        :path => SCRIPTS_PATH + "restart_sshd.sh",
        :args => ssh_pub_key
      }
    ],
    :cpus => 1,
    :memory => "256"
  },
  {
    :define => "jenkins",
    :box => "centos/7",
    :private_network => "10.0.0.12",
    :shells => [
      {
        :path => SCRIPTS_PATH + "restart_sshd.sh",
        :args => ssh_pub_key
      }
    ],
    :cpus => 1,
    :memory => "256"
  },
  {
    :define => "ansible",
    :box => "centos/7",
    :private_network => "10.0.0.13",
    :shells => [
      {
        :path => SCRIPTS_PATH + "install_ansible.sh",
        :args => ""
      },
      {
        :path => SCRIPTS_PATH + "restart_sshd.sh",
        :args => ssh_pub_key
      }
    ],
    :cpus => 1,
    :memory => "256"
  },
  {
    :define => "nginx",
    :box => "centos/7",
    :private_network => "10.0.0.21",
    :shells => [
      {
        :path => SCRIPTS_PATH + "restart_sshd.sh",
        :args => ssh_pub_key
      }
    ],
    :cpus => 1,
    :memory => "256"
  },
  {
    :define => "php1",
    :box => "centos/7",
    :private_network => "10.0.0.31",
    :shells => [
      {
        :path => SCRIPTS_PATH + "restart_sshd.sh",
        :args => ssh_pub_key
      }
    ],
    :cpus => 1,
    :memory => "256"
  },
  {
    :define => "php2",
    :box => "centos/7",
    :private_network => "10.0.0.32",
    :shells => [
      {
        :path => SCRIPTS_PATH + "restart_sshd.sh",
        :args => ssh_pub_key
      }
    ],
    :cpus => 1,
    :memory => "256"
  },
  {
    :define => "mysql1",
    :box => "centos/7",
    :private_network => "10.0.0.41",
    :shells => [
      {
        :path => SCRIPTS_PATH + "restart_sshd.sh",
        :args => ssh_pub_key
      }
    ],
    :cpus => 1,
    :memory => "256"
  },
  {
    :define => "mysql2",
    :box => "centos/7",
    :private_network => "10.0.0.42",
    :shells => [
      {
        :path => SCRIPTS_PATH + "restart_sshd.sh",
        :args => ssh_pub_key
      }
    ],
    :cpus => 1,
    :memory => "256"
  },
  {
    :define => "mysql3",
    :box => "centos/7",
    :private_network => "10.0.0.43",
    :cpus => 1,
    :memory => "256"
  }
]




Vagrant.configure(2) do |config|
    SERVERS.each do |server|
        config.vm.define server[:define] do |subconfig|

            subconfig.vm.box = server[:box]
            subconfig.vm.hostname = server[:define]
            subconfig.vm.network "private_network", ip: server[:private_network]

            server[:private_network].each do |shell|
              subconfig.vm.provision "shell", path: shell[:path], args: shell[:args]
            end

            subconfig.vm.synced_folder "../../projects", "/home/vagrant/www"
            subconfig.vm.synced_folder ".", "/vagrant", disabled: true

            subconfig.ssh.forward_agent = true
            subconfig.ssh.insert_key = false # must be false, ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5
            #subconfig.ssh.private_key_path = "./.ssh/id_rsa" # must be comment , ~/.ssh/authorized_keys in VM can not be modified chmod after Vagrant 1.8.5
  
            subconfig.vm.provider "virtualbox" do |vb|
                vb.name = "centos7-" + server[:define] # virtual box 的顯示名稱
                vb.gui = false
                vb.cpus = server[:cpus]
                vb.memory = server[:memory]
            end
        end
    end
end