#!/bin/bash
DBNAME="$1"
DBPASSWD="$2"

if [ -z "$DBNAME" ]; then
    echo "DBNAME not set!"
    exit -1
fi

if [ -z "$DBPASSWD" ]; then
    echo "DBPASSWD not set!"
    exit -1
fi

# create database and user
echo "CREATE DATABASE $DBNAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL PRIVILEGES ON $DBNAME.* to $DBNAME@localhost IDENTIFIED BY '$DBPASSWD';
FLUSH PRIVILEGES;" | mysql

# orsee's own initialization
mysql $DBNAME < ../install/install.sql

# copy settings
cp ../install/settings-dist.php ../config/settings.php

perl -i -p -e 's/settings\_\_root\_to\_server=\"\/srv\/www\/htdocs/settings\_\_root\_to\_server=\"\/var\/www\/html/' ../config/settings.php
perl -i -p -e 's/settings\_\_root\_directory=\"\/orsee/settings\_\_root\_directory=\"\/pesa/' ../config/settings.php
perl -i -p -e 's/settings\_\_server\_url=\"127\.0\.0\.1/settings\_\_server\_url=\"141\.20\.68\.17/' ../config/settings.php
perl -i -p -e 's/settings\_\_server\_protocol=\"http/settings\_\_server\_protocol=\"https/' ../config/settings.php 
perl -i -p -e 's/site\_\_database\_database=\"orsee\_db/site\_\_database\_database=\"''$DBNAME''/' ../config/settings.php
perl -i -p -e 's/site\_\_database\_admin\_username=\"orsee_user/site\_\_database\_admin\_username=\"''$DBNAME''/' ../config/settings.php
perl -i -p -e 's/site\_\_database\_admin\_password=\"orsee\_pw/site\_\_database\_admin\_password=\"''$DBPASSWD''/' ../config/settings.php
perl -i -p -e 's/date\_default\_timezone\_set\(\"Australia\/Sydney/date\_default\_timezone\_set\(\"Europe\/Berlin/' ../config/settings.php

perl -i -p -e 's/ORSEEROOT=\/srv\/www\/htdocs\/orsee/ORSEEROOT=\/var\/www\/html\/pesa/' ../install/crontab-for-orsee
perl -i -p -e 's/test/root test/' ../install/crontab-for-orsee
cp ../install/crontab-for-orsee /etc/cron.d/orsee
