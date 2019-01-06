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
