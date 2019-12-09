<?php
require_once "query_players.php";
session_start();


$result= get_user_info_logged_in();

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
    //echo $row['user_id'];
    $status = '';
    $output .= '
     <tr>
     <td >'.$cnt.'</td>
     <td >'.$row['user_name'].'</td>';
     
     $user_status = $row['status'];
     
     if($user_status==1){
        $output .= '<td><span class="label label-success">Ready</span></td>';
        
        if(isset($_SESSION['user_id']) && $_SESSION['user_id']==$row['user_id']){
            $output .= '  
                <td ><button type="button" class="btn btn-info btn-xs start_play" 
                data-userid="'.$row['user_id'].'" data-user_name="'.$row['user_name'].'">
                    Start to play</button></td>';
        }
        else if(isset($_SESSION['user_id']) && $_SESSION['user_id']!=$row['user_id']){
             $output .='<td></td>';
        }
     }   
     else if($user_status==2){
        $output .= '<td><span class="label label-danger">Waiting</span></td>';
        
        if(isset($_SESSION['user_id']) && $_SESSION['user_id']==$row['user_id']){
         $output .= '  
                <td ><button type="button" class="btn btn-info btn-xs stop_play" 
                data-userid="'.$row['user_id'].'" data-user_name="'.$row['user_name'].'">
                    Stop Playing</button></td>';
        }
        else if(isset($_SESSION['user_id']) && $_SESSION['user_id']!=$row['user_id']){
           $output .='<td></td>';
        }
     }
     else if($user_status==3){
        $output .= '<td><span class="label label-danger">Playing</span></td>';
        if(isset($_SESSION['user_id']) && $_SESSION['user_id']==$row['user_id']){
         $output .= '  
                <td ><button type="button" class="btn btn-info btn-xs stop_play" 
                data-userid="'.$row['user_id'].'" data-user_name="'.$row['user_name'].'">
                    Stop Playing</button></td>';
        }
        else if(isset($_SESSION['user_id']) && $_SESSION['user_id']!=$row['user_id']){
           $output .='<td></td>';
        }
     }      
     $output .='</tr>';
     $cnt++;  
    }

    $output .= '</table>';

    echo $output;

?>
