#!/bin/bash

# clear pesa2019 tables
mysql -Nse 'show tables in pesa2019' | while read table; do mysql -e "truncate table pesa2019.$table"; done
# re-init tables
mysql pesa2019 < /var/www/html/pesa2019/install/install.sql

# clear and load old pesa
mysql pesa2019 -e 'drop database pesa'
mysql < pesa.20190613.sql

