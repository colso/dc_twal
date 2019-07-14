DC_TWAL (docker-compose TWAL)
=============================

Install Docker and Docker-Compose 
---------------------------------

start mariaDB
-------------

``` # docker-compose build mariadb ```

``` # docker-compose up -d maradb ```

Initialze DB, Table and User
----------------------------

* Access to DB runinng in docker 

``` # ID=$(docker ps | grep twal_mariadb_1 | awk '{print $1}') ```

``` # docker exec -it $ID /bin/bash ```

* Create Database 

``` MariaDB [(none)]> CREATE DATABASE TWAL_DB default character set utf8mb4; ```

* Create Table

``` MariaDB [(none)]> create table if not exists  TWAL_DB.CANDI_TBL ( HASH VARCHAR(64) NULL, TITLE VARCHAR(128) NULL, ADD_TIME INT NULL, CATEGORY VARCHAR(16) NULL, SITENAME VARCHAR(64) NULL );```

``` MariaDB [(none)]> use TWAL_DB ```

``` MariaDB [(TWAL_DB)]> alter table CANDI_TBL add constraint ret_hash primary key (hash);```

``` MariaDB [(none)]> ALTER TABLE CANDI_TBL CONVERT TO CHARACTER SET  utf8mb4 COLLATE  utf8mb4_unicode_ci;```

```create table if not exists  TWAL_DB.RUN_TBL ( HASH VARCHAR(64) NULL, TITLE VARCHAR(128) NULL, ADD_TIME INT NULL, CATEGORY VARCHAR(16) NULL, SITENAME VARCHAR(64) NULL );```

```alter table RUN_TBL add constraint ret_hash primary key (hash);```

```ALTER TABLE RUN_TBL CONVERT TO CHARACTER SET  utf8mb4 COLLATE  utf8mb4_unicode_ci;```

```create table if not exists  TWAL_DB.RET_TBL ( HASH VARCHAR(64) NULL, TITLE VARCHAR(128) NULL, RET_TIME INT NULL, CATEGORY VARCHAR(16) NULL, SITENAME VARCHAR(64) NULL );```

```alter table RET_TBL add constraint ret_hash primary key (hash);```

```ALTER TABLE RET_TBL CONVERT TO CHARACTER SET  utf8mb4 COLLATE  utf8mb4_unicode_ci;```


* Create User 

``` create user 'twal'@'%' identified by 'dhthfl'; ```

``` grant all privileges on TWAL_DB.* to twal@%; ```

Mount Database and Download disk
--------------------------------

* Bind mount position

``` # mount --bind <database disk position> ~/dc_twal/data ```

``` # mount --bind <transmission complete disk position> ~/dc_twal/transmission-data ```

start all component
-------------------

``` # docker-compose up -d ```

