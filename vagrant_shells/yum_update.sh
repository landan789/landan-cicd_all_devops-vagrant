echo "[yum started updating ... ]"
sudo yum -y update
sudo yum install -y kernel-headers kernel-devel
echo "[yum finished updating ... ]"