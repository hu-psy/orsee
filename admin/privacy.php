<?php
// part of orsee. see orsee.org
ob_start();
include ("header.php");
if ($proceed) {

	if (isset($_REQUEST['accept_rules']) && $_REQUEST['accept_rules']){
		// modify db
                $done=orsee_db_save_array(['privacy_policy_accepted' => 'y'],"admin",$expadmindata['admin_id'],"admin_id");
		$expadmindata['privacy_policy_accepted'] = 'y';
        	$_SESSION['expadmindata']=$expadmindata;
		if (isset($_REQUEST['requested_url']) && $_REQUEST['requested_url']) redirect($_REQUEST['requested_url']);
		redirect("admin/index.php");
	} else {
		echo '<center><BR><BR>';
		if(isset($_REQUEST['requested_url']) && $_REQUEST['requested_url']) {
			$add="?requested_url=".urlencode($_REQUEST['requested_url']);
			echo '<FORM action='.thisdoc().$add.' method="post">';
		} else {
			echo '<FORM action='.thisdoc().' method="post">';
		}
		echo '<TABLE class="or_panel" style="width: 80%">';
		    echo '<TR><TD>
		        <TABLE width="100%" border=0 class="or_panel_title"><TR>
		        <TD style="background: '.$color['panel_title_background'].'; color: '.$color['panel_title_textcolor'].'">
		            '.lang('privacy_policy').'
		        </TD>
		        </TR></TABLE>
		    </TD></TR>
		            <TR><TD>'.content__get_content("privacy_policy_for_admins").'</TD></TR>';
		echo '<TR><TD>
		        <TABLE width="100%" border=0 class="or_panel_title"><TR>
		        <TD style="background: '.$color['panel_title_background'].'; color: '.$color['panel_title_textcolor'].'">
		            '.lang('do_you_agree_rules_privacy').'
		        </TD>
		        </TR></TABLE>
		    </TD></TR>
		        <TR><TD align=center>
		            <INPUT class="button" type="submit" name="accept_rules" value="'.lang('yes').'">&nbsp;&nbsp;&nbsp;
		            <INPUT class="button" type="submit" name="notaccept_rules" value="'.lang('no').'">
		        </TD></TR>
		    </TABLE>
		    </FORM>
		    </center>';
	}
}
include ("footer.php");
?>
