<?php
// part of orsee. see orsee.org
ob_start();
$menu__area="my_data";
$title="delete_participant";
include("header.php");
if ($proceed) {
    if (isset($_REQUEST['betternot'])) redirect("public/participant_edit.php?p=".urlencode($participant['participant_id_crypt']));
}

if ($proceed) {
    $form=true;
    if (isset($_REQUEST['reallydelete']) && $_REQUEST['reallydelete']=="12345" && isset($_REQUEST['doit'])) {
        $default_inactive_status=participant_status__get("is_default_inactive");
        $pars=array(':participant_id'=>$participant_id,':default_inactive_status'=>$default_inactive_status);
        $query = "update ".table('participants')."
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
                      status_id = :default_inactive_status,
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
                  where participant_id = :participant_id";
        $done=or_query($query,$pars);
        log__participant("delete",$participant_id);
        $form=false;
        message (lang('removed_from_invitation_list'));
        redirect("public/");
    }
}

if ($proceed) {
    if ($form) {
        echo '<center>

            <FORM action="participant_delete.php">
            <INPUT type=hidden name="p" value="'.$participant['participant_id_crypt'].'">
            <TABLE class="or_formtable">
            <TR>
            <TD colspan=2><INPUT name=reallydelete type=hidden value="12345">
            '.lang('do_you_really_want_to_unsubscribe').'<BR></TD>
            </TR>
            <TR><TD>
            <INPUT class="button" type=submit name=doit value="'.lang('yes_i_want').'">
            </TD>
            <TD><INPUT class="button" type=submit name=betternot value="'.lang('no_sorry').'">
            </TD>
            </TR>
            </TABLE>
            </FORM>
            </center>';
    }

}
include("footer.php");
?>
