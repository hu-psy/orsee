#61  Feature clear participants
 - add cronjob for deleting unsubscribed participants which are not referenced by any session
#53 reset participant data when unsubscribe
 - if a participant is unsubscribed or unsubscribes its data will be set to NULL there possible or set to a default value
#52 auto delete experiments
 - cron job for deleting finished experiments
 - add options to modify the time limits
#51 auto finish experiments
 - cron job for finishing experiments after a certain amount of time with no sessions
 - add option to modify time limits
#48 hide statistics for experimenter
 - hide statistics and remove access rights for experimenter
#46 expiring experimenter accounts
 - extends database (new columns)
 - cron job for disabling/deleting expired accounts
 - warning mails
 - add options to modify time limits
#45 auto exclusion inactive participants
 - extends database (new columns)
 - cron job for unsubscribing expired accounts
 - warning mails
 - add options to modify time limits
#44 show parts of the subject of the invitation mail as criteria
 - show subject before a participant can register for a session
#43 improve mail form
 - example subject
 - fill empty message parts with parts from another languages
 - enforce at least one subject and message body
#42 registration and cancellation limits for sessions
 - extends database (new column)
 - add option for showing cancelation limit
 - remove conflicting option
 - add defaults for limits
#40 modify query builder
 - remove some options of and add new filter to the query builder used for selecting participants for assigning to experiments or editing
#38 Feature/default experiment finish
 - cron job for finishing experiments
#37 Feature/criteria
 - remove unwanted profile fields, extend gender and add year of birth as profile field
#34 Feature/stats
 - add some queries for statistics
#29,#33,#31,#32   Feature/minimal support for online experiments
 - extends database (new table)
 - email placeholder
#28 modify regex to match parameter without trailing characters and to ig…
 - fix bug in orsee
#24 closes sessions automatically, set participation status to 'participa…
 - participant status as participated by default
 - add cron job for closing sessions
#23 Feature/subscriptions based on payment and online
 - new binary participant subscriptions only payment and only online
#22,#30 add line between submenue elements
 - css styling of query builder
#14,#17 first version of privacy policy for admins
 - adds privacy policy for admins/experimenter
 - extends database (new column)
#11 Feature/default email
 - add new option for setting the email to the experimenter's mail by default if the sender mail is editable
 - allow only for hu-berlin or psychologie.hu-berlin email addresses
#8,#19,#20 Feature/participant registered notification
 - notify an experimenter if a participant registers or cancels a session
#6,#18 introduce new experiment types
 - new experiment types with and without payment
#5 Feature/default experiment restriction
 - restricts access to experiments for experimenter to the experiments to which they belong
#4 Feature/experimenter email as sender email
 - add new option for setting the sender mail to the one of the first experimenter by default if sender mail is not editable
#2,#3,#7,#9,#10,#12,#13,#15,#16,#21,#25,#26,#27,#60,#59,#58,#57,#56,#55,#54,#50,#49,#36,#35,#47,#41,#39 Feature/pesa migration
 - scripts used in migration (shell and python scripts in pesa_migration and utils)
 - creating config (db name, db user, time zone etc)
 - setting of existing options
 - activating existing cron jobs
 - setting user rights
 - helper scripts for setting up test instance of orsee
 - etherpad imports
 - disable ethics and email module
#1 use ldap for admin login
 - use hu ldap for login
