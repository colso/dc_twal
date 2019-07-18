DC_TWAL (docker-compose TWAL)
=============================

Install Docker and Docker-Compose 
---------------------------------

https://docs.docker.com/compose/install/

start mariaDB
-------------

``` # docker-compose build mariadb ```

``` # docker-compose up -d maradb ```

Initialze DB, Table and User
----------------------------

* Initialize DB using shell script

``` # chmod +x db_querys.sh && ./db_querys.sh ```

Mount Database and Download disk
--------------------------------

* Bind mount position

``` # mount --bind <database disk position> ~/dc_twal/data ```

``` # mount --bind <transmission complete disk position> ~/dc_twal/transmission-data ```

start all component
-------------------

``` # docker-compose up -d ```

Set charset for web
-------------------

``` # ./web_set_charset.sh ```
