<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>csv reader</title>
</head>
<body>
    <?php
       echo '<table border="1">';
       $start_row = 1;
       if (($csv_file = fopen("D://2.csv", "r")) !== FALSE) {
       while (($read_data = fgetcsv($csv_file)) !== FALSE && $start_row!=1000 ) {
            $column_count = count($read_data);
	        echo '<tr>';
            $start_row++;
            for ($c=0; $c < $column_count; $c++) {
                echo "<td>".$read_data[$c] . "</td>";
            }
	    echo '</tr>';
        }
        fclose($csv_file);
        }
        echo '</table>';
    ?>

</body>
</html>