<?

  ini_set('display_errors',1);
  error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

//error_reporting (E_ERROR);
$lang = $_REQUEST['lang'];

/**
 * if($_POST['anthr_reg']==="yes"){
 *     foreach($_SESSION as $key=>$value){
 *         $_SESSION[$key]=null;
 *     }
 * }
 */

$ADDTITLE = ( $lang ? 'Рег-я на русском:' : 'For payment in euro:' );

include "service/qmail.php"; // must be before include "php/admin/mysql.php";
include "php/admin/mysql.php";
include "php/utils.php";
include "wt-config.php";
session_start();
$get_id=secure_get($_REQUEST['id']);


if($_GET['anthr_reg']==="No"||$get_id!==""){
    $_SESSION['anthr_reg']="No";
}else{$_SESSION['anthr_reg']="Yes";}
if($_POST['anthr_reg']==="Yes"){
    $_SESSION['anthr_reg']="Yes";
}



$HEADER1 = ( $lang ?
			"Russian winter tour $glob_year registration" :
			"Регистрация на зимнюю поездку $glob_year"
			);
$HEADER2 = '';

$rus = 1; $eng = 0;
if ( $lang ) { $rus = 0; $eng = 1; }

connect_wt_reg();

$NOSUBSCR="yes";

$ref = $_SERVER['HTTP_REFERER'];

if (strpos($ref,'www.buddhism.ru')===false && $_SESSION['new_site']!=="yes"){
	include("php/main.php");
}else{
	$_SESSION['new_site']="yes";
	echo "<style>
	label#passport {text-align: left; width: 500px;}
	</style>";
	echo '<div id="centralcolumn">';
	include($_SERVER['SCRIPT_FILENAME'].".main");
	echo "</div>";

	}
?>