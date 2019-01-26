etc_hosts=$3


# 必须双引号， id_ras 才保留换行符号
sudo echo "$etc_hosts" > /etc/hosts
