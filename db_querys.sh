#!/bin/sh

M_PID=$(docker ps | grep db_twal_mariadb_1 | awk '{print $1}')
docker exec -it $M_PID mysql -uroot -proot mysql -e "CREATE DATABASE TWAL_DB default character set utf8mb4"
docker exec -it $M_PID mysql -uroot -proot mysql -e " create table if not exists TWAL_DB.CANDI_TBL ( HASH VARCHAR(64) NULL, TITLE VARCHAR(128) NULL, ADD_TIME INT NULL, CATEGORY VARCHAR(16) NULL, SITENAME VARCHAR(64) NULL )"
docker exec -it $M_PID mysql -uroot -proot mysql -e "ALTER TABLE CANDI_TBL add constraint ret_hash primary key (hash)"
docker exec -it $M_PID mysql -uroot -proot mysql -e "ALTER TABLE CANDI_TBL CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
docker exec -it $M_PID mysql -uroot -proot mysql -e "create table if not exists TWAL_DB.RUN_TBL ( HASH VARCHAR(64) NULL, TITLE VARCHAR(128) NULL, ADD_TIME INT NULL, CATEGORY VARCHAR(16) NULL, SITENAME VARCHAR(64) NULL )"
docker exec -it $M_PID mysql -uroot -proot mysql -e "ALTER TABLE RUN_TBL add constraint ret_hash primary key (hash)"
docker exec -it $M_PID mysql -uroot -proot mysql -e "ALTER TABLE RUN_TBL CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
docker exec -it $M_PID mysql -uroot -proot mysql -e "create table if not exists TWAL_DB.RET_TBL ( HASH VARCHAR(64) NULL, TITLE VARCHAR(128) NULL, RET_TIME INT NULL, CATEGORY VARCHAR(16) NULL, SITENAME VARCHAR(64) NULL )"
docker exec -it $M_PID mysql -uroot -proot mysql -e "ALTER TABLE RET_TBL add constraint ret_hash primary key (hash)"
docker exec -it $M_PID mysql -uroot -proot mysql -e "ALTER TABLE RET_TBL CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
docker exec -it $M_PID mysql -uroot -proot mysql -e "create user 'twal'@'%' identified by 'dhthfl'"
docker exec -it $M_PID mysql -uroot -proot mysql -e "grant all privileges on TWAL_DB.* to twal@%"
