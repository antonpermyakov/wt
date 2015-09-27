<?
$lang = $_REQUEST['lang'];

$ADDTITLE = ( $lang ? 'Payment successful' : 'Платёж успешен' );

include "service/qmail.php"; // must be before include "php/admin/mysql.php";
include "php/admin/mysql.php";
include "php/utils.php";
include "wt-config.php";
session_start();



$HEADER1 = ( $lang ?
			"Russian winter tour $glob_year registration" :
			"Регистрация на зимнюю поездку $glob_year"
			);
$HEADER2 = '';

$rus = 1; $eng = 0;
if ( $lang ) { $rus = 0; $eng = 1; }

connect();

$NOSUBSCR="yes";

$ref = $_SERVER['HTTP_REFERER'];

if (strpos($ref,'www.buddhism.ru')===false && $_SESSION['new_site']!=="yes"){
	include("php/main.php");
}else{
	$_SESSION['new_site']="yes";
	echo "<style>
	label#passport {text-align: left; width: 500px;}
	</style>";	echo '<div id="centralcolumn">';
	include($_SERVER['SCRIPT_FILENAME'].".main");
	echo "</div>";

	}
?>