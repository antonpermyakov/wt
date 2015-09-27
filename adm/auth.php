<?
// Этот файл содержит лишь проверку того, что в сессии находится верный 
// пароль администратора. Если это не так, то идёт редирект на страницу с 
// логином для администратора.
session_start();

require_once("config.php");

if ( $glob_pass != $_SESSION[admin_pass] ) 
{
	header('Location: index.php');
	exit(0);
}

?>