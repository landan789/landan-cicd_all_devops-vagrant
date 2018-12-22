#!/bin/bash
read -p "请输入项目名称:  " name 

case $name in
    "") 
        echo "[EXIT] ..."
        exit
        ;;
    *)
        ;;
esac


read -p "请输入Windows PC 或 MAC 中 id_rsa.pub 位置:  "  idrsa_pub

case $idrsa_pub in
    "") 
        echo "[EXIT] ..."
        exit
        ;;
    *)
        ;;
esac


sed -i "s/CP_NAME/${name}/g" ./vars/env.yml
sed -i "s/CP_IDRSA_PUB/${idrsa_pub}/g" ./vars/env.yml
