# 使用Docker Compose搭建NextCloud

## 开启的功能

> 其实就是我自用的一套服务的docker打包

* 专为小内存机控制了数据库内存占用(100M-)
* ssl & http2
* 运行于nextcloud容器中的aria2
* 安装nextcloud容器缺失的cron(do not work...?)

## 配置

* 安装`docker` `pip`
* 安装`docker-compose`
* 拉取本项目
* 理论上compose文件夹应处于`/root/nextcloud/compose`
* 运行于nginx容器中的v2ray

__需要填写的地方:__

`/root/nextcloud/compose/docker-compose.yml`:

* NEXTCLOUD_TRUSTED_DOMAINS
* MYSQL_ROOT_PASSWORD

__需要修改的地方:__

`/root/nextcloud/mysql/init/init.sql`:

* \<dbpassword\>: 替换, 作为nextcloud数据库密码

`/root/nextcloud/compose/init/nginx.conf`

nginx证书路径

* ssl_certificate
* ssl_certificate_key

`/root/nextcloud/compose/init/aria2.conf`

aria2证书路径

* rpc-certificate
* rpc-certificate-key

__需要增加的文件__

`/root/v2ray/config.json`

> 由于websocket配置文件比较烂大街, 我自己配置v2ray又比较熟, 鉴于配置文件其实比较sensitive, 我就不传了. 需要请自行解决.

## 启动容器

~~~ shell
docker-compose pull
docker-compose up -d
~~~

## 安装界面

* 数据目录: /var/www/html/data
* 数据库用户: nextclouduser
* 数据块密码: \<dbpassword\>处的密码
* 数据库名: nextcloud
* 数据库地址: database

## 挂载

在NextCloud应用中开启外部存储, 在NextCloud设置中添加本地存储, 挂载的目录默认为`/usr/Downloads`. 要修改之, 参见`compose/init/aria2.conf`(下载目录), `compose/docker-compose.yml`(安装脚本).

## FAQ

* 重建了nextcloud容器, nextcloud进入安装界面, 重新建立原来的管理员账号提示已存在

  1. 删掉数据库. 位于`/root/nextcloud/mysql`
  2. 进入nextcloud容器, 修改`/var/www/html/config/config.php`, 在其中适当位置加入`'installed' => true,`. (适当位置大概就是在数据库配置的旁边...)
