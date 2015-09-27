
<?php

ini_set('display_errors',1);
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

$NOADDS = 'yes';

include "php/admin/mysql.php";
include "php/utils.php";
include "wt-config.php";
session_start();
connect();
include("php/main.php");

?>
