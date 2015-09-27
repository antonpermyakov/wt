<?php
require("auth.php");
include("html_top.html");
?><br /><b>Статистика по участкам</b><br /><p>
<table class="adminka" cellspacing="1" cellpadding="5">
<tr>
	<th>Участок</th>
	<th>Всего участников</th>
	<th>Граждан России</th>
	<th>Остальных</th>
	<th>Купейных</th>
	<th>Оплаченных россиян</th>
    <th>Оплаченных форинов</th>
</tr>
<?
for($i=1; $i<=9; $i++){
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `mark_del` =  '0' AND `visit_{$i}`='1' ") or die("<b>Error:</b> MySQL error: ".mysql_error());
$cnt_all=mysql_num_rows($res);    
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `eng` =  '0' AND  `mark_del` =  '0' AND `visit_{$i}`='1' ") or die("<b>Error:</b> MySQL error: ".mysql_error());
$cnt_rus=mysql_num_rows($res);
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `eng` =  '1' AND  `mark_del` =  '0' AND `visit_{$i}`='1' ") or die("<b>Error:</b> MySQL error: ".mysql_error());
$cnt_eng=mysql_num_rows($res);
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `coupe` =  '1' AND  `mark_del` =  '0' AND `visit_{$i}`='1' ") or die("<b>Error:</b> MySQL error: ".mysql_error());
$cnt_coupe=mysql_num_rows($res);
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `org_paid` =  '1' AND  `mark_del` =  '0' AND `visit_{$i}`='1' AND `eng` =  '0' ") or die("<b>Error:</b> MySQL error: ".mysql_error());
$cnt_paid_rus=mysql_num_rows($res);
$res=mysql_query("SELECT *
FROM  `wt_{$glob_year}` WHERE  `org_paid` =  '1' AND  `mark_del` =  '0' AND `visit_{$i}`='1' AND `eng` =  '1' ") or die("<b>Error:</b> MySQL error: ".mysql_error());
$cnt_paid_frn=mysql_num_rows($res);
?>

<tr><td><?=$GLOBALS['f_trip_names'][$i-1];?></td> <td><?= $cnt_all?> </td> <td><?=$cnt_rus?></td><td><?=$cnt_eng?></td> <td><?=$cnt_coupe?> </td><td><?=$cnt_paid_rus?></td><td><?=$cnt_paid_frn?></td>
</tr>

<?
}?></table></p><?
include("html_bottom.html");
?>