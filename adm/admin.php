<?

require("auth.php");
include("html_top.html");
If(isset($_POST["rus_bf"])){$chb_rus_bf=$_POST["rus_bf"];}else{$chb_rus_bf="0";}
If(isset($_POST["for_bf"])){$chb_for_bf=$_POST["for_bf"];}else{$chb_for_bf="0";}
If(isset($_POST["for_coup"])){$chb_for_coup=$_POST["for_coup"];}else{$chb_for_coup="0";}
If(isset($_POST["for_payed"])){$chb_for_payed=$_POST["for_payed"];}else{$chb_for_payed="0";}
If(isset($_POST["for_not_payed"])){$chb_for_not_payed=$_POST["for_not_payed"];}else{$chb_for_not_payed="0";}
$_SESSION[chb_rus_bf]= $chb_rus_bf;
$_SESSION[chb_for_bf]= $chb_for_bf;
$_SESSION[chb_for_coup]= $chb_for_coup;
$_SESSION[chb_for_payed]= $chb_for_payed;
$_SESSION[chb_for_not_payed]= $chb_for_not_payed;

$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `eng` =  '0' AND  `mark_del` =  '0' AND `extra`='0' ") or die("<b>Ашыпко:</b> MySQL error: ".mysql_error());
$cnt_rus_bf_dd=mysql_num_rows($res);
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `eng` =  '1' AND  `mark_del` =  '0' AND `extra`='0' ") or die("<b>Ашыпко:</b> MySQL error: ".mysql_error());
$cnt_frnr_bf_dd=mysql_num_rows($res);
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `eng` =  '0' AND  `mark_del` =  '0' AND `extra`='1' ") or die("<b>Ашыпко:</b> MySQL error: ".mysql_error());
$cnt_rus_aft_dd=mysql_num_rows($res);
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `eng` =  '1' AND  `mark_del` =  '0' AND `extra`='1' ") or die("<b>Ашыпко:</b> MySQL error: ".mysql_error());
$cnt_frnr_aft_dd=mysql_num_rows($res);
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `coupe` =  '1' AND  `mark_del` =  '0' ") or die("<b>Ашыпко:</b> MySQL error: ".mysql_error());
$cnt_coupe=mysql_num_rows($res);
?>
<form name="chekout" method="post" action="admin.php">
<input type="checkbox" name="rus_bf" value="1" <? if ( "1" === $_SESSION[chb_rus_bf] ) echo " checked='checked' "; ?>>Граждане РФ, в срок</input>
<input type="checkbox" name="for_bf" value="1" <? if ( "1" === $_SESSION[chb_for_bf] ) echo " checked='checked' "; ?>>Иностранцы, в срок</input>
<input type="checkbox" name="for_coup" value="1" <? if ( "1" === $_SESSION[chb_for_coup] ) echo " checked='checked' "; ?>>Купейные места</input>
<input type="checkbox" id="for_payed" name="for_payed" value="1" <? if ( "1" === $_SESSION[chb_for_payed] ) echo " checked='checked' "; ?> onclick="click_payed()"> Оплаченые</input>
<input type="checkbox" id="for_not_payed" name="for_not_payed" value="1" <? if ( "1" === $_SESSION[chb_for_not_payed] ) echo " checked='checked' "; ?> onclick="click_not_payed()">Неоплаченые</input>
<input type="submit" value="OK">
</form>
<h2>Список зарегистрировавшихся участников</h2> <br/>
(всего зарегистрированных в срок граждан РФ - <b><?=$cnt_rus_bf_dd?></b> иностранных - <b><?=$cnt_frnr_bf_dd?></b> <br/>
после дедлайна граждан РФ - <b><?=$cnt_rus_aft_dd?></b> иностранных - <b><?=$cnt_frnr_aft_dd?></b> купейных мест - <b><?=$cnt_coupe?></b>)
<br /><a href="trav_info.php" target="_blank">статистика по участкам</a>
<?
if ( $_GET["id"] > 0 )
{
?>
<p>
<strong style="color: red;">Информация по участнику номер <?=$_GET["id"]?> обновлена</strong>
</p>
<?
}

$qstr="SELECT
						`wt_{$glob_year}_id` id,
						`name`,
						`lastname`,
						`initials`,
						`email`,
						`birthdate`,
						`phone_m`,
						`address`,
						`town`,
						`country`,
						`passport`,
						`passport_date`,
						`passport_place`,
						`passport_expire`,
						`visa`,
						`visa_date`,
						`visa_end_date`,
						`get_visa_country`,
						`get_visa_city`,
						`eng`,
						`extra`,
						`sex`,
						`nation`,
						`birth_country`,
						`birth_place`,
						`work_place`,
						`work_position`,
						`work_address`,
						`accomp_children`,
						`entry_in_russia`,
						`period`,
						`visit_1`,
						`visit_2`,
						`visit_3`,
						`visit_4`,
						`visit_5`,
						`visit_6`,
						`visit_7`,
						`visit_8`,
                        `visit_9`,
                        `coupe`,
						`payment_select`,
						`payment`,
						`total_sum`,
						`org_paid`,
						`org_paid_date`,
						`total_sum`,
						`comments`,
						`ning_profile`
						FROM `wt_{$glob_year}`
						WHERE `mark_del` not like '1'
						";

if($chb_rus_bf=="1"){$qstr=$qstr."AND ((`eng`='0' AND `extra`='0') ";}
$cnt_chb=0+$chb_rus_bf+$chb_rus_af;
if($chb_rus_af=="1")
	{if($cnt_chb>1){$qstr=$qstr." OR ";}else{$qstr=$qstr." AND (";}
	$qstr=$qstr."(`eng`='0' AND `extra`='1') ";}
$cnt_chb=0+$chb_rus_bf+$chb_rus_af+$chb_for_bf;
if($chb_for_bf=="1")
{if($cnt_chb>1){$qstr=$qstr." OR ";}else{$qstr=$qstr." AND (";}
$qstr=$qstr."(`eng`='1' AND `extra`='0') ";}
$cnt_chb=0+$chb_rus_bf+$chb_rus_af+$chb_for_bf+$chb_for_af;
if($chb_for_af=="1")
{if($cnt_chb>1){$qstr=$qstr." OR ";}else{$qstr=$qstr." AND (";}
$qstr=$qstr."(`eng`='1' AND `extra`='1') ";}
if($cnt_chb>0){$qstr=$qstr.")";}
if($chb_for_coup=="1")
{$qstr=$qstr." AND (`coupe`='1') ";}
if($chb_for_payed=="1")
{$qstr=$qstr." AND (`org_paid`='1') ";}
if($chb_for_not_payed=="1")
{$qstr=$qstr." AND (`org_paid`='0') ";}
$qstr=$qstr." ORDER BY id";
//echo $qstr;
$res 	= mysql_query($qstr) or die("<b>Ашыпко:</b> MySQL error: ".mysql_error()."
".$qstr);

?>
<form name="maillist" id="maillist" action="groupmail.php" method="post">
<table class="adminka" cellspacing="1" cellpadding="5">
<tr>
	<th>п/н</th>
	<th>Номер</th>
	<th>Имя Фамилия (VirtSangha)</th>
	<th>E-Mail</th>
	<th>Страна</th>
	<th>Город</th>
	<th>Участки</th>
	<th>Стоимость</th>
	<th>Оплата</th>
	<th>Пометка удаления</th>
	<th>В очередь</th>
	<th>Из очереди</th>
	<th>Письмо</th>
</tr>
<?
$r_cnt=1;
while($row = mysql_fetch_array($res))
{
?>
<tr>
	<td><?=$r_cnt?></td>
	<td><nobr><a href="payment.php?id=<?=$row["id"]?>">WT<?=$glob_YY?><?=$row["eng"]=='1'?"F":"R"?><?=$row["extra"]=='1'?"E":""?>-<?=$row["id"]?></a></nobr></td>
	<td>
		<?=($row["ning_profile"] ? "<a href='http://virtualsangha.ning.com/profile/$row[ning_profile]' target='_blank'>" : "")?>
		<?=$row["name"]?>&nbsp;<?=$row["lastname"]?>
		<?=($row["ning_profile"] ? "</a>" : "")?>
	</td>
	<td><a href="mailto:<?=$row["email"]?>"><?=$row["email"]?></a></td>
	<td><?=$row["country"]?></td>
	<td><?=$row["town"]?></td>
	<td><?
		if ($row["visit_1"]) echo "<nobr>".$GLOBALS['f_trip_names'][0]."</nobr><br/>";
	//	if ($row["visit_2"]) echo "<nobr>".$GLOBALS['f_trip_names'][1]."</nobr><br/>";
		if ($row["visit_3"]) echo "<nobr>".$GLOBALS['f_trip_names'][2]."</nobr><br/>";
	//	if ($row["visit_4"]) echo "<nobr>".$GLOBALS['f_trip_names'][3]."</nobr><br/>";
        if ($row["visit_5"]) echo "<nobr>".$GLOBALS['f_trip_names'][4]."</nobr><br/>";
	//	if ($row["visit_6"]) echo "<nobr>".$GLOBALS['f_trip_names'][5]."</nobr><br/>";
		if ($row["visit_7"]) echo "<nobr>".$GLOBALS['f_trip_names'][6]."</nobr><br/>";
	//	if ($row["visit_8"]) echo "<nobr>".$GLOBALS['f_trip_names'][7]."</nobr><br/>";
 	    if ($row["visit_9"]) echo "<nobr>".$GLOBALS['f_trip_names'][8]."</nobr><br/>";
    
        if ($row["coupe"]) {echo "<nobr><b>купейное место</b></nobr><br/>";}
        else{echo "<nobr>плацкартное место</nobr><br/>";}
?>
	</td>
	<td><?=($row["eng"]?"&euro;&nbsp;":"").$row["total_sum"].($row["eng"]?"":"&nbsp;руб.")?></td>
	<td><a href="payment.php?id=<?=$row["id"]?>"><?=($row["org_paid"] ? $row["org_paid_date"] : "не&nbsp;оплачена")?></a></td>
	<td><a href="del.php?id=<?=$row["id"]?>">удалить</a></td>
	<td><a href="stndby.php?id=<?=$row["id"]?>">в очередь</a></td>
	<td><a href="fr_stndby.php?id=<?=$row["id"]?>">из очереди</a></td>
	<td><input type="checkbox" name="mail_chk_<?=$row["id"]?>" form="maillist" value="1"> </input></td>
</tr>
<?  $r_cnt++;
}
?>
</table>
 <p>
 тема письма:<br/>
  <textarea name="mail_subj" cols="40" rows="1" form="maillist"></textarea><br/>
 текст письма<br/>
   <textarea name="mail_body" cols="40" rows="10" form="maillist"></textarea></p>
  <p><input type="submit" value="Отправить" form="maillist">
   </p>
</form>
<a href="csv.php">CSV файл</a>
<script type="text/javascript" language="JavaScript">

function click_payed(){
var have_payed = document.getElementById('for_payed');
var not_payed = document.getElementById('for_not_payed');
if (have_payed.checked) {not_payed.checked = false};
}
function click_not_payed(){
var have_payed = document.getElementById('for_payed');
var not_payed = document.getElementById('for_not_payed');
if (not_payed.checked) {have_payed.checked = false};
}

</script>
<?
include("html_bottom.html");
?>
