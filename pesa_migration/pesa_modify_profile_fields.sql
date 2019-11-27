update ##new_db##.or_profile_fields set properties = "|name_lang|===|gender|+=+|admin_only|===|n|+=+|allow_sort_in_session_participants_list|===|n|+=+|check_unique_on_edit_page|===|n|+=+|cols|===|40|+=+|compulsory|===|y|+=+|default_value|===||+=+|error_message_if_empty_lang|===|you_have_to_gender|+=+|error_message_if_no_regexp_match_lang|===||+=+|include_in_statistics|===|pie|+=+|include_none_option|===|n|+=+|order_select_lang_values|===|alphabetically|+=+|link_as_email_in_lists|===|n|+=+|list_in_session_participants_list|===|n|+=+|list_in_session_pdf_list|===|n|+=+|maxlength|===|100|+=+|option_values_lang|===|gender_m,gender_f,gender_d|+=+|option_values|===|m,f,d|+=+|perl_regexp|===||+=+|require_unique_on_create_page|===|n|+=+|rows|===|3|+=+|search_include_in_experiment_assign_query|===|y|+=+|search_include_in_participant_query|===|y|+=+|search_result_allow_sort|===|n|+=+|search_result_sort_order|===||+=+|searchresult_list_in_experiment_assign_results|===|n|+=+|searchresult_list_in_participant_results|===|n|+=+|size|===|40|+=+|subpools|===|all|+=+|unique_on_create_page_email_regmail_confmail_again|===|n|+=+|unique_on_create_page_error_message_if_exists_lang|===||+=+|unique_on_create_page_tell_if_deleted|===|n|+=+|unique_on_edit_page_error_message_if_exists_lang|===||+=+|value_begin|===|0|+=+|value_end|===|1|+=+|value_step|===|0|+=+|values_reverse|===|n|+=+|wrap|===|virtual|" where mysql_column_name = "gender";

insert into ##new_db##.or_profile_fields
values ('year_of_birth', 1, 'select_numbers', '|name_lang|===|year_of_birth|+=+|admin_only|===|n|+=+|allow_sort_in_session_participants_list|===|n|+=+|check_unique_on_edit_page|===|n|+=+|cols|===|40|+=+|compulsory|===|y|+=+|default_value|===||+=+|error_message_if_empty_lang|===|you_have_to_year_of_birth|+=+|error_message_if_no_regexp_match_lang|===|you_have_to_year_of_birth|+=+|include_in_statistics|===|pie|+=+|include_none_option|===|y|+=+|order_select_lang_values|===|alphabetically|+=+|order_radio_lang_values|===|alphabetically|+=+|link_as_email_in_lists|===|n|+=+|list_in_session_participants_list|===|n|+=+|list_in_session_pdf_list|===|n|+=+|maxlength|===|100|+=+|option_values_lang|===||+=+|option_values|===||+=+|perl_regexp|===|/^\\d{4}$/|+=+|require_unique_on_create_page|===|n|+=+|rows|===|3|+=+|search_include_in_experiment_assign_query|===|y|+=+|search_include_in_participant_query|===|y|+=+|search_result_allow_sort|===|n|+=+|search_result_sort_order|===||+=+|searchresult_list_in_experiment_assign_results|===|n|+=+|searchresult_list_in_participant_results|===|n|+=+|size|===|40|+=+|subpools|===|all|+=+|unique_on_create_page_email_regmail_confmail_again|===|n|+=+|unique_on_create_page_error_message_if_exists_lang|===||+=+|unique_on_create_page_tell_if_deleted|===|n|+=+|unique_on_edit_page_error_message_if_exists_lang|===||+=+|value_begin|===|func:(int) date("Y")-120|+=+|value_end|===|func:(int) date("Y")-18|+=+|value_step|===|1|+=+|values_reverse|===|y|+=+|wrap|===|virtual|');
