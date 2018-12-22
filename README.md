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

[3]. 步骤三，到 Virtualbox 官网，安装最新 Virtualbox 版本
```shell
略
```
---------------------------------------
[4]. 步骤四，到 BIOS 开启 CPU 虚拟化技术
```shell
略
```
---------------------------------------

[5]. 步骤五，到此项目的根目录，使用预先打包好的 shell script 替换配置文件
```shell
sh desktop_shells/main.sh
```
---------------------------------------

[6]. 步骤六，置换 球竞技 PHP 环境 变量 (注: 实际 HOST USER PASSWORD DOMAIN ..参数 不同环境会有不同)
```shell
cd /var/wwwroot/new_discuz
sh shell/cp_config.sh
sh shell/sed_mysql.sh 127.0.0.1 root $PASSWORD discuz
sh shell/sed_ucenter_domain.sh qjj8.com
sh shell/sed_mysqldump_domain.sh qjj8.com 2018-1206-1140
```

---------------------------------------
[7]. 步骤七，到 MySQL 主机安装 导入 数据 (注: 实际 HOST USER PASSWORD DOMAIN ..参数 不同环境会有不同)
```shell
mysql -u root -p -h $HOST < mysqldump/default.sql
```

---------------------------------------

[8]. 步骤八，使用浏览器 访问 球竞技 论坛网址
```shell
略
```
---------------------------------------

[9]. 步骤九，使用浏览器 在 球竞技 论坛网址 后台界面 清除 cache
```shell
后台界面 > 工具 > 更新缓存 > (数据缓存, 模板缓存, DIY 模块分类缓存) 都打 √ > 确定
后台界面 > 应用 > [AIUI]手机管理 > [AIUI]手机管理 > 更新手机缓存 > 确定
后台界面 > 全局 > 性能优化 > 内存优化 > 内存清理
后台界面 > 门户 > HTML管理 > 清理的HTML > 都打 √ > 提交
后台界面 > UCenter > 更新缓存 > (更新数据缓存, 更新模板缓存) 都打 √ > 提交
```
---------------------------------------

[10]. 步骤十，完成
```shell
略
```
---------------------------------------