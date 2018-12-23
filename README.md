## 首次安装步骤

[1]. 步骤一，使用 git clone 下载此仓库代码
```shell
略
```
---------------------------------------

[2]. 步骤二，到 Vagrant 官网，安装最新 Vagrant 版本
```shell
略
```
---------------------------------------

[3]. 步骤三，到 Virtualbox 官网，安装最新 Virtualbox 版本 (也可以使用 hyper-v VmWare, 等 但推薦 Virtualbox)
```shell
略
```
---------------------------------------
[4]. 步骤四，到 PC BIOS 开启 CPU 虚拟化技术
```shell
略
```
---------------------------------------

[5]. 步骤五，到此项目的根目录，使用预先打包好的 shell script 替换配置文件 (如果收悉配置，可以自己手动修改)
```shell
sh vagrant_shells/main.sh
```
---------------------------------------

[6]. 步骤六，置 vars/nodes.yml , 做进阶 配置 (一般可跳过)
```shell
略
```

---------------------------------------
[7]. 步骤七，置 Vagrantfile , 做进阶 配置 (一般可跳过)
```shell
略
```

---------------------------------------

[8]. 步骤八，於 Windows (或 MAC ) 安裝 vagrant 插件
```shell
vagrant plugin install vagrant-vbguest
```

[9]. 步骤九，利用 vagrant 启动虚拟机
```shell
vagrant up
```

[10]. 步骤十，利用 vagrant , 於 Linux 強制 執行 linux_shells/*.sh  
```shell
vagrant up --provision
```

[11]. 步骤十一，利用 vagrant halt, 關閉所有虛擬機
```shell
vagrant halt
```

[12]. 步骤十二，利用 vagrant up, 再次開啟所有虛擬機
```shell
vagrant up
```

[13]. 步骤十三，使用 Xshell 或 MobaXterm ，ssh 登入 VM (USERNAME:vagrant, IP:127.0.0.1, PORT:2222)
```shell
略
```

[14]. 步骤十四，完成
```shell
略
```

[*]. *，利用 vagrant realod, 重啟所有虛擬機
```shell
vagrant reload
```

[*]. *，利用 vagrant up, 開啟所有虛擬機
```shell
vagrant reload
```

[*]. *，利用 vagrant halt, 關閉所有虛擬機
```shell
vagrant halt
```

[*]. *，利用 vagrant status, 查看所有虛擬機
```shell
vagrant status
```

[*]. *，利用 vagrant ssh-config, 查看所有虛擬機 ssh 設定
```shell
vagrant ssh-config
```