<?php
require("auth.php");

extract($HTTP_GET_VARS);
extract($HTTP_POST_VARS);
$mail_list="";
if (isset($_GET['send_appr'])){$send_appr=$_GET['send_appr'];}
if (isset($_POST['mail_body'])){$mail_body=$_POST['mail_body'];}
if (isset($_POST['mail_subj'])){$mail_subj=$_POST['mail_subj'];}
if (isset($_POST['mail_list'])){$mail_list=$_POST['mail_list'];}


if(@!$send_appr)
	{

	$res 	= mysql_query("SELECT
					`wt_{$glob_year}_id` id,
					`email`
					FROM `wt_{$glob_year}`
					") or die("<b>Ашыпка!:</b> MySQL error: ".mysql_error());
	while($row = mysql_fetch_array($res)){
		$email = $row["email"];
		$id = $row["id"];
		if ($_POST["mail_chk_".$id]=="1")
			{$mail_list=$mail_list.",".$row["email"];}
		}
	echo "вы действительно хотите отправить по адресам:".$mail_list."
	сообщение:
	".$mail_body."
	с заголовком - ".$mail_subj."?";
	?>
	<form name="mail_approuve" action="?send_appr=yes" method="post">
	<input type="hidden" name = "mail_body" value = "<?=$mail_body?>">
	<input type="hidden" name = "mail_subj" value = "<?=$mail_subj?>">
	<input type="hidden" name = "mail_list" value = "<?=$mail_list?>">

    <input type="submit" value="Отправить">
    </form>
	<?
    }
    else
    {
    $res = email($mail_list, $mail_subj, $mail_body, $org_email);
    if ($res){
    echo "сообщение:
	".$mail_body."
	с заголовком - ".$mail_subj."
	отправлено по списку".$mail_list;
	}
	else
	{echo "почта не ушла";}
	 echo "<br /><a href='admin.php'>/admin.php</a>";    }
?>

