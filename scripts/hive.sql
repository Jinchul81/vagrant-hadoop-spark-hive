create user 'hive'@'localhost' identified by 'hive';
grant all privileges on *.* to 'hive'@'localhost';
create user 'hive'@'%' identified by 'hive';
grant all privileges on *.* to 'hive'@'%';
drop database if exists hive_metastore_db;
create database hive_metastore_db;
flush privileges;
