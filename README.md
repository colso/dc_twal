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

* Initialize DB using shell script

``` # ./db_querys.sh ```

Mount Database and Download disk
--------------------------------

* Bind mount position

``` # mount --bind <database disk position> ~/dc_twal/data ```

``` # mount --bind <transmission complete disk position> ~/dc_twal/transmission-data ```

start all component
-------------------

``` # docker-compose up -d ```

