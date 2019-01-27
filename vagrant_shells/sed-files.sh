#!/bin/bash
echo ""
read -p "请输入项目名称:  " name 

case $name in
    "") 
        echo "[EXIT] ..."
        exit
        ;;
    *)
        ;;
esac

echo ""
read -p "请输入 Windows PC 或 MAC OS 中 ssh 资料夹位置 (如: C:/Users/landan/.ssh/ ):  "  ssh_dir

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

echo ""
read -p "是否使用 單虛擬機 模式 (y/n):  "  yn

case $yn in
    "n") 
        echo "使用 多虛擬機 (multiple VM) 開發模式"
        sed -i "s/'off' # multiple/'on' # multiple/g" ./vars/nodes.yml
        echo ""
        echo "[EXIT] ..."
        exit
        ;;
    *)
        echo "使用 單虛擬機 (single VM) 開發模式"
        sed -i "s/'off' # single/'on' # single/g" ./vars/nodes.yml
        echo ""
        echo "[EXIT] ..."
        exit
        ;;
esac
