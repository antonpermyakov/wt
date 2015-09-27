<?session_start();// Этот файл содержит форму для ввода пароля. Тут же проверяется этот ввод, и если он верный// то сохраняется переменная в сессию, после чего идёт редирект на первую страницу админки. // В этом же файле выполняется проверка на логаут (стирается переменная из сессии).// для подключения глобальной переменной $glob_pass и $glob_year:require_once("config.php");
// Проверим - логинится пользователь или нетif ( "POST" == $_SERVER["REQUEST_METHOD"] ){	if ( $glob_pass == $_POST["f_pass"] ) // Успешно залогинился! Запомним пароль в сессии	{		$_SESSION[admin_pass] = $glob_pass;		header('Location: admin.php');		exit(0); 	}}
// А может быть наоборот - логаутится:if ( "GET" == $_SERVER["REQUEST_METHOD"] && "1" == $_GET["f_out"] ) $_SESSION[admin_pass] = '';?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Админка зимней поездки <?=$glob_year?></title>
<meta content="text/html; charset=windows-1251" http-equiv="Content-Type" />
<link href="admin.css" rel="stylesheet" type="text/css" />
</head>
<div id="wrapper">
<br clear="all" />
<h1><strong>Админка зимней поездки <?=$glob_year?></strong></h1>

<form method="post">
Друг, скажи заветное слово: 
<input type="password" name="f_pass" /> <input type="submit" value="Войти" />
</form>

</div>
</body>
</html>

