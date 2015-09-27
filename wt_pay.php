
<?php

ini_set('display_errors',1);
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

$NOADDS = 'yes';

$GLOBALS['pay_errors'] = array();
global $pay_errors;
$pay_errors = array();
include "php/admin/mysql.php";
include "php/utils.php";
include "wt-config.php";
session_start();
connect();
include("php/main.php");

?>
