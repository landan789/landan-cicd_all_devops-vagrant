id_rsa=$1
id_rsa_pub=$2

echo "================================"
echo "[id_rsa in your PC is ]" # double quot will resolve varibles before it prints
echo "$id_rsa"
echo "================================"

echo "[id_rsa.pub in your PC is ]" # double quot will resolve varibles before it prints
echo "$id_rsa_pub"
echo "================================"

sudo mkdir -p /home/vagrant/.ssh
sudo mkdir -p /root/.ssh

sudo touch /home/vagrant/.ssh/id_rsa
sudo touch /home/vagrant/.ssh/id_rsa.pub

sudo touch /root/.ssh/id_rsa
sudo touch /root/.ssh/id_rsa.pub

# 必须双引号， id_ras 才保留换行符号
sudo echo "$id_rsa" > /home/vagrant/.ssh/id_rsa
sudo echo "$id_rsa_pub" > /home/vagrant/.ssh/id_rsa.pub

sudo echo "$id_rsa" > /root/.ssh/id_rsa
sudo echo "$id_rsa_pub" > /root/.ssh/id_rsa.pub

sudo chmod -R 700 /home/vagrant/.ssh/
sudo chmod -R 700 /root/.ssh/

sudo chown -R vagrant:vagrant /home/vagrant/.ssh/