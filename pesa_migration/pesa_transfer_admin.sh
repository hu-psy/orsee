#!/bin/bash

if [ ! -r htaccess ]; then
    echo "htaccess file doesn't exists or is not readable"
    exit 1
fi

admins=($(grep "Require user" htaccess | sed "s/Require user//g"))
len=${#admins[@]}
last=${admins[$len-1]}

or_clause="("

for admin in ${!admins[@]}
do
	if [ "${admins[$admin]}" = "$last" ]; then
		or_clause="$or_clause adminname = '${admins[$admin]}'"
	else 
		or_clause="$or_clause adminname = '${admins[$admin]}' or "
	fi
done
or_clause="$or_clause)"

mysql -Nse "insert into ##new_db##.or_admin(admin_id, fname, lname, email, adminname, admin_type, experimenter_list, language, get_calendar_mail, get_statistics_mail) 
                                select admin_id, fname, lname, email, adminname, admin_type, experimenter_list, language, get_calendar_mail, get_statistics_mail from ##old_db##.or_admin 
                                    where fname <> 'Warning' 
                                    and admin_id > 1
                                    and ${or_clause};"
