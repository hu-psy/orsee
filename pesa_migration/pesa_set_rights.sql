update ##new_db##.or_admin_types set rights=replace(rights, ",experiment_restriction_override", "") where type_name="experimenter";
update ##new_db##.or_admin_types set rights=concat(rights, ",experiment_change_sender_address") where type_name="experimenter";
