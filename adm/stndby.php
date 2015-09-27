<?php
require("auth.php");

extract($HTTP_GET_VARS);
extract($HTTP_POST_VARS);

if (isset($_GET['stndby'])){$stndby=$_GET['stndby'];}
if (isset($_POST['fname'])){$name=$_POST['fname'];}
if (isset($_POST['lname'])){$lname=$_POST['lname'];}
if (isset($_POST['pid'])){$pid=$_POST['pid'];}
//echo $onstndby;

if(@!$stndby)
	{

	$res 	= mysql_query("SELECT
						`wt_{$glob_year}_id` id,
						`name`,
						`lastname`,
						`initials`,
						`email`,
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

	echo "вы действительно хотите переместить в очередь".$row["name"]." ".$row["lastname"]."?";
	?>
	<form name="pass_to_quee" action="?stndby=yes" method="post">
	<input type="hidden" name = "fname" value = "<?=$name?>">
	<input type="hidden" name = "lname" value = "<?=$lname?>">
	<input type="hidden" name = "pid" value = "<?=$_GET['id']?>">

    <input type="submit" value="Подтвердить перемещение">
    </form>
	<?
	}
	else
	{
	    $res = mysql_query("UPDATE `wt_{$glob_year}` SET `extra`='1' WHERE `wt_{$glob_year}_id` =".$pid
	     ) or die("<b>Ашыпко:</b> MySQL error: ".mysql_error());
	     if (res == TRUE)		{echo "запись ".$name." ".$lname." id=".$pid." перемещена в очередь";
		 echo "<br /><a href='admin.php'>/admin.php</a>";
		}
	}
$stndby=0;
?>



<?
include("html_bottom.html");
?>