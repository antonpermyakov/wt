<?
require("auth.php");

session_register("f_payment_date_d");
session_register("f_payment_date_m");
session_register("f_payment_date_y");
session_register("f_org_paid");
session_register("f_org_comments");
session_register("$f_org_mail_comments");

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
						`payment_select`,
						`payment`,
						`total_sum`,
						`org_paid`,
						`org_comments`,
						DATE_FORMAT(org_paid_date, '%e') paid_d,
						DATE_FORMAT(org_paid_date, '%c') paid_m,
						DATE_FORMAT(org_paid_date, '%Y') paid_y,
	                  	`total_sum`,
	                  	`ning_profile`,
						`comments`
						FROM `wt_{$glob_year}`
						WHERE `wt_{$glob_year}_id` = ".$_GET["id"]
	) or die("<b>������:</b> MySQL error: ".mysql_error());

$row = mysql_fetch_array($res);

$f_payment_date_d =	$row["paid_d"];
$f_payment_date_m =	$row["paid_m"];
$f_payment_date_y =	$row["paid_y"];
if ($f_payment_date_m == 0) $f_payment_date_m = 12;

$f_org_paid = $row["org_paid"];
$f_org_comments = $row["org_comments"];

$year2digit = substr($glob_year,2);

if ( $_POST['form'] )
{
	GetFormData();
	Validate();

	// �������� ������ � ��
	$tresult = mysql_query("UPDATE
								`wt_{$glob_year}`
							SET
								`org_paid` = '$f_org_paid',
								`org_paid_date` = '$f_payment_date_y-$f_payment_date_m-$f_payment_date_d',
								`org_comments` = '$f_org_comments'
							WHERE
								`wt_{$glob_year}_id` = ".$_GET["id"]
	) or die("<b>������:</b> MySQL error: ".mysql_error());

	// ������ �������� � ����� ������ ��������
	$email = $row["email"];
	$letter = ($row["eng"] ? "e" : "r");
	$letter2 = ($row["eng"] ? "en" : "ru");

	if ( $f_org_paid )
	{
		// �� ������� - ����� ����, ������� ��� �� ������ -���, � ����� � ���������� ������!
		// ������ ����� �������� ������������ �� �������� � ����� ������!

		// ������ ������� �� ������ �����������
		mysql_query(
			"DELETE FROM wt{$year2digit}{$letter}_reg WHERE address = '$email'", $qmail_link
		) or die("<b>������:</b> MySQL error: ".mysql_error());

		// � ������ ������ � ������ ������������������
		// ������ �������� ��� ��� ��� ��� ������ ������:
		$sth = mysql_query(
			"SELECT count(*) FROM wt{$year2digit}_{$letter2} WHERE address = '$email'", $qmail_link
		) or die("<b>������:</b> MySQL error: ".mysql_error());

		$already = mysql_fetch_array($sth);
		if ( $already[0] == 0 )
		{
			// ��� ��� ������ - ����� ����, ����� ��!
			mysql_query(
				"INSERT INTO wt{$year2digit}_{$letter2} (hash, address)
					VALUES  (".ezmlm_hash($email).",'$email')", $qmail_link
			) or die("<b>������:</b> MySQL error: ".mysql_error());
		}
		$fomc = $_POST['$f_org_mail_comments'];
		if ('1' == $row["eng"]){
		include("email-man-reg.php.eng");}
		else{
		include("email-man-reg.php.ru");}
		$res = @email($mail_email, $mail_subj, $mail_body, $org_email);
	}
	else
	{
		// �� ������� - ������������, ���� �� ��� � ������ "��-���", �� ������ ��� ������
		// � �������, ���� �� �� � ������ -���. ���� ����, �� �� ����� ���������, � ���� ��� - �������

		// ������ ������� �� ������ ����������
		mysql_query(
			"DELETE FROM wt{$year2digit}_{$letter2} WHERE address = '$email'", $qmail_link
		) or die("<b>������:</b> MySQL error: ".mysql_error());

		// � ������ ������ � ������ �������������
		// ������ �������� ��� ��� ��� ��� ������ ������:
		$sth = mysql_query(
			"SELECT count(*) FROM wt{$year2digit}{$letter}_reg WHERE address = '$email'", $qmail_link
		) or die("<b>������:</b> MySQL error: ".mysql_error());

		$already = mysql_fetch_array($sth);

		if ( $already[0] == 0 )
		{
			// ��� ��� ������ - ����� ����, ����� ��!
			mysql_query(
				"INSERT INTO wt{$year2digit}{$letter}_reg (hash, address)
					VALUES  (".ezmlm_hash($email).",'$email')", $qmail_link
			) or die("<b>������:</b> MySQL error: ".mysql_error());
		}
	}

	header("Location: admin.php?id=".$_GET["id"]."&mes=super");
	exit(0);
}


function GetFormData() {

	// ��������� ������ �� �����:

	$GLOBALS['f_payment_date_d'] = $_POST['f_payment_date_d'];
	$GLOBALS['f_payment_date_m'] = $_POST['f_payment_date_m'];
	$GLOBALS['f_payment_date_y'] = $_POST['f_payment_date_y'];

	$GLOBALS['f_org_comments'] = $_POST['f_org_comments'];

	$GLOBALS['f_org_paid'] = $_POST['f_org_paid'];
	if ($GLOBALS['f_org_paid'] != 1) $GLOBALS['f_org_paid'] = 0;
}

function Validate() {

	global $_POST, $error, $error_titles;

	$error = array();
	$error_titles = array();

	// �������� ��������� ������:
}

include("html_top.html");


?>

<h2>������ ��������� �������</h2>

<form method="post" name="form1" action="" onsubmit="return Form1Submit();">
<input type="hidden" name="form" value="1" />
<table cellspacing="1" cellpadding="3" width="500">
<tr>
	<td class="tit">��������</td>
	<td>WT12<?=$row["eng"]=='1'?"E":"R"?>-<?=$row["id"]?>

	<?=($row["ning_profile"] ? "<a href='http://virtualsangha.ning.com/profile/$row[ning_profile]' target='_blank'>" : "")?>
	<?=htmlspecialchars($row["lastname"])?>
	<?=htmlspecialchars($row["name"])?><?=($row["ning_profile"] ? "</a>&nbsp;" : "")?>

	<a href="mailto:<?=$row["email"]?>"><?=$row["email"]?></a> </td>
</tr>
<tr>
	<td class="tit">������, �����</td>
	<td><?=htmlspecialchars($row["country"])?>,&nbsp;<?=htmlspecialchars($row["town"])?></td>
</tr>
<tr>
	<td class="tit">�������</td>
	<td>
<?		if ($row["visit_1"]) echo "<nobr>".$GLOBALS['f_trip_names'][0]."</nobr><br/>";
		if ($row["visit_2"]) echo "<nobr>".$GLOBALS['f_trip_names'][1]."</nobr><br/>";
		if ($row["visit_3"]) echo "<nobr>".$GLOBALS['f_trip_names'][2]."</nobr><br/>";
		if ($row["visit_4"]) echo "<nobr>".$GLOBALS['f_trip_names'][3]."</nobr><br/>";
?>
	</td>
</tr>
<tr>
	<td class="tit">�����</td><td><?=($row["eng"]?"&euro;&nbsp;":"").htmlspecialchars($row["total_sum"]).($row["eng"]?"":"&nbsp;���.")?></td>
</tr>
<tr>
	<td class="tit">�����������<br/>���������</td><td><?=$row["comments"]?></td>
</tr>
<tr>
	<td class="tit"><label for="f_org_paid">�������&nbsp;��������!</label></td>
	<td>
		<input type="checkbox" name="f_org_paid" value="1" id="f_org_paid"
			<?=($f_org_paid?"checked":"")?> onclick="javasript:ChangeCbx(this);" />
		<span id="span_paid_date">���� ������
			<? $today=getdate();
			$f_payment_date_d = $today["mday"];
			$f_payment_date_m = $today["mon"];
			$f_payment_date_y = $today["year"];
			echo(DateSelectStr("$f_payment_date_d.$f_payment_date_m.$f_payment_date_y", "f_payment_date", $glob_year, $glob_year+1));?></select>
		</span>
	</td>
</tr>
<tr>
	<td class="tit">�����������<br/>��������������</td>
	<td><textarea name="f_org_comments" cols="50" rows="10"><?=$f_org_comments?></textarea>
		(��� ����� ��������� ���������� � �����, ������� ������� ��� ���,
		���� �� ��� �� ��������� ������� �������. �� � ������ ������ ��� ��� ������.)
		</td>
</tr>
<tr>
	<td class="tit">�����������<br/>��� ���������</td>
	<td><textarea name="$f_org_mail_comments" cols="50" rows="10"><?=$f_org_mail_comments?></textarea>
		(��������� ����� � ������ ��������� ������� � ������������� ������)
		</td>
</tr>
<tr>
	<td class="tit">&nbsp;</td>
	<td><input type="submit" value="����������� ������" /></td>

</tr>

</table>
</form>

<script type="text/javascript">
	spa = document.getElementById("span_paid_date");
<?  if ($f_org_paid)
	{?>
	spa.style.display = "inline";
	<?}else{?>
	spa.style.display = "none";
	<?}?>

	function ChangeCbx(cbx)
	{
		if ( cbx.checked )
		{
			spa.style.display = "inline";
		} else {
			spa.style.display = "none";
		}
	}
	function Form1Submit()
	{
		cbx = document.getElementById("f_org_paid");
<?
	if ( ! $f_org_paid )
	{?>
		if ( cbx.checked )
			return confirm("1. �������� ����� ������� ��� ���������� ������� \n2. �������� ����� ����� �� �������� wt<?=$year2digit?><?=$row["eng"]=='1'?"e":"r"?>_reg@buddhism.ru \n3. �������� ����� ������ � �������� wt<?=$year2digit?>_<?=$row["eng"]=='1'?"en":"ru"?>@buddhism.ru");
<?  } else {?>
		if ( ! cbx.checked )
			return confirm("�������� ����� �������� �� ������ wt<?=$year2digit?>_<?=$row["eng"]=='1'?"en":"ru"?>@buddhism.ru ������� � ������ wt<?=$year2digit?><?=$row["eng"]=='1'?"e":"r"?>_reg@buddhism.ru");
<?	}?>
	}
</script>

<?
include("html_bottom.html");
?>
