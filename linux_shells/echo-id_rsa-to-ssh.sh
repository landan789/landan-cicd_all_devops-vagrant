id_rsa=$1
id_rsa_pub=$2

echo "================================"
echo "[id_rsa in your PC is ]" # double quot will resolve varibles before it prints
echo "$id_rsa"
echo "================================"

echo "[id_rsa.pub in your PC is ]" # double quot will resolve varibles before it prints
echo "$id_rsa_pub"
echo "================================"

mkdir -p /home/vagrant/.ssh
mkdir -p /root/.ssh

touch /home/vagrant/.ssh/id_rsa
touch /home/vagrant/.ssh/id_rsa.pub

touch /root/.ssh/id_rsa
touch /root/.ssh/id_rsa.pub

echo $id_rsa > /home/vagrant/.ssh/id_rsa
echo $id_rsa_pub > /home/vagrant/.ssh/id_rsa.pub

echo $id_rsa > /root/.ssh/id_rsa
echo $id_rsa_pub > /root/.ssh/id_rsa.pub