<?php 
require "inc/header.php";
require 'inc/loginMysql.php';

if(isset($_POST['delete']) && isset($_POST['survey_id'])){
    $survey_id=get_post($link,'survey_id');
    $query = "DELETE FROM entity_survey WHERE survey_id='$survey_id'";
    $result = $link->query($query);
    if(!$result) echo "DELETE failed<br><br>";
}

if(isset($_POST['description']) &&
        isset($_POST['survey_name']) &&
        isset($_POST['start_date']) &&
        isset($_POST['end_date'])){
//    $survey_id=get_post($link,'survey_id');
    $survey_name=get_post($link,'survey_name');
    $description=get_post($link,'description');
    $start_date=get_post($link,'start_date');
    $end_date=get_post($link,'end_date');
//    $session=get_post($link,'session');
    $query="INSERT INTO entity_survey VALUES".
            "(NULL,'$survey_name','$description','$start_date','$end_date',NULL)";
    $result=$link->query($query);
    if(!$result) echo "INSERT failed<br><br>";
}

echo <<<_END
<form action="create_survey_form.php" method="post"><pre>
    Survey Name <input type='text' name='survey_name'>
    Description <input type='text' name='description'>
    Start Date <input type='date' name='start_date'>
    End Date <input type='date' name='end_date'>
	
</pre><button type="submit">CREATE SURVEY</button></form>
_END;

$query = "SELECT * FROM entity_survey";
$result = $link->query($query);
if(!$result) die("Database access failed");

$rows=$result->num_rows;

for($j=0;$j<$rows;++$j){
    $row=$result->fetch_array(MYSQLI_NUM);
    
    $r0= htmlspecialchars($row[0]);
    $r1= htmlspecialchars($row[1]);
    $r2= htmlspecialchars($row[2]);
    $r3= htmlspecialchars($row[3]);
    $r4= htmlspecialchars($row[4]);
    $r5= htmlspecialchars($row[5]);

echo <<<_END
<pre>
    Survey ID   $r0
    Survey Name $r1
    Description $r2
    Start Date  $r3
    End Date    $r4
    Session     $r5
</pre>
<form action='create_survey_form.php" method="post">
<input type='hidden' name='delete' value='yes'>
<input type='hidden' name='survey_id' value='$r0'>
<input type='submit' value='DELETE SURVEY'></form> 
_END;
}

$result->close();
$link->close();

function get_post($link,$var){
    return $link->real_escape_string($_POST[$var]);
}

        
?>        
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Survey</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    
</head>
<body>
<!--    <form action="create_survey_form.php" method="post"><pre>
    Survey Name <input type='text' name='survey_name'>
    Description <input type='text' name='description'>
    Start Date <input type='date' name='start_date'>
    End Date <input type='date' name='end_date'>
	<button type="submit">Create Survey</button>
</pre></form>

<pre>
    Survey ID   $r0
    Survey Name $r1
    Description $r2
    Start Date  $r3
    End Date    $r4
    Session     $r5
</pre>
<form action='create_survey_form.php" method="post">
<input type='hidden' name='delete' value='yes'>
<input type='hidden' name='survey_id' value='$r0'>
<input type='submit' value='DELETE SURVEY'></form>    -->
    
</body>
</html>