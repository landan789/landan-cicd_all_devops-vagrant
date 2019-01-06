## 预先安装步骤
[1]. 步骤一，Windows or MAC 中下载 git 并安装
``` OS
略
```
---------------------------------------

[2]. 步骤二，产生 ssh key
```shell
ssh-keygen
```
---------------------------------------

[3]. 步骤三，将 ssh key 放置 你 git 用户 的 ssh key 列表，在公司的 GIT 服务器 
```shell
略
```
---------------------------------------

## 首次安装步骤

[1]. 步骤一，使用 git clone 下载此仓库代码
```shell
略
```
---------------------------------------

[2]. 步骤二，到 Vagrant 官网，安装最新 Vagrant 版本
```OS
略
```
---------------------------------------

[3]. 步骤三，到 Virtualbox 官网，安装最新 Virtualbox 版本 (也可以使用 hyper-v VmWare, 等 但推薦 Virtualbox)
```OS
略
```
---------------------------------------
[4]. 步骤四，到 PC BIOS 开启 CPU 虚拟化技术
```BIOS
略
```
---------------------------------------

[5]. 步骤五，到 Windows Update 更新 Win 版本
```OS
略
```
---------------------------------------

[6]. 步骤六，若为 Win 7 ，请安装 Power shell 3 或更高版本 (https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell?view=powershell-6)
```OS
略
```
---------------------------------------

[7]. 步骤七，到此项目的根目录，使用预先打包好的 shell script 替换配置文件 (如果收悉配置，可以自己手动修改)
```shell
sh vagrant_shells/main.sh
```
---------------------------------------

[8]. 步骤八，置 vars/nodes.yml , 做进阶 配置 (一般可跳过)
```IDE
略
```
---------------------------------------
[9]. 步骤九，置 Vagrantfile , 做进阶 配置 (一般可跳过)
```IDE
略
```
---------------------------------------

[10]. 步骤十，於 Windows (或 MAC ) 安裝 vagrant 插件
```shell
vagrant plugin install vagrant-vbguest
```
---------------------------------------

[11]. 步骤十一，利用 vagrant 启动虚拟机
```shell
vagrant up
```
---------------------------------------

[12]. 步骤十二，利用 vagrant , 於 Linux 強制 執行 linux_shells/*.sh  
```shell
vagrant up --provision
```
---------------------------------------

[13]. 步骤十三，利用 vagrant halt, 關閉所有虛擬機
```shell
vagrant halt
```
---------------------------------------

[14]. 步骤十四，利用 vagrant up, 再次開啟所有虛擬機
```shell
vagrant up
```
---------------------------------------

[15]. 步骤十五，使用 Xshell 或 MobaXterm ，ssh 登入 VM (USERNAME:vagrant, IP:127.0.0.1, PORT:2222)
```shell
略
```
---------------------------------------

[16]. 步骤十六，完成
```shell
略
```
---------------------------------------

[*]. *，利用 vagrant realod, 重啟所有虛擬機
```shell
vagrant reload
```
---------------------------------------

[*]. *，利用 vagrant up, 開啟所有虛擬機
```shell
vagrant up
```
---------------------------------------

[*]. *，利用 vagrant halt, 關閉所有虛擬機
```shell
vagrant halt
```
---------------------------------------

[*]. *，利用 vagrant status, 查看所有虛擬機
```shell
vagrant status
```
---------------------------------------

[*]. *，利用 vagrant ssh-config, 查看所有虛擬機 ssh 設定
```shell
vagrant ssh-config
```

---------------------------------------

[*]. 注意事项
```shell
vagrant 必须更新 windows 版本
```

---------------------------------------