<?
$mail_subj = "����������� �� ������ ������� (extra) $glob_year, ����� $glob_year-$_SESSION[f_id]-Rus";
$mail_email = $org_email;
$mail_body = "������ ����.
��� �������������� ������ c ���-����� www.buddhism.ru.
���������������� ������ ����������� ���������� �� ������ ��� $glob_year.

-------------
Email: $_SESSION[f_email]
��������� �������: $_SESSION[f_phone_m]
Other: $_SESSION[f_ning_profile]

0. ���������� �����: WT{$glob_YY}RE-$_SESSION[f_id]
1. �������: $_SESSION[f_lastname]
2. ���: $_SESSION[f_name]
3. ��������: $_SESSION[f_midname]
4. ���� ��������: $_SESSION[f_birthdate_d].$_SESSION[f_birthdate_m].$_SESSION[f_birthdate_y]
5. ������: $_SESSION[f_country]
6. �����: $_SESSION[f_town], �����: $_SESSION[f_address]

7. ��� ��������� (��������): "
.(
			$_SESSION[f_passport_type] == "RF" ? "����������" :
			($_SESSION[f_passport_type] == "ZGP" ? "������ �������" :
			($_SESSION[f_passport_type] == "nonRF" ? "�� ����������" : "������ ��������"))
		).
"
8. �����������: $_SESSION[f_citizen]
9. ����� ��������: " . str_replace( " ", "", str_replace( "�", "", $_SESSION[f_passport] )) . "
10. ���� ������ ��������: $_SESSION[f_passport_d].$_SESSION[f_passport_m].$_SESSION[f_passport_y]
11. ����� ������ ��������: $_SESSION[f_passport_place]
12. �����, �������� �������: $_SESSION[f_passport_organ]
13. ������� ����������: (����� ��  $f_total_sum ������)"
.( "1" === $_SESSION[f_trip_1] ? "
".$GLOBALS['f_trip_names'][0]." (".$GLOBALS['f_trip_rur'][0]." ������)" : "" )
.( "1" === $_SESSION[f_trip_2] ? "
".$GLOBALS['f_trip_names'][1]." (".$GLOBALS['f_trip_rur'][1]." ������)" : "" )
.( "1" === $_SESSION[f_trip_3] ? "
".$GLOBALS['f_trip_names'][2]." (".$GLOBALS['f_trip_rur'][2]." ������)" : "" )
.( "1" === $_SESSION[f_trip_4] ? "
".$GLOBALS['f_trip_names'][3]." (".$GLOBALS['f_trip_rur'][3]." ������)" : "" )
."

������ ������: $_SESSION[f_payment_way_select]".( $_SESSION[f_payment_way_select] == "other" ? "
$_SESSION[f_payment_way]" : "")."

����������� ���������������������:
----
".str_replace("\n"," ",str_replace("\r"," ",$_SESSION[f_comments]))."

-----------------------------

����� � �������,
web@buddhism.ru";
?>