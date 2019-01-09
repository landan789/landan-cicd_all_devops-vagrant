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


read -p "请输入Windows PC 或 MAC 中 ssh 资料夹位置 (如: C:/Users/landan/.ssh/ ):  "  ssh_dir

case $ssh_dir in
    "") 
        echo "[EXIT] ..."
        exit
        ;;
    *)
        ;;
esac


sed -i "s/SED_NAME/${name}/g" ./vars/project.yml
sed -i "s|SED_SSH_DIR|${ssh_dir}|g" ./vars/project.yml

read -p "是否使用單機模式(y/n):  "  yn

case $yn in
    "n") 
        echo "使用多虛擬機開發模式"
        sed -i "s/##//g" ./vars/nodes.yml
        echo "[EXIT] ..."
        exit
        ;;
    *)
        echo "使用單虛擬機開發模式"
        echo "[EXIT] ..."
        exit
        ;;
esac
