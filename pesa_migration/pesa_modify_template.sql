update ##new_db##.or_objects set item_details =
'|Array|===||+=+|current_template|===|<table style="width: 50%; max-width: 500px">
\n
\n    <tr #error_email#> 
\n
\n        <td>lang[e-mail-address]<br>
\n
\n            #email#</td>
\n
\n    </tr> 
\n
\n
\n
\n{ #multiple_participant_languages_exist# 
\n
\n    <tr #error_language#>
\n
\n        <td>lang[language]<BR>
\n
\n            #language#</td>
\n
\n    </tr> }
\n
\n 
\n
\n    <tr #error_subscriptions#>
\n
\n        <td>
\n
\n        { #is_not_admin# lang[i_want_invitations_for] }
\n
\n        { #is_admin# lang[invitations] }
\n
\n            <BR>#subscriptions#</td>
\n
\n    </tr>
\n
\n    <tr #error_gender#>
\n
\n        <td>lang[gender]<BR>
\n
\n            #gender#</td>
\n
\n    </tr>
\n
\n    <tr #error_year_of_birth#>
\n
\n        <td>lang[year_of_birth]<BR>
\n
\n            #year_of_birth#</td>
\n
\n    </tr>
\n
\n
\n
\n{ #is_subjectpool_2#    
\n
\n    <tr #error_field_of_studies#>
\n
\n        <td>lang[studies]<BR>
\n
\n            #field_of_studies#</td>
\n
\n
\n
\n    <tr #error_begin_of_studies#>
\n
\n        <td>lang[begin_of_studies]<br>
\n
\n            #begin_of_studies#</td>
\n
\n    </tr>
\n
\n}
\n
\n\t\t
\n
\n{ #is_subjectpool_3#    
\n
\n    <tr #error_profession#>
\n
\n        <td>lang[profession]<br>
\n
\n            #profession#</td>
\n
\n    </tr>
\n
\n}
\n
\n\t\t
\n
\n{ #is_subjectpool_4#    
\n
\n    <tr #error_field_of_studies#>
\n
\n        <td>lang[studies]<BR>
\n
\n            #field_of_studies#</td>
\n
\n
\n
\n    <tr #error_begin_of_studies#>
\n
\n        <td>lang[begin_of_studies]<br>
\n
\n            #begin_of_studies#</td>
\n
\n    </tr>
\n
\n
\n
\n    <tr #error_profession#>
\n
\n        <td>lang[profession]<br>
\n
\n            #profession#</td>
\n
\n    </tr>
\n
\n}
\n
\n</table>|+=+|current_draft|===||'
where item_id=1;
