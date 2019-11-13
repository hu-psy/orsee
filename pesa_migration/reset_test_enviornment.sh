#!/bin/bash

# drop pesa2019
# mysql -e 'drop database pesa'
# create pesa2019
# mysql -e 'create database pesa DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;'
# clear pesa2019 tables
mysql -Nse 'show tables in pesa' | while read table; do mysql -e "truncate table pesa.$table"; done
# re-init tables
mysql pesa < ../install/install.sql

# clear and load old pesa
mysql pesa -e 'drop database oldpesa'
mysql < pesa.20190402.sql

