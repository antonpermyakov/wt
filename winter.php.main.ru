<?
$get_key=secure_get($_GET['key']);
$get_id=secure_get($_GET['id']);

if (!isset($_POST['f_birthdate_y'])&&!isset($_SESSION['f_birthdate_y'])){$_SESSION['f_birthdate_y'] = 2000;}



// ���� �� �� ��� ���������� - �� ���� ������ ������ � ������ ��� ������ ������� ������,
// ���� ������� - ����� �� �� ������, ��� ������ �����,
// ���� ������ � �� � �������� ��� �������������.
//include('/htdocs/php/utils.php');

if ($_POST['form']) {
   
	GetFormData();
	Validate();

	if ( count($error_titles) > 0 ) {

		// ������� ������ � ����� �������� ��������� �����
	    $_SESSION['system_message'] = "<font color='red'>".join("<br>", $error_titles)."</font>";
        $_SESSION['anthr_reg']="No";
	} else if ($_POST['sure']) { // ��� ���� ��� ��������� � ��

		// ���������� �����
       $f_total_sum = $_SESSION['f_total'];
        //���� ��� ������ - ��������
        if($_SESSION['is_upd_trnsact']==="yes_OK"){
            $q_str="UPDATE `wt_$glob_year`
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
				`passport`  = '".addslashes(str_replace( " ", "", str_replace( "�", "", $_SESSION[f_passport] )))."',
				`passport_date` = '$_SESSION[f_passport_y]-$_SESSION[f_passport_m]-$_SESSION[f_passport_d]',
				`passport_place` = '".addslashes($_SESSION[f_passport_place])."',
				`passport_organ` = '".addslashes($_SESSION[f_passport_organ])."',
				`eng` = '0',
				`visit_1` = '".("1" === $_SESSION[f_trip_1] ? "1" : "0")."',
				`visit_2` = '".("1" === $_SESSION[f_trip_2] ? "1" : "0")."',
				`visit_3` = '".("1" === $_SESSION[f_trip_3] ? "1" : "0")."',
				`visit_4` = '".("1" === $_SESSION[f_trip_4] ? "1" : "0")."',
				`visit_5` = '".("1" === $_SESSION[f_trip_5] ? "1" : "0")."',
				`visit_6` = '".("1" === $_SESSION[f_trip_6] ? "1" : "0")."',
				`visit_7` = '".("1" === $_SESSION[f_trip_7] ? "1" : "0")."',
				`visit_8` = '".("1" === $_SESSION[f_trip_8] ? "1" : "0")."',
				`visit_9` = '".("1" === $_SESSION[f_trip_9] ? "1" : "0")."',
                `coupe`   = '".("1" === $_SESSION[f_coupe_ch] ? "1" : "0")."',
				`payment_select` = '$_SESSION[f_payment_way_select]',
				`payment` = '".addslashes($_SESSION[f_payment_way])."',
				`total_sum` = '". $_SESSION[f_total]."',
				`ning_profile` = '".addslashes($_SESSION[f_ning_profile])."',
				`comments` = '".addslashes(str_replace("\n"," ",str_replace("\r"," ",$_SESSION[f_comments])))."'
                WHERE `wt_{$glob_year}_id`=$_SESSION[f_id]";
                
				$tresult = mysql_query($q_str) or die("MySQL error: ".mysql_error());
                
             
        }
		//����� ������� ����� ������ � ��
		else{
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
    									`passport`  = '".addslashes(str_replace( " ", "", str_replace( "�", "", $_SESSION[f_passport] )))."',
    									`passport_date` = '$_SESSION[f_passport_y]-$_SESSION[f_passport_m]-$_SESSION[f_passport_d]',
    									`passport_place` = '".addslashes($_SESSION[f_passport_place])."',
    									`passport_organ` = '".addslashes($_SESSION[f_passport_organ])."',
    									`eng` = '0',
    									`visit_1` = '".("1" === $_SESSION[f_trip_1] ? "1" : "0")."',
    									`visit_2` = '".("1" === $_SESSION[f_trip_2] ? "1" : "0")."',
    									`visit_3` = '".("1" === $_SESSION[f_trip_3] ? "1" : "0")."',
    									`visit_4` = '".("1" === $_SESSION[f_trip_4] ? "1" : "0")."',
    									`visit_5` = '".("1" === $_SESSION[f_trip_5] ? "1" : "0")."',
    									`visit_6` = '".("1" === $_SESSION[f_trip_6] ? "1" : "0")."',
    									`visit_7` = '".("1" === $_SESSION[f_trip_7] ? "1" : "0")."',
    									`visit_8` = '".("1" === $_SESSION[f_trip_8] ? "1" : "0")."',
    									`visit_9` = '".("1" === $_SESSION[f_trip_9] ? "1" : "0")."',
                                        `coupe`   = '".("1" === $_SESSION[f_coupe_ch] ? "1" : "0")."',
    									`payment_select` = '$_SESSION[f_payment_way_select]',
    									`payment` = '".addslashes($_SESSION[f_payment_way])."',
    									`total_sum` = '". $_SESSION[f_total]."',
    									`ning_profile` = '".addslashes($_SESSION[f_ning_profile])."',
    									`comments` = '".addslashes(str_replace("\n"," ",str_replace("\r"," ",$_SESSION[f_comments])))."'"
    									) or die("MySQL error: ".mysql_error());
    
    		// ������� ����� ID:
    		$_SESSION['f_id'] = mysql_insert_id();
    		// �������� ���� �� �������� wt{$glob_YY}r_reg@buddhism.ru:
        // OK, both reset, put the applicant onto the mailing list
    
    		 mysql_query("INSERT INTO wt{$glob_YY}r_reg
        (hash, address)
    			VALUES (" . ezmlm_hash($_SESSION[f_email]) .  ", '$_SESSION[f_email]' ) ", $qmail_link) or
     			die("MYSQL Error in <b>".__FILE__."</b> at line <b>".__LINE__."</b><br />" . mysql_error());
         }   
		// ������ �������������
		include("email-org.php.ru");
		$res = email($mail_email, $mail_subj, $mail_body, $org_email);

		// ������ ��������������������� ��������
		include("email-man.php.ru");
		$res = email($mail_email, $mail_subj, $mail_body, $org_email);

		include("thanks.ru.html");
        $_SESSION['is_upd_trnsact']="";
		exit(0);
        
	} else { // ������ ���, �� ���� �������� ��� ������������� ����� ��� �������������:
		include("forsure.ru.html");
		exit(0);
	}

}

else

{
   
//���� ���� ���������� $_get, �� �������� �� ������� ������ � ��������� ���
// ���� ��� ���������, �� ��������� ���������� ������ ������� �� �������

    if ($get_key!==""&&$get_id!==""){
      
        $q_str="SELECT 
                    name, midname, lastname, email, phone_m,
    				DATE_FORMAT(birthdate, '%e') birthdate_d,
    				DATE_FORMAT(birthdate, '%c') birthdate_m,
    				DATE_FORMAT(birthdate, '%Y') birthdate_y,
    				passport_type, passport,passport_place, passport_organ,
    				DATE_FORMAT(passport_date, '%e') passport_d,
    				DATE_FORMAT(passport_date, '%c') passport_m,
    				DATE_FORMAT(passport_date, '%Y') passport_y,
    				town,country,citizenship,address,
                    visit_1,visit_2,visit_3,visit_4,visit_5,visit_6,visit_7,
                    visit_8,visit_9,coupe,total_sum,
                    payment_select, payment, comments        
         FROM `wt_{$glob_year}` where `wt_{$glob_year}_id`= $get_id AND  `mark_del` = '0' AND `org_paid` =  '0'";
         
        $res=mysql_query($q_str);
        $num_rows=mysql_num_rows($res);
         
        if($num_rows<>0){
              
        	$row=mysql_fetch_assoc($res);
        	$name=$row["name"];
        	$lastname=$row["lastname"];
        
        	$key1=md5(substr($row["email"],0,3).$get_id.substr($row["lastname"],0,3));
            
        	if($get_key===$key1){
        			$_SESSION['f_email'] = trim($row['email']);
                	$_SESSION['f_phone_m'] = trim($row['phone_m']);
                
                	$_SESSION['f_name'] = trim($row['name']);
                	$_SESSION['f_midname'] = trim($row['midname']);
                	$_SESSION['f_lastname'] = trim($row['lastname']);
                
                	$_SESSION['f_birthdate_d'] = $row['birthdate_d'];
                	$_SESSION['f_birthdate_m'] = $row['birthdate_m'];
                	$_SESSION['f_birthdate_y'] = $row['birthdate_y'];
                
                	$_SESSION['f_passport_type'] = $row['passport_type'];
                	$_SESSION['f_passport'] = trim($row['passport']);
                	$_SESSION['f_passport_place'] = trim($row['passport_place']);
                	$_SESSION['f_passport_organ'] = trim($row['passport_organ']);
                	$_SESSION['f_passport_d'] = trim($row['passport_d']);
                	$_SESSION['f_passport_m'] = trim($row['passport_m']);
                	$_SESSION['f_passport_y'] = trim($row['passport_y']);
                
                	$_SESSION['f_town'] = trim($row['town']);
                	$_SESSION['f_country'] = trim($row['country']);
                	$_SESSION['f_citizen'] = trim($row['citizenship']);
                	$_SESSION['f_address'] = trim($row['address']);
                
                	$_SESSION['f_trip_1'] = $row['visit_1'];
                	$_SESSION['f_trip_2'] = $row['visit_2'];
                	$_SESSION['f_trip_3'] = $row['visit_3'];
                	$_SESSION['f_trip_4'] = $row['visit_4'];
                	$_SESSION['f_trip_5'] = $row['visit_5'];
                	$_SESSION['f_trip_6'] = $row['visit_6'];
                	$_SESSION['f_trip_7'] = $row['visit_7'];
                	$_SESSION['f_trip_8'] = $row['visit_8'];
                	$_SESSION['f_trip_9'] = $row['visit_9'];
           
                	$_SESSION['f_coupe_ch'] = $row['coupe'];
                    $_SESSION['f_total'] = $row['total_sum'];
                
                	$_SESSION['f_payment_way_select'] = $row['payment_select'];
                	$_SESSION['f_payment_way'] = $row['payment'];
                	$_SESSION['f_comments'] = $row['comments'];
                    $_SESSION['is_upd_trnsact'] = "yes_OK";
                    $_SESSION['f_id']=$get_id; 
                //	$_SESSION['f_ning_profile'] = $row[ning_profile'];
              
        	}
            }else{
                $_SESSION['system_message'] = "����� �������� �� ������, ��� ��� �����, ��� ��������� ������";
            }
    }

}

function GetFormData() {

	// �������� ������ �� �����:

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
	$_SESSION['f_trip_5'] = $_POST['f_trip_5'];
	$_SESSION['f_trip_6'] = $_POST['f_trip_6'];
	$_SESSION['f_trip_7'] = $_POST['f_trip_7'];
	$_SESSION['f_trip_8'] = $_POST['f_trip_8'];
	$_SESSION['f_trip_9'] = $_POST['f_trip_9'];
 
	$_SESSION['f_coupe_ch'] = $_POST['f_coupe_ch'];
    $_SESSION['f_total'] = $_POST['f_total'];

	$_SESSION['f_payment_way_select'] = $_POST['f_payment_way_select'];
	$_SESSION['f_payment_way'] = $_POST['f_payment_way'];
	$_SESSION['f_comments'] = $_POST['f_comments'];
   // $_SESSION['is_upd_trnsact'] = $_POST['is_upd_trnsact'];

	$_SESSION['f_ning_profile'] = $_POST['f_ning_profile'];

}

function Validate() {

	global $_POST, $error_titles;

	$error_titles = array();

	// �������� ��������� ������:

	if ( 0 == strlen(trim($_SESSION['f_name']))*strlen(trim($_SESSION['f_midname']))*strlen(trim($_SESSION['f_lastname'])) )
		{$error_titles['name'] = "������� ���� ���, �������� � �������.";
         }
	if ( empty($_SESSION['f_email']) ||
		 "" == trim($_SESSION['f_email']) ||
		 ! preg_match("/[\w]+(\.[\w-]+)*@[\w-]+\.(\.[\w-]+)*/",$_SESSION['f_email']) )
		$error_titles['email'] = "��� e-mail ��������.";

	if ( empty($_SESSION['f_phone_m']) || 0 == strlen(trim($_SESSION['f_phone_m'])) )
		$error_titles['phone_m'] = "������� ���������";

	if ( 0 == strlen(trim($_SESSION['f_country'])) *
				strlen(trim($_SESSION['f_town'])) *
				strlen(trim($_SESSION['f_address']))
		&& $_SESSION['f_notneed_invitation'] != '1')
		{$error_titles['address'] = "������� ������, ����� � �����.";
         }
	if ( empty($_SESSION['f_passport']) || "" == trim($_SESSION['f_passport']) ||
		 empty($_SESSION['f_passport_place']) || "" == trim($_SESSION['f_passport_place']) ||
		 empty($_SESSION['f_citizen']) || "" == trim($_SESSION['f_citizen'])
		)
		{$error_titles['passport'] = "������� ������ ��������.";
         }

 
 $chckd=0;
  for($i=1;$i<=11;$i=$i+2){
   $chckd=$chckd+$_SESSION['f_trip_'.$i]; 
  }
  if($chckd<3){
    $error_titles['trips'] = "������� ������������ ������� ��� ������� � ����";
  }

	if ( 0 == strlen(trim($_SESSION['f_payment_way_select'])) )
		$error_titles['payment_way'] = "����������, �������� ������ ������.";

}

?>