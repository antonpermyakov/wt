<?php

include "service/qmail.php"; // must be before include "php/admin/mysql.php";
include "php/admin/mysql.php";
include "php/utils.php";
include "wt-config.php";
session_start();

connect_wt_reg();

$res = mysql_query("SHOW TABLES", $qmail_link) or
die("MYSQL Error in <b>".__FILE__."</b> at line <b>".__LINE__."</b><br />" . mysql_error());

while ($row = mysql_fetch_assoc($res)) {
    echo $row['Tables_in_dwbru'] . "<br/>";
}

?>