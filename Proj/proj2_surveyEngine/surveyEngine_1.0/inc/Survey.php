<?php

class Survey {
        private $link;
        
        function __construct() {
            require_once 'loginMysql.php';
            $this->link=$link;
        }
        function createSurvey($table, $data=array()){
            
        }
	function add( $table, $data = array() ) {
            $op	= false;
            if( !empty($data) ){
                foreach($data as $f => $v) {
                        $fields[] = $f;
                        $values[] = $v;
                }
                $insertq = "INSERT INTO `$table` (". implode( $fields ,', ') .") VALUES ('	". implode( $values ,'\', \'') ."')";
//                echo $insertq;
                $op = $this->link->query($insertq);
            }
            return $op;
    }
	
	function edit( $table, $data = array(),$id = false ) {
            $op	= false;
            if($id) {
                    if( !empty($data) ){
                            foreach($data as $field => $values) {
                                    $update[] = "`$field` = '$values'";
                            }
                            $updateq = "UPDATE `$table` SET " . implode($update, ', ');
                            if(is_numeric($id)) {
                                    $updateq .= " WHERE id = $id";
                            } else {
                                    $updateq .= " WHERE `id` = `$id`";
                            }
                            $op = $this->link->query($updateq);
                            if($op) {
                                    echo "Data Updated";
                            } else {
                                    echo "Data Update failed :(" .$updateq;
                            }
                    } else {
                            echo 'Data not set';
                    }
            } else {
                    echo 'ID not given.';
            }
            return $op;
	}
	
	function query( $q ) {
            $op	= false;
            $result = $this->link->query($q);
            if($result) {
                    while($entry = $result->fetch_assoc()) {
                            $op[] = $entry;
                    }
            }
            return $op;
	}
	
	function get_answers( $q ) {
            $op	= false;
            $result = $this->link->query($q);
            if($result) {
                    while($entry = $result->fetch_assoc()) {
                            $op[$entry['id']] = $entry['answers'];
                    }
            }
            return $op;
	}
	
	function get( $table, $id = false ) {
            $op	= false;
            $select = "SELECT * FROM $table";
            if($id) {
                    if(is_numeric($id)) {
                            $select .= " WHERE id = $id";
                    } else {
                            $select .= " WHERE `id` = `$id`";
                    }
            }
            $result = $this->link->query($select);
            if($result) {
                    while($entry = $result->fetch_assoc()) {
                            $op[] = $entry;
                    }
            }
            return $op;
	}
		
	function delete( $table, $id = false ) {
            $op	= false;
            if($id) {
                    $delete = "DELETE FROM $table WHERE `id` = $id";
                    $op = $this->link->query($delete);
                    //echo $op;
            } else {
                    echo 'ID not given.';
            }
            return $op;
	}
	
	
	function save_answers() {
            //Saving answers 
            //echo "<pre>";print_r($_POST);echo "</pre>";
            $u_id = $_SESSION['id'];
            foreach($_POST['question_id'] as $q_id => $opt_id) {
                    $values[] = " ($u_id,$q_id,$opt_id)";
            }
            $insert = "INSERT INTO `survey`.`xref_answer` (`user_id`, `question_id`, `answer`) VALUES"  .implode($values,', ');
            echo $insert;
            return $this->link->query($insert);
            
	}

	function get_all_quesions($edit = false) {
		$qts = $this->get('entity_questions');
		$html = '<ol class="questions">';
		if(!empty($qts)) {
			foreach ($qts as $q) {
				$html .= '<li>'
						.'<div class="question">'. $q['question'] .'</div>';
				$answers = json_decode($q['answers']);
				if(!empty($answers)) {
					foreach ($answers as $key => $option) {
						if(!empty($option)) {
							$html .= '<div class="answers">'
										.'<label>'
											.'<input type="radio" name="question_id['. $q['id'] .']" value="'. $key .'">'. $option
										.'</label>'
									.'</div>';
						}
					}
				}
				if($edit) {
					$html .='<div class="actions"><a href="admin.php?task=edit&id='. $q['id'] .'" class="button">Edit</a> <a href="admin.php?task=delete&id='. $q['id'] .'" class="button">Delete</a></div>';
				}
				$html .= '</li>';
			}
		}
		$html .= '</ol>';
		return $html;
	}

	function process($task = 'empty') {
		$op = false;
		switch($task) {
			case "get_all_front":
				echo '<form action="take_survey.php?task=save_answers" method="post">';
				echo $this->get_all_quesions();
				echo '<input type="hidden" name="user_id" value=$_SESSION["id"]><button>Submit</button></form>';
				break;
			case "save_answers" :
					if($this->save_answers()){
						$_SESSION['flash_message'] = "Saved successfuly";
                                                header('location:thankyou.php');                                                
					} else {
						$_SESSION['flash_message'] = "Can't save at this moment..";
                                                echo "Error";
                                                
					}
//					header('location:thankyou.php');
				break;
			case "get_all":
					echo $this->get_all_quesions(true);
				break;
//			case "logout": 
//					unset($_SESSION['username']);
//					header('location:login.php');
//				break;
			case "login":
					if(isset($_SESSION['amdin'])) {
						header('location:admin.php');
					}
//					if(isset($_POST['pwd']) && $_POST['pwd']=='hello123' ) {
//						$_SESSION['username'] = 'Admin';
//						header('location:admin.php');
//					}
				break;
			case "edit":
				$qts = $this->get('entity_questions',$_GET['id']);
				foreach ($qts as $question) {
					$question['answers'] = json_decode($question['answers']);
					include "inc/form.php";
				}
			
				break;
			case "add_new":
				$question = false;
				include "inc/form.php";
				break;
			case "save":
					$data = $_POST;
					$data['answers'] = json_encode($data['answers']);
					//echo '<pre>'; print_r($data); echo '</pre>';
					if(isset($data['id']) && $data['id']=='new'){
						unset($data['id']);
						$this->add('entity_questions', $data);
					} else {
						$this->edit('entity_questions', $data, $data['id']);
					}
					header('location:admin.php');
			break;
			
			case 'delete' :
					echo $task;
					$this->delete('entity_questions',$_GET['id']);
					header('location:admin.php');
				break;
			default:
				echo "Undefined Action";
		}

		return $op;
	}
}
