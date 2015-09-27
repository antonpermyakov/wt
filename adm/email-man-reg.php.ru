<?php
//определимся с участком
$start_point=0; $end_point=0;
for($i=1; $i<=9; $i++){
    if($start_point===0&&$row['visit_'.$i]==="1"){$start_point=$i;}
    if($row['visit_'.$i]==="1"){$end_point=$i;}
}
$start_point-=1;
$end_point-=1;
$mail_email = $email;
$mail_subj = "Зимняя регистрация ".$glob_year.". Оплата.";
$mail_body = "
Дорогой ".htmlspecialchars($row["name"])." ".htmlspecialchars($row["lastname"]).",
номер WT{$glob_YY}R-".$row["id"].", поздравляем, ты успешно внесён в список путешествующей группы
на участке: от пункта \"{$GLOBALS[f_trip_names][$start_point]}\" до пункта \"{$GLOBALS[f_trip_names][$end_point]}\"
в связи с подтверждением оплаты.


Комментарий от оргкоманды:

  ".$fomc;

?>
