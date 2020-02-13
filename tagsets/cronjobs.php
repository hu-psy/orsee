<?php
// part of orsee. see orsee.org


function cron__job_time_select_field($selected) {
    global $lang;
    $jobtimes=array('every_5_minutes','every_15_minutes','every_30_minutes','every_hour','every_2_hours','every_6_hours',
           'every_12_hours','every_day_at_3','every_day_at_8','every_day_at_15','every_day_at_22', 'every_monday_at_8',
           'every_thursday_at_8','every_month_at_1st_at_8', 'every_month_at_15th_at_8');
    echo '<SELECT name="job_time">';
    foreach ($jobtimes as $jobtime) {
        echo '<OPTION value="'.$jobtime.'"';
        if ($jobtime == $selected) echo ' SELECTED';
        echo '>';
        if (isset($lang['cron_job_time_'.$jobtime])) echo $lang['cron_job_time_'.$jobtime];
            else echo $jobtime;
        echo '</OPTION>';
    }
    echo '</SELECT>';
}

function cron__run_cronjobs() {
    $now=time();

    // cronjobs will be executed in that order ...
    $cronjobs=array('check_for_registration_end',
        'check_for_finished_sessions',
        'check_for_finished_experiments',
        'check_for_session_reminders',
        'apply_permanent_queries',
        'process_mail_queue',
        'retrieve_emails',
        'update_participants_history',
        'check_for_noshow_warnings',
        'check_for_participant_exclusion',
        'send_participant_statistics',
        'send_experiment_calendar',
        'run_webalizer',
        'auto_exclusion_inactive_participants');

    $query="SELECT * from ".table('cron_jobs')." WHERE enabled='y'";
    $result=or_query($query);

    $cronprop=array();
    while ($line=pdo_fetch_assoc($result)) {
        $cronprop[$line['job_name']]=$line;
    }

    foreach ($cronjobs as $cronjob) {
        $continue=true;

        // properties exist?
        if (!(isset($cronprop[$cronjob]) && function_exists('cron__'.$cronjob))) $continue=false;

        // is due?
        if ($continue) {
            $due=cron__job_is_due($cronprop[$cronjob],$now);
            if (!$due) $continue=false;
        }


        // run
        if ($continue) {
            // execute job
            $function_name='cron__'.$cronjob;
            $done=$function_name();
            // save and log job
            $ready=cron__save_and_log_job($cronjob,$now,$done);
        }
    }

    clearpixel();
}

function cron__save_and_log_job($cronjob,$now="",$target="") {
    global $expadmindata;
    if (isset($expadmindata['admin_id'])) $id=$expadmindata['admin_id']; else $id="";

    if ($now=="") $now=time();
    $pars=array(':job_last_exec'=>$now,
                ':job_name'=>$cronjob);
    $query="UPDATE ".table('cron_jobs')."
        SET job_last_exec= :job_last_exec
        WHERE job_name= :job_name";
    $done=or_query($query,$pars);

    $done=log__cron_job($cronjob,$target,$now,$id);
    return $done;

}



function cron__job_is_due($cronjob,$now='') {

    if (!$now) $now=time();
    //$now=$now+3; // leave some flexibility
    $lexec=$cronjob['job_last_exec'];
    $jtime=$cronjob['job_time'];
    $due=false;

    switch ($jtime) {
        case 'every_5_minutes':
            $jdiff=5*60;
            if ($lexec + $jdiff < $now+1) $due=true;
            break;
        case 'every_15_minutes':
            $jdiff=15*60;
            if ($lexec + $jdiff < $now+1) $due=true;
            break;
        case 'every_30_minutes':
            $jdiff=30*60;
            if ($lexec + $jdiff < $now+1) $due=true;
            break;
        case 'every_hour':
            $jdiff=60*60;
            if ($lexec + $jdiff < $now+1) $due=true;
            break;
        case 'every_2_hours':
            $jdiff=2*60*60;
            if ($lexec + $jdiff < $now+1) $due=true;
            break;
        case 'every_6_hours':
            $jdiff=6*60*60;
            if ($lexec + $jdiff < $now+1) $due=true;
            break;
        case 'every_12_hours':
            $jdiff=12*60*60;
            if ($lexec + $jdiff < $now+1) $due=true;
            break;
        case 'every_day_at_3':
            $then=mktime(3,0,0);
            if ($lexec <= $then && $now > $then) $due=true;
            break;
        case 'every_day_at_8':
            $then=mktime(8,0,0);
            if ($lexec <= $then && $now > $then) $due=true;
            break;
        case 'every_day_at_15':
            $then=mktime(15,0,0);
            if ($lexec <= $then && $now > $then) $due=true;
            break;
        case 'every_day_at_22':
            $then=mktime(22,0,0);
            if ($lexec <= $then && $now > $then) $due=true;
            break;
        case 'every_monday_at_8';
            $then=mktime(8,0,0);
            $nowarray=getdate($now);
            if ($nowarray['wday']==1 && $lexec <= $then && $now > $then) $due=true;
            break;
        case 'every_thursday_at_8':
            $then=mktime(8,0,0);
            $nowarray=getdate($now);
            if ($nowarray['wday']==4 && $lexec <= $then && $now > $then) $due=true;
            break;
        case 'every_month_at_1st_at_8':
            $then=mktime(8,0,0);
            $nowarray=getdate($now);
            if ($nowarray['mday']==1 && $lexec <= $then && $now > $then) $due=true;
            break;
        case 'every_month_at_15th_at_8':
            $then=mktime(8,0,0);
            $nowarray=getdate($now);
            if ($nowarray['mday']==15 && $lexec <= $then && $now > $then) $due=true;
            break;
        default:
            $due=false;
        }
    return $due;
}


function cron__process_mail_queue() {
    global $settings;

    $result=experimentmail__send_mails_from_queue($settings['mail_queue_number_send_per_time']);
    $target="mails_sent:".$result['mails_sent'];
    if ($result['mails_errors']>0) $target.=", mail_errors:".$result['mails_errors'];
    if ($result['mails_invmails_not_sent']>0) $target.=", invmail_not_sent_empty_sesslist:".$result['mails_invmails_not_sent'];
    return $target;
}

function cron__retrieve_emails() {
    global $settings;
    if ($settings['enable_email_module']=='y') {
        $result=email__retrieve_incoming();
        $target="mails_retrieved:".$result['count'];
        if (isset($result['errors']) && count($result['errors'])>0) $target.=", email_errors: ".implode(", ",$result['errors']);
    } else {
        $target="Email module not enabled. No mails retrieved.";
    }
    return $target;
}

function cron__send_experiment_calendar() {
        $target=experimentmail__send_calendar();
        return $target;
}

function cron__send_participant_statistics() {
        $target=experimentmail__send_participant_statistics();
        return $target;
}

function cron__apply_permanent_queries() {
    $target=query__apply_permanent_queries();
    return $target;
}


function cron__run_webalizer() {
    global $settings, $settings__root_to_server, $settings__root_directory, $settings__server_url, $lang;
    // set webalizer vars
    $web['log_file']=$settings['http_log_file_location'];
//  $web['output_dir']=$settings__root_to_server.$settings__root_directory."/usage";
    $web['output_dir']="../usage";
    $web['report_title']=lang('usage_statistics_for');
    $web['host_name']=$settings__server_url;
    $web['public_area_url']=$settings__root_directory."/public/";
    $web['admin_area_url']=$settings__root_directory."/admin/";
    $web['include_url']=$settings__root_directory."/";

    // load webalizer template
    $filename = $web['output_dir']."/webalizer.template";
    $handle = fopen ($filename, "rb");
    $template = fread ($handle, filesize ($filename));
    fclose ($handle);

    // process webalizer template with vars
    $conffile=process_mail_template($template,$web);

    // write webalizer.conf
    $filename = $web['output_dir']."/webalizer.conf";
    if (!$handle = fopen($filename, "w+b")) {
            print "Cannot open $filename\n";
            exit;
        }
    if (!fwrite($handle, $conffile)) {
            print "Cannot write to $filename\n";
             exit;
        }
    fclose($handle);

    // run webalizer
    $exec=exec("cd ".$web['output_dir']."; webalizer 2>&1",$output);
    $done=implode("\n",$output);
    return $done;
}


function cron__participants_update_history_participant($part,$what) {
    $what_poss=array('number_reg','number_noshowup');
    if (in_array($what,$what_poss)) {
        $pars=array(':number'=>$part[$what],
                ':participant_id'=>$part['participant_id']);
        $query="UPDATE ".table('participants')."
                SET ".$what."= :number
                WHERE participant_id = :participant_id";
        $done=or_query($query,$pars);
        return $done;
    }
}

function cron__update_participants_history() {
    $logm="";

    // initialize with zero
    $query="UPDATE ".table('participants')."
            SET number_reg = 0, number_noshowup = 0";
    $done=or_query($query);

    $query="SELECT ".table('participate_at').".participant_id,
            count(*) as number_reg
            FROM ".table('participate_at').", ".table('sessions').", ".table('experiments')."
            WHERE ".table('sessions').".session_id = ".table('participate_at').".session_id
            AND ".table('participate_at').".experiment_id = ".table('experiments').".experiment_id
            AND hide_in_stats = 'n'
            AND (session_status='completed' OR session_status='balanced')
            AND ".table('participate_at').".session_id != 0
            GROUP BY participant_id";
    $result=or_query($query);
    $n=0;
    while ($line=pdo_fetch_assoc($result)) {
        $done=cron__participants_update_history_participant($line,'number_reg');
        $n++;
    }
    $logm.="updated participant's number_reg: ".$n."\n";

    $noshow_clause=expregister__get_pstatus_query_snippet("noshow");
    $query="SELECT ".table('participate_at').".participant_id,
            count(*) as number_noshowup
            FROM ".table('participate_at').", ".table('sessions').", ".table('experiments')."
            WHERE ".table('sessions').".session_id = ".table('participate_at').".session_id
            AND ".table('participate_at').".experiment_id = ".table('experiments').".experiment_id
            AND hide_in_stats = 'n'
            AND (session_status='completed' OR session_status='balanced')
            AND ".table('participate_at').".session_id != 0
            AND ".$noshow_clause."
            GROUP BY participant_id";
    $result=or_query($query);
    $n=0;
    while ($line=pdo_fetch_assoc($result)) {
        $done=cron__participants_update_history_participant($line,'number_noshowup');
        $n++;
    }
    $logm.="updated participant's number_noshowup: ".$n;
    return $logm;
}


function cron__check_for_registration_end() {
    global $settings;
    $now=time();

    $query="SELECT ".table('experiments').".*, ".table('sessions').".*
            FROM ".table('experiments').", ".table('sessions')."
            WHERE ".table('experiments').".experiment_id=".table('sessions').".experiment_id
            AND ".table('sessions').".reg_notice_sent = 'n'";
    $result=or_query($query);

    $mess="";
    while ($line=pdo_fetch_assoc($result)) {
        // is due?
        if (sessions__get_registration_end($line) < $now && ortime__sesstime_to_unixtime($line['session_start']) > $now) {
            $done=experimentmail__send_registration_notice($line);
            $mess.="sent notice for session ".session__build_name($line,$settings['admin_standard_language'])."\n";
        }
    }
    return $mess;
}


function cron__check_for_session_reminders() {
    global $settings;

    $now=time();
    $query="SELECT ".table('sessions').".*, ".table('experiments').".*,
            (SELECT count(*) from ".table('participate_at')." as p1 WHERE p1.session_id=".table('sessions').".session_id) as num_reg 
            FROM ".table('sessions').", ".table('experiments')."
            WHERE ".table('sessions').".experiment_id = ".table('experiments').".experiment_id
            AND session_status='live' AND reminder_sent = 'n' AND reminder_checked='n'";
    $result=or_query($query);

    $mess="";
    while ($line=pdo_fetch_assoc($result)) {
        // is due?
        if (sessions__get_reminder_time($line) < $now && ortime__sesstime_to_unixtime($line['session_start']) > $now) {
            // ok: and now what to do?
            $number=-1;
            $done=false;
            $disclaimer="";
            switch ($line['send_reminder_on']) {
                case '0':
                case 'enough_participants_needed_plus_reserve':
                    if ($line['num_reg'] >= $line['part_needed'] + $line['part_reserve']) {
                        $number=experimentmail__send_session_reminders_to_queue($line);
                        $done=experimentmail__send_reminder_notice($line,$number,true);
                    } else {
                        $done=experimentmail__send_reminder_notice($line,$number,false,'part_reserve');
                    }
                    break;
                case '1':
                case 'enough_participants_needed':
                    if ($line['num_reg'] >= $line['part_needed']) {
                        $number=experimentmail__send_session_reminders_to_queue($line);
                        $done=experimentmail__send_reminder_notice($line,$number,true);
                    } else {
                        $disclaimer=lang('reminder_not_sent_part_needed');
                        $done=experimentmail__send_reminder_notice($line,$number,false,'part_needed');
                    }
                    break;
                case '2':
                case 'in_any_case_dont_ask':
                    $number=experimentmail__send_session_reminders_to_queue($line);
                    $done=experimentmail__send_reminder_notice($line,$number,true);
                    break;
                default:
                    // nothing
            }
            $done2=experimentmail__set_reminder_checked($line['session_id']);
            $mess.="found session ".session__build_name($line,$settings['admin_standard_language'])."\n";
            if ($number >=0) $mess.="send ".$number." mails to mail queue\n";
            if ($disclaimer) $mess.=$disclaimer."\n";
            if ($done) $mess.="sent notice to experimenter\n";
        }
    }
    return $mess;
}

function cron__check_for_noshow_warnings() {
    global $settings;

    $now=time();
    $query="SELECT ".table('sessions').".*, ".table('experiments').".*
            FROM ".table('sessions').", ".table('experiments')."
            WHERE ".table('sessions').".experiment_id = ".table('experiments').".experiment_id
            AND (session_status='completed' OR session_status='balanced')
            AND noshow_warning_sent = 'n'
            ORDER BY session_start";
    $result=or_query($query);
    $mess="";
    while ($line=pdo_fetch_assoc($result)) {
        $mess.="found session ".session__build_name($line,$settings['admin_standard_language'])."\n";
        if ($settings['send_noshow_warnings']=='y') {
        $number=experimentmail__send_noshow_warnings_to_queue($line);
                $mess.="sent ".$number." noshow warnings\n";
        }
        $done2=experimentmail__set_noshow_warnings_checked($line['session_id']);
    }
    return $mess;
}

function cron__check_for_finished_sessions(){
    $now=time();
    $query="SELECT ".table('sessions').".*
            FROM ".table('sessions')."
            WHERE session_status='live'";
    $result=or_query($query);

    $number = 0;
    while ($line=pdo_fetch_assoc($result)) {
        // session finished?
	$session_end = ortime__sesstime_to_unixtime($line['session_start']) + $line['session_duration_hour'] * 60 * 60 + $line['session_duration_minute'] * 60;
        if ($session_end < $now) {
	    $query = "UPDATE ".table('sessions')." SET session_status = 'completed' WHERE session_id = '" . $line['session_id'] . "'";
	    $done = or_query($query);
	    $number++;
	}
    }
    return $number . " sessions closed";
}

function cron__check_for_finished_experiments(){
    // get experiments which arn't finished and their last session
    $exp_tbl = table('experiments');
    $ses_tbl = table('sessions');
    $query="select {$exp_tbl}.experiment_id, max({$ses_tbl}.session_start)
            from {$exp_tbl}
            inner join {$ses_tbl}
            on {$exp_tbl}.experiment_id = {$ses_tbl}.experiment_id
            where {$exp_tbl}.experiment_finished = 'n'
            group by {$exp_tbl}.experiment_id";
    $result=or_query($query);

    $now=time();
    $number = 0;
    $four_weeks = 4 * 7 * 24 * 60 * 60;
    while ($line=pdo_fetch_assoc($result)) {
        // if the last session start time is more than 4 weeks ago the experiment is considered to be finished
        $session_start = ortime__sesstime_to_unixtime($line['session_start']);
        if ($session_end + $four_weeks < $now) {
            $query = "update {$exp_tbl} set experiment_finished = 'y' where experiment_id = '{$line['experiment_id']}'";
            $done = or_query($query);
            $number++;
        }
    }
    return $number . " experiments closed";
}

function cron__check_for_participant_exclusion() {
    global $settings;
    $mess="";
    if ($settings['automatic_exclusion']=='y') {
        $status_query=participant_status__get_pquery_snippet("eligible_for_experiments");
        $query="SELECT * FROM ".table('participants')."
                WHERE ".$status_query."
                AND number_noshowup >= '".$settings['automatic_exclusion_noshows']."'";
        $result=or_query($query);

        $excluded=0; $informed=0;
        while ($line=pdo_fetch_assoc($result)) {
            $done=participant__exclude_participant($line);
            if ($done=='informed') $informed++;
            $excluded++;
        }
        if ($excluded>0) $mess.="participants excluded: ".$excluded;
        if ($informed>0) $mess.="\nparticipants informed: ".$informed;
    }
    return $mess;
}


function cron__auto_exclusion_inactive_participants(){
    global $settings;

    $participants_table = table('participants');
    $now = time();
    $objection_period = $settings['inactivity_exclusion_objection_period'] * 24 * 60 * 60;
    $exclusion_limit = $now - $settings['inactivity_exclusion_limit'] * 24 * 60 * 60;
    $warning_limit = $exclusion_limit + $objection_period;
    $warning_limit_in_db_format = date("YmdHi", $warning_limit); // transfere seconds since epoche to YYYYMMDDhhmm (time format in or_sessions)

    $query="select * from {$participants_table}
            where (last_activity <= {$warning_limit}
                   or last_activity is null)
                  and participant_id not in (
                      select participant_id
                      from or_participate_at as a
                      join or_sessions as b
                      on a.session_id = b.session_id
                      group by participant_id
                      having max(session_start) > {$warning_limit_in_db_format}
                  )
                  and status_id = 1";

    $result=or_query($query);

    $participants_to_be_warned = array();
    $participants_to_be_deleted = array();
    while ($line=pdo_fetch_assoc($result)) {
        if(is_null($line["warning_sent_on"])){
            $participants_to_be_warned[] = $line['participant_id'];
            $mail_queue_table = table('mail_queue');
            $query = "insert into {$mail_queue_table} (timestamp, mail_type, mail_recipient) values ({$now}, 'inactivity_warning', {$line['participant_id']})";
            or_query($query);
        } elseif($now - $objection_period > strtotime($line['warning_sent_on'])) {
            $participants_to_be_deleted[] = $line['participant_id'];
        }
    }

    $participants = implode(", ", $participants_to_be_warned); 
    $query = "update {$participants_table} set warning_sent_on=now() where participant_id in ({$participants})";
    $result=or_query($query);

    $participants = implode(", ", $participants_to_be_deleted); 
    $query = "update {$participants_table}
              set participant_id_crypt = NULL,
                  password_crypted = NULL,
                  confirmation_token = NULL,
                  pwreset_token = NULL,
                  pwreset_request_time = NULL,
                  last_login_attempt = NULL,
                  failed_login_attempts = NULL,
                  locked = NULL,
                  creation_time = NULL,
                  deletion_time = NULL,
                  subpool_id = 1,
                  subscriptions = NULL,
                  rules_signed = NULL,
                  status_id = 2,
                  number_reg = NULL,
                  number_noshowup = NULL,
                  last_enrolment = NULL,
                  last_profile_update = NULL,
                  last_activity = NULL,
                  pending_profile_update_request = NULL,
                  profile_update_request_new_pool = NULL,
                  apply_permanent_queries = NULL,
                  remarks = NULL,
                  language = NULL,
                  email = NULL,
                  gender = NULL,
                  year_of_birth = 9999,
                  warning_sent_on = NULL
              where participant_id in ({$participants})";

    $result=or_query($query);
    
    return "warned: " . sizeof($participants_to_be_warned) . "\ndeleted: " . sizeof($participants_to_be_deleted);
}
?>
