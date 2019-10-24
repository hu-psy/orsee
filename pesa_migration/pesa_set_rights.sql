/* remove rights */
update ##new_db##.or_admin_types set rights=replace(rights, ",participants_bulk_mail", "") where type_name="experimenter";
update ##new_db##.or_admin_types set rights=replace(rights, ",participants_edit", "") where type_name="experimenter";
update ##new_db##.or_admin_types set rights=replace(rights, ",participants_change_status", "") where type_name="experimenter";
update ##new_db##.or_admin_types set rights=replace(rights, ",participants_show", "") where type_name="experimenter";
update ##new_db##.or_admin_types set rights=replace(rights, ",experiment_restriction_override", "") where type_name="experimenter";

/* add rights */
update ##new_db##.or_admin_types set rights=concat(rights, ",experiment_change_sender_address") where type_name="experimenter";
