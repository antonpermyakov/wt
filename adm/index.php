<?session_start();// ���� ���� �������� ����� ��� ����� ������. ��� �� ����������� ���� ����, � ���� �� ������// �� ����������� ���������� � ������, ����� ���� ��� �������� �� ������ �������� �������. // � ���� �� ����� ����������� �������� �� ������ (��������� ���������� �� ������).// ��� ����������� ���������� ���������� $glob_pass � $glob_year:require_once("config.php");
// �������� - ��������� ������������ ��� ���if ( "POST" == $_SERVER["REQUEST_METHOD"] ){	if ( $glob_pass == $_POST["f_pass"] ) // ������� �����������! �������� ������ � ������	{		$_SESSION[admin_pass] = $glob_pass;		header('Location: admin.php');		exit(0); 	}}
// � ����� ���� �������� - ����������:if ( "GET" == $_SERVER["REQUEST_METHOD"] && "1" == $_GET["f_out"] ) $_SESSION[admin_pass] = '';?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>������� ������ ������� <?=$glob_year?></title>
<meta content="text/html; charset=windows-1251" http-equiv="Content-Type" />
<link href="admin.css" rel="stylesheet" type="text/css" />
</head>
<div id="wrapper">
<br clear="all" />
<h1><strong>������� ������ ������� <?=$glob_year?></strong></h1>

<form method="post">
����, ����� �������� �����: 
<input type="password" name="f_pass" /> <input type="submit" value="�����" />
</form>

</div>
</body>
</html>

