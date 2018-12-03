ssh_key=$1

echo "================================"
echo "[ssh key in your PC is ]" # double quot will resolve varibles before it prints
echo "$ssh_key"
echo "================================"

sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sudo service sshd restart
touch /home/vagrant/.ssh/authorized_keys
echo $ssh_key >> /home/vagrant/.ssh/authorized_keys