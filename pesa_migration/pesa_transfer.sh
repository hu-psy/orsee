old_db=$1
new_db=$2

if [ -z "$old_db" ]; then
    old_db="pesa"
fi

if [ -z "$new_db" ]; then
    new_db="pesa2019"
fi

#!/bin/bash
array=(pesa_transfer_experiment_types.sql
pesa_add_online_experiment_table.sql
pesa_transfer_experiments.sql
pesa_transfer_sessions.sql
pesa_transfer_bulk_mail_texts.sql
pesa_transfer_lang_labs.sql
pesa_transfer_faqs.sql
pesa_transfer_rules_and_privacy.sql
pesa_transfer_experiment_classes.sql
pesa_transfer_experiment_session_invitation_mail.sql
pesa_transfer_experiment_session_reminder_mail.sql
pesa_transfer_remove_profile_fields.sql
pesa_transfer_participants.sql
pesa_modify_profile_fields.sql
pesa_modify_template.sql
pesa_transfer_participate_at.sql
pesa_transfer_contact.sql
pesa_transfer_impressum.sql
pesa_transfer_subpools.sql
pesa_transfer_mail.sql
pesa_transfer_welcome.sql
pesa_set_options.sql
pesa_set_rights.sql
pesa_add_mail_templates.sql
pesa_add_cron_job.sql
pesa_fix_email.sql
pesa_fix_labs.sql
pesa_set_new_experiment_types.sql
pesa_add_new_options.sql
pesa_add_new_lang_symbols.sql
pesa_add_new_public_content.sql
pesa_extend_admin.sql
pesa_update_error_message.sql
pesa_set_objects.sql
pesa_remove_options.sql)

# transfering or_admin, this requires a .htaccess file
cat ./pesa_transfer_admin.sh | sed "s/##new_db##/$new_db/g" | sed "s/##old_db##/$old_db/g" | bash

for sql_file in ${!array[@]}
do
	#echo "$sql_file ${array[$sql_file]}"
	echo ${array[$sql_file]}
	cat ${array[$sql_file]} | sed "s/##new_db##/$new_db/g" | sed "s/##old_db##/$old_db/g" | mysql
done
