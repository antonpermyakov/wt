<?php
//����������� � ��������
$start_point=0; $end_point=0;
for($i=1; $i<=9; $i++){
    if($start_point===0&&$row['visit_'.$i]==="1"){$start_point=$i;}
    if($row['visit_'.$i]==="1"){$end_point=$i;}
}
$start_point-=1;
$end_point-=1;
$mail_email = $email;
$mail_subj = "������ ����������� ".$glob_year.". ������.";
$mail_body = "
������� ".htmlspecialchars($row["name"])." ".htmlspecialchars($row["lastname"]).",
����� WT{$glob_YY}R-".$row["id"].", �����������, �� ������� ����� � ������ �������������� ������
�� �������: �� ������ \"{$GLOBALS[f_trip_names][$start_point]}\" �� ������ \"{$GLOBALS[f_trip_names][$end_point]}\"
� ����� � �������������� ������.


����������� �� ����������:

  ".$fomc;

?>
