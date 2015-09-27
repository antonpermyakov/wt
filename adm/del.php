<?php
require("auth.php");

extract($HTTP_GET_VARS);
extract($HTTP_POST_VARS);

if (isset($_GET['del'])){$del=$_GET['del'];}
if (isset($_POST['fname'])){$name=$_POST['fname'];}
if (isset($_POST['lname'])){$lname=$_POST['lname'];}
if (isset($_POST['letter'])){$letter=$_POST['letter'];}
if (isset($_POST['email'])){$email=$_POST['email'];}
if (isset($_POST['pid'])){$pid=$_POST['pid'];}
echo $ondel;

if(@!$del)
	{

	$res 	= mysql_query("SELECT
						`wt_{$glob_year}_id` id,
						`name`,
						`lastname`,
						`initials`,
						`email`,
						`eng`,
						`birthdate`,
						`phone_m`,
						`address`,
						`town`,
						`country`
						FROM `wt_{$glob_year}`
						WHERE `wt_{$glob_year}_id` = ".$_GET["id"]
	) or die("<b>Ашыпко:</b> MySQL error: ".mysql_error());

	$row = mysql_fetch_array($res);
	$name = $row["name"];
	$lname = $row["lastname"];
	$letter = ($row["eng"] ? "e" : "r");
	$email = $row["email"];

	echo "вы действительно хотите удалить ".$row["name"]." ".$row["lastname"]."?";
	?>
	<form name="deletion" action="?del=yes" method="post">
	<input type="hidden" name = "fname" value = "<?=$name?>">
	<input type="hidden" name = "lname" value = "<?=$lname?>">
	<input type="hidden" name = "letter" value = "<?=$letter?>">
	<input type="hidden" name = "email" value = "<?=$email?>">
	<input type="hidden" name = "pid" value = "<?=$_GET['id']?>">

<input type="submit" value="Подтвердить удаление">
</form>
	<?
	}
	else
	{
		$year2digit = substr($glob_year,2);		
		
	    $res = mysql_query("UPDATE `wt_{$glob_year}` SET `mark_del`='1' WHERE `wt_{$glob_year}_id` =".$pid
	     ) or die("<b>Ашыпко:</b> MySQL error: ".mysql_error());
	     if (res == TRUE)
		{echo "запись ".$name." ".$lname." id=".$pid." удалена";
		 //echo "<br /><a href='admin.php'>/admin.php</a>";
		}
		// удаляем из списка регистрации
		$res = mysql_query(
			"DELETE FROM wt{$year2digit}{$letter}_reg WHERE address = '$email'", $qmail_link
		) or die("<b>Ашыпко:</b> MySQL error: ".mysql_error());
		  if (res == TRUE)
		{echo "адрес ".$email." удален из списка рассылки wt{$year2digit}{$letter}_reg";
		}
		 echo "<br /><a href='admin.php'>/admin.php</a>";
	}
$del=0;
?>



<?
include("html_bottom.html");
?>
