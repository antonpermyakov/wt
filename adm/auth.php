<?
// ���� ���� �������� ���� �������� ����, ��� � ������ ��������� ������ 
// ������ ��������������. ���� ��� �� ���, �� ��� �������� �� �������� � 
// ������� ��� ��������������.
session_start();

require_once("config.php");

if ( $glob_pass != $_SESSION[admin_pass] ) 
{
	header('Location: index.php');
	exit(0);
}

?>