<?
$mail_subj = "Регистрация на зимнюю поездку (extra) $glob_year, номер $glob_year-$_SESSION[f_id]-Rus";
$mail_email = $org_email;
$mail_body = "Добрый день.
Это информационное письмо c веб-сайта www.buddhism.ru.
Зарегистрирована заявка российского гражданина на зимний тур $glob_year.

-------------
Email: $_SESSION[f_email]
Мобильный телефон: $_SESSION[f_phone_m]
Other: $_SESSION[f_ning_profile]

0. Уникальный номер: WT{$glob_YY}RE-$_SESSION[f_id]
1. Фамилия: $_SESSION[f_lastname]
2. Имя: $_SESSION[f_name]
3. Отчество: $_SESSION[f_midname]
4. Дата рождения: $_SESSION[f_birthdate_d].$_SESSION[f_birthdate_m].$_SESSION[f_birthdate_y]
5. Страна: $_SESSION[f_country]
6. Город: $_SESSION[f_town], Адрес: $_SESSION[f_address]

7. Тип документа (паспорта): "
.(
			$_SESSION[f_passport_type] == "RF" ? "Российский" :
			($_SESSION[f_passport_type] == "ZGP" ? "Загран паспорт" :
			($_SESSION[f_passport_type] == "nonRF" ? "не Российский" : "другой документ"))
		).
"
8. Гражданство: $_SESSION[f_citizen]
9. Номер паспорта: " . str_replace( " ", "", str_replace( "№", "", $_SESSION[f_passport] )) . "
10. Дата выдачи паспорта: $_SESSION[f_passport_d].$_SESSION[f_passport_m].$_SESSION[f_passport_y]
11. Место выдачи паспорта: $_SESSION[f_passport_place]
12. Орган, выдавший паспорт: $_SESSION[f_passport_organ]
13. Маршрут следования: (всего на  $f_total_sum рублей)"
.( "1" === $_SESSION[f_trip_1] ? "
".$GLOBALS['f_trip_names'][0]." (".$GLOBALS['f_trip_rur'][0]." рублей)" : "" )
.( "1" === $_SESSION[f_trip_2] ? "
".$GLOBALS['f_trip_names'][1]." (".$GLOBALS['f_trip_rur'][1]." рублей)" : "" )
.( "1" === $_SESSION[f_trip_3] ? "
".$GLOBALS['f_trip_names'][2]." (".$GLOBALS['f_trip_rur'][2]." рублей)" : "" )
.( "1" === $_SESSION[f_trip_4] ? "
".$GLOBALS['f_trip_names'][3]." (".$GLOBALS['f_trip_rur'][3]." рублей)" : "" )
."

Способ оплаты: $_SESSION[f_payment_way_select]".( $_SESSION[f_payment_way_select] == "other" ? "
$_SESSION[f_payment_way]" : "")."

Комментарии зарегистрировавшегося:
----
".str_replace("\n"," ",str_replace("\r"," ",$_SESSION[f_comments]))."

-----------------------------

Удачи и радости,
web@buddhism.ru";
?>