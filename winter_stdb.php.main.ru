<?
// Если он их уже отправляет - то либо найдем ошибки и пошлем его заново вбивать данные,
// либо спросим - точно ли он уверен, что данные верны,
// либо запись в БД и отправим все организаторам.
//include('/htdocs/php/utils.php');

if ($_POST['form']) {

	GetFormData();
	Validate();

	if ( count($error_titles) > 0 ) {

		// покажем ошибки и снова попросим заполнить форму
	    $_SESSION['system_message'] = "<font color='red'>".join("<br>", $error_titles)."</font>";

	} else if ($_POST['sure']) { // уже надо все добавлять в БД

		// подсчитаем сумму
       $f_total_sum = $_SESSION['f_total'];


/*
		if ( "1" == $_SESSION[f_trip_1] ) $f_total_sum += $GLOBALS['f_trip_rur'][0];
	    if ( "1" == $_SESSION[f_trip_2] ) $f_total_sum += $GLOBALS['f_trip_rur'][1];
		if ( "1" == $_SESSION[f_trip_3] ) $f_total_sum += $GLOBALS['f_trip_rur'][2];
        if ( "1" == $_SESSION[f_trip_4] ) $f_total_sum += $GLOBALS['f_trip_rur'][3];
        if ( "1" == $_SESSION[f_trip_5] ) $f_total_sum += $GLOBALS['f_trip_rur'][4];
		if ( "1" == $_SESSION[f_trip_6] ) $f_total_sum += $GLOBALS['f_trip_rur'][5]*/;

		// добавим запись в БД
		$tresult = mysql_query("INSERT INTO
									`wt_$glob_year`
								SET
									`name` = '".addslashes($_SESSION[f_name])."',
									`midname` = '".addslashes($_SESSION[f_midname])."',
									`lastname` = '".addslashes($_SESSION[f_lastname])."',
									`initials` = '".substr($_SESSION[f_name], 0, 1).".".substr($_SESSION[f_midname], 0, 1).".',
									`email` = '$_SESSION[f_email]',
									`birthdate` = '$_SESSION[f_birthdate_y]-$_SESSION[f_birthdate_m]-$_SESSION[f_birthdate_d]',
									`phone_m` = '".addslashes($_SESSION[f_phone_m])."',
									`address` = '".addslashes($_SESSION[f_address])."',
									`town` = '".addslashes($_SESSION[f_town])."',
									`country` = '".addslashes($_SESSION[f_country])."',
									`citizenship` = '".addslashes($_SESSION[f_citizen])."',
									`passport_type`  = '$_SESSION[f_passport_type]',
									`passport`  = '".addslashes(str_replace( " ", "", str_replace( "№", "", $_SESSION[f_passport] )))."',
									`passport_date` = '$_SESSION[f_passport_y]-$_SESSION[f_passport_m]-$_SESSION[f_passport_d]',
									`passport_place` = '".addslashes($_SESSION[f_passport_place])."',
									`passport_organ` = '".addslashes($_SESSION[f_passport_organ])."',
									`eng` = '0',
									`extra` = '1',
									`visit_1` = '".("1" == $_SESSION[f_trip_1] ? "1" : "0")."',
									`visit_2` = '".("1" == $_SESSION[f_trip_2] ? "1" : "0")."',
									`visit_3` = '".("1" == $_SESSION[f_trip_3] ? "1" : "0")."',
									`visit_4` = '".("1" == $_SESSION[f_trip_4] ? "1" : "0")."',
									`payment_select` = '$_SESSION[f_payment_way_select]',
									`payment` = '".addslashes($_SESSION[f_payment_way])."',
									`total_sum` = '". $_SESSION[f_total]."',
									`ning_profile` = '".addslashes($_SESSION[f_ning_profile])."',
									`comments` = '".addslashes(str_replace("\n"," ",str_replace("\r"," ",$_SESSION[f_comments])))."'"
									) or die("MySQL error: ".mysql_error());

		// получим новый ID:
		$_SESSION[f_id] = mysql_insert_id();
		// подпишем чела на рассылку wt{$glob_YY}r_reg@buddhism.ru:
    // OK, both reset, put the applicant onto the mailing list

		 mysql_query("INSERT INTO wt{$glob_YY}r_reg
    (hash, address)
			VALUES (" . ezmlm_hash($_SESSION[f_email]) .  ", '$_SESSION[f_email]' ) ", $qmail_link) or
 			die("MYSQL Error in <b>".__FILE__."</b> at line <b>".__LINE__."</b><br />" . mysql_error());

		// письмо организаторам
		include("email-org_stdb.php.ru");
		$res = email($mail_email, $mail_subj, $mail_body, $org_email);

		// письмо зарегистрировавшемуся человеку
		include("email-man_stdb.php.ru");
		$res = email($mail_email, $mail_subj, $mail_body, $org_email);

		include("thanks_stdb.ru.html");
		exit(0);

	} else { // ошибок нет, но надо показать ему промежуточную форму для подтверждения:
		include("forsure_stdb.ru.html");
		exit(0);
	}

}

else

{
	// если юзер залогиненный - возьмём его данные из БД!
	if ( $_SESSION[man_id] > 0 )
	{
		$row = mysql_query("SELECT name, midname, lastname,
							name_eng, midname_eng, lastname_eng,
							center_id,
							DATE_FORMAT(birthdate, '%e') b_d,
							DATE_FORMAT(birthdate, '%c') b_m,
							DATE_FORMAT(birthdate, '%Y') b_y,
							is_co,
							sex,
							phone_m,
							phone_h,
							extra_town,
							passport_number_domestic,
							DATE_FORMAT(passport_issue_domestic, '%e') p_d,
							DATE_FORMAT(passport_issue_domestic, '%c') p_m,
							DATE_FORMAT(passport_issue_domestic, '%Y') p_y
					FROM man
					WHERE man_id = '$_SESSION[man_id]'") or
			die("MySQL error: ".mysql_error());
		$res = mysql_fetch_assoc($row);


		$_SESSION['f_name'] = $res['name'];
		$_SESSION['f_midname'] = $res['midname'];
		$_SESSION['f_lastname'] = $res['lastname'];

		$_SESSION['f_birthdate_d'] = $res['b_d'];
		$_SESSION['f_birthdate_m'] = $res['b_m'];
		$_SESSION['f_birthdate_y'] = $res['b_y'];

		$_SESSION['f_phone_m'] = $res['phone_m'];

		$_SESSION['f_passport'] = $res['passport_number_domestic'];
		$_SESSION['f_passport_d'] = $res['p_d'];
		$_SESSION['f_passport_m'] = $res['p_m'];
		$_SESSION['f_passport_y'] = $res['p_y'];
	}
}

function GetFormData() {

	// Извчлечём данные из формы:

	$_SESSION['f_email'] = trim($_POST['f_email']);
	$_SESSION['f_phone_m'] = trim($_POST['f_phone_m']);

	$_SESSION['f_name'] = trim($_POST['f_name']);
	$_SESSION['f_midname'] = trim($_POST['f_midname']);
	$_SESSION['f_lastname'] = trim($_POST['f_lastname']);

	$_SESSION['f_birthdate_d'] = $_POST['f_birthdate_d'];
	$_SESSION['f_birthdate_m'] = $_POST['f_birthdate_m'];
	$_SESSION['f_birthdate_y'] = $_POST['f_birthdate_y'];

	$_SESSION['f_passport_type'] = $_POST['f_passport_type'];
	$_SESSION['f_passport'] = trim($_POST['f_passport']);
	$_SESSION['f_passport_place'] = trim($_POST['f_passport_place']);
	$_SESSION['f_passport_organ'] = trim($_POST['f_passport_organ']);
	$_SESSION['f_passport_d'] = trim($_POST['f_passport_d']);
	$_SESSION['f_passport_m'] = trim($_POST['f_passport_m']);
	$_SESSION['f_passport_y'] = trim($_POST['f_passport_y']);

	$_SESSION['f_town'] = trim($_POST['f_town']);
	$_SESSION['f_country'] = trim($_POST['f_country']);
	$_SESSION['f_citizen'] = trim($_POST['f_citizen']);
	$_SESSION['f_address'] = trim($_POST['f_address']);

	$_SESSION['f_trip_1'] = $_POST['f_trip_1'];
	$_SESSION['f_trip_2'] = $_POST['f_trip_2'];
	$_SESSION['f_trip_3'] = $_POST['f_trip_3'];
	$_SESSION['f_trip_4'] = $_POST['f_trip_4'];
    $_SESSION['f_total'] = $_POST['f_total'];

	$_SESSION['f_payment_way_select'] = $_POST['f_payment_way_select'];
	$_SESSION['f_payment_way'] = $_POST['f_payment_way'];
	$_SESSION['f_comments'] = $_POST['f_comments'];

	$_SESSION['f_ning_profile'] = $_POST['f_ning_profile'];

}

function Validate() {

	global $_POST, $error_titles;

	$error_titles = array();

	// Проверим введенные данные:

	if ( 0 == strlen(trim($_SESSION['f_name']))*strlen(trim($_SESSION['f_midname']))*strlen(trim($_SESSION['f_lastname'])) )
		{$error_titles['name'] = "Введите Ваши имя, отчество и фамилию.";
         }
	if ( empty($_SESSION['f_email']) ||
		 "" == trim($_SESSION['f_email']) ||
		 ! preg_match("/[\w]+(\.[\w-]+)*@[\w-]+\.(\.[\w-]+)*/",$_SESSION['f_email']) )
		$error_titles['email'] = "Ваш e-mail неверный.";

	if ( empty($_SESSION['f_phone_m']) || 0 == strlen(trim($_SESSION['f_phone_m'])) )
		$error_titles['phone_m'] = "Укажите мобильник";

	if ( 0 == strlen(trim($_SESSION['f_country'])) *
				strlen(trim($_SESSION['f_town'])) *
				strlen(trim($_SESSION['f_address']))
		&& $_SESSION['f_notneed_invitation'] != '1')
		{$error_titles['address'] = "Введите страну, город и адрес.";
         }
	if ( empty($_SESSION['f_passport']) || "" == trim($_SESSION['f_passport']) ||
		 empty($_SESSION['f_passport_place']) || "" == trim($_SESSION['f_passport_place']) ||
		 empty($_SESSION['f_citizen']) || "" == trim($_SESSION['f_citizen'])
		)
		{$error_titles['passport'] = "Введите данные паспорта.";
         }
	if ( "1" !== $_SESSION['f_trip_1'] &&
		 "1" !== $_SESSION['f_trip_2'] &&
     	 "1" !== $_SESSION['f_trip_3'] &&
    	 "1" !== $_SESSION['f_trip_4']
    	 )
	{
		$error_titles['trips'] = "Выберите один из участков зимней поездки.";
	}

	if ( 0 == strlen(trim($_SESSION['f_payment_way_select'])) )
		$error_titles['payment_way'] = "Пожалуйста, выберите способ оплаты.";

}

?>