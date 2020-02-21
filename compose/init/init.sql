create database nextcloud;
create user 'nextclouduser'@'%' identified by '<dbpassword>'
grant all privileges on nextcloud.* to 'nextclouduser'@'%' with grant option;
flush privileges;