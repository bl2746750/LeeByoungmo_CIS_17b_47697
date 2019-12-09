<?php

require_once 'loginMysql.php';
session_start();

$query="SELECT * FROM entity_users WHERE logged_in=1";
$statement=$link->prepare($query);
$statement->execute();
$result=$statement->fetchAll();
//print_r($result);
$output='
        <table class="table table-bordered table-striped">
         <tr>
          <th width="10%">No.</td>
          <th width="30%">Username</td>
          <th width="30%">Status</td>
          <th width="30%">Action</td>
         </tr>
';

$cnt=1;
foreach($result as $row){
    $status = '';
     $user_status = fetch_user_status($row['user_id'], $link);
     if($user_status['status']==1)
     {
      $status = '<span class="label label-success">Ready</span>';
     }
     elseif($user_status['status']==0)
     {
      $status = '<span class="label label-danger">Waiting</span>';
     }
     elseif($user_status['status']==2)
     {
      $status = '<span class="label label-danger">Playing</span>';
     }
     $output .= '
     <tr>
     <td >'.$cnt.'</td>
     <td >'.$row['email'].'</td>
     <td >'.$status.'</td>';
     if($_SESSION['user_id']==$row['user_id']&& $row["status"]==0){
         $output .= '  
                <td ><button type="button" class="btn btn-info btn-xs start_play" 
                data-userid="'.$row['user_id'].'" data-email="'.$row['email'].'">
                    Start to play</button></td>';
     }
     else if($_SESSION['user_id']==$row['user_id']&& $row["status"]>0){
         $output .= '  
                <td ><button type="button" class="btn btn-info btn-xs start_play" 
                data-userid="'.$row['user_id'].'" data-email="'.$row['email'].'">
                    Stop Playing</button></td>';
     }
     else if($_SESSION['user_id']!=$row['user_id']){
         $output .='<td></td>';
     }
     $output .='</tr>';
    $cnt++;  
    }

    $output .= '</table>';

    echo $output;

?>
