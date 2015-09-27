<?php
require("auth.php");

$res 	= mysql_query("SELECT
						`wt_{$glob_year}_id` id,
						`name`,
						`midname`,
						`lastname`,
						`initials`,
						`email`,
						`birthdate`,
						`phone_m`,
						`address`,
						`town`,
						`country`,
						`passport`,
						`passport_date`,
						`passport_place`,
						`passport_expire`,
						`eng`,
						`sex`,
						`visit_1`,
						`visit_2`,
						`visit_3`,
						`visit_4`,
						`visit_5`,
						`visit_6`,
						`visit_7`,
						`visit_8`,
						`visit_9`,
						`coupe`,
						`payment`,
						`total_sum`,
						`org_paid`,
						`org_paid_date`,
						`total_sum`,
						`comments`,
						`org_comments`,
						`mark_del`
						FROM `wt_{$glob_year}`
						ORDER BY id"
	) or die("<b>Àøûïêî:</b> MySQL error: ".mysql_error());

	$arr = array();

while($row = mysql_fetch_array($res, MYSQL_ASSOC))
{
	array_push($arr, $row);
}

/*foreach($arr as $k=>$v)
{
	if ($k=='phone_m'){
	$arr[$k]=chunk_split($v,3,"-");}
}*/

mysql_free_result($res);

createCSV($arr, "WT".$glob_year."People", 1);


/*
*
*This function will return a .csv from a given array inside the $_SESSION['my_array']
*
*$sql_res  -> the sql query result
*$csv_name -> the name we want the csv has to
*$download -> true or false to download the csv file after done
*
*/


function createCSV($my_array, $csv_name, $download) {

        if ( count($my_array) < 1 ) { echo "No data in table!"; return; }
	$i = 1;
        $csv = "";

        /* erase the old file, if it exists */
        @unlink("./csv/" . $csv_name . ".csv");

        /* how many fields has the given array */
        $fields = count(array_keys($my_array[0]));

        /* extracting the titles from the array */
        foreach(array_keys($my_array[0]) as $title)
        {
            /* array_keys percurs the title of each vector */
            $csv .= $title;

            /* while it is not the last field put a semi-colon ; */
            if($i < $fields)
                $csv .= ";";

            $i++;
        }

        /* insert an empty line to better visualize the csv */
        $csv .= chr(13);

        /* get the values from the extracted keys */
        foreach (array_keys($my_array) as $tipo)
        {

            $i = 1;

            foreach(array_keys($my_array[$tipo]) as $sub)
            {
               if ($sub == "phone_m" and strpos($my_array[$tipo][$sub],"-")===false){
               	$csv .=chunk_split($my_array[$tipo][$sub],3,"-");
               	}
               	elseif($sub == "passport"){
                $csv .= "'".$my_array[$tipo][$sub]."'";
               		}
               	else{
                $csv .= str_replace("&#180;","'",$my_array[$tipo][$sub]);
                }
                if ($i < $fields)
                    $csv .= ";";

                $i++;
            }

            $csv .= chr(13);

        }

        /* export the csv */
        $export_csv=fopen("./csv/". $csv_name .".csv", "w+");
        fwrite($export_csv, $csv);
        fclose($export_csv);

        /* download the csv */
        if ($download == true)
            header('Location:' . "./csv/" . $csv_name . ".csv");

        exit();

    }


?>










