update ##new_db##.or_objects set item_details =
'Array|===||+=+|current_template|===|<table style="width: 50%; max-width: 500px">
\n    <tr #error_email#> 
\n        <td>lang[e-mail-address]<br>
\n            #email#</td>
\n    </tr> 
\n
\n{ #multiple_participant_languages_exist# 
\n    <tr #error_language#>
\n        <td>lang[language]<BR>
\n            #language#</td>
\n    </tr> }
\n 
\n    <tr #error_subscriptions#>
\n        <td>
\n        { #is_not_admin# lang[i_want_invitations_for] }
\n        { #is_admin# lang[invitations] }
\n            <BR>#subscriptions#</td>
\n    </tr>
\n
\n{ #is_not_admin#
\n    <tr>
\n        <td>lang[optional_fields_follow]</td>
\n    </tr> }
\n
\n    <tr #error_gender#>
\n        <td>lang[gender]<BR>
\n            #gender#</td>
\n    </tr>
\n
\n{ #is_subjectpool_2#    
\n    <tr #error_field_of_studies#>
\n        <td>lang[studies]<BR>
\n            #field_of_studies#</td>
\n
\n    <tr #error_begin_of_studies#>
\n        <td>lang[begin_of_studies]<br>
\n            #begin_of_studies#</td>
\n    </tr>
\n}
\n\t\t
\n{ #is_subjectpool_3#    
\n    <tr #error_profession#>
\n        <td>lang[profession]<br>
\n            #profession#</td>
\n    </tr>
\n}
\n\t\t
\n{ #is_subjectpool_4#    
\n    <tr #error_field_of_studies#>
\n        <td>lang[studies]<BR>
\n            #field_of_studies#</td>
\n
\n    <tr #error_begin_of_studies#>
\n        <td>lang[begin_of_studies]<br>
\n            #begin_of_studies#</td>
\n    </tr>
\n
\n    <tr #error_profession#>
\n        <td>lang[profession]<br>
\n            #profession#</td>
\n    </tr>
\n}
\n</table>|+=+|current_draft|===|<table style="width: 50%; max-width: 500px">
\n    <tr #error_email#> 
\n        <td>lang[e-mail-address]<br>
\n            #email#</td>
\n    </tr> 
\n
\n{ #multiple_participant_languages_exist# 
\n    <tr #error_language#>
\n        <td>lang[language]<BR>
\n            #language#</td>
\n    </tr> }
\n 
\n    <tr #error_subscriptions#>
\n        <td>
\n        { #is_not_admin# lang[i_want_invitations_for] }
\n        { #is_admin# lang[invitations] }
\n            <BR>#subscriptions#</td>
\n    </tr>
\n
\n{ #is_not_admin#
\n    <tr>
\n        <td>lang[optional_fields_follow]</td>
\n    </tr> }
\n
\n    <tr #error_gender#>
\n        <td>lang[gender]<BR>
\n            #gender#</td>
\n    </tr>
\n
\n{ #is_subjectpool_2#    
\n    <tr #error_field_of_studies#>
\n        <td>lang[studies]<BR>
\n            #field_of_studies#</td>
\n
\n    <tr #error_begin_of_studies#>
\n        <td>lang[begin_of_studies]<br>
\n            #begin_of_studies#</td>
\n    </tr>
\n}
\n\t\t
\n{ #is_subjectpool_3#    
\n    <tr #error_profession#>
\n        <td>lang[profession]<br>
\n            #profession#</td>
\n    </tr>
\n}
\n\t\t
\n{ #is_subjectpool_4#    
\n    <tr #error_field_of_studies#>
\n        <td>lang[studies]<BR>
\n            #field_of_studies#</td>
\n
\n    <tr #error_begin_of_studies#>
\n        <td>lang[begin_of_studies]<br>
\n            #begin_of_studies#</td>
\n    </tr>
\n
\n    <tr #error_profession#>
\n        <td>lang[profession]<br>
\n            #profession#</td>
\n    </tr>
\n}
\n</table>'
where item_id=1;
