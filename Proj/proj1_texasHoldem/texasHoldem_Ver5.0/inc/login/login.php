<?php
require_once '../db/loginMysql_1.php';
require 'clear_string.php';


// Initialize the session
session_start();

// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"])){
    header("location: ../../index.php");
}
 
// Define variables and initialize with empty values
$user_name = $password = "";
$user_name_err = $password_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $user_name= mysql_entities_fix_string($link,$_POST['user_name']);
    $password=mysql_entities_fix_string($link,$_POST['password']);
    // Check if username is empty
    if(empty($user_name)){
        $user_name_err = "Please enter your user_name.";
    }
    // Check if password is empty
    if(empty($password)){
        $password_err = "Please enter your password.";
    } 
    
    // Validate credentials
    if(empty($user_name_err) && empty($password_err)){
        // Prepare a select statement
        $sql = "SELECT user_id, user_name, password, balance FROM entity_users WHERE user_name = ?";
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $user_name);
            
            // Set parameters
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Store result
                mysqli_stmt_store_result($stmt);
                
                // Check if username exists, if yes then verify password
                if(mysqli_stmt_num_rows($stmt) == 1){                    
                    // Bind result variables
                    mysqli_stmt_bind_result($stmt, $user_id, $user_name, $hashed_password,$balance);
                    if(mysqli_stmt_fetch($stmt)){
                        if(password_verify($password, $hashed_password)){
                            // Password is correct, so start a new session
                            //session_start();
                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
                            $_SESSION["user_id"] = $user_id;
                            $_SESSION["user_name"] = $user_name;  
                            $_SESSION["balance"] = $balance;
                            //echo $user_id.'test';
                            $query="UPDATE entity_users SET status=1 WHERE user_id=$user_id";
                            $result=$link->query($query);
                            if(!$result) die("Database access failed1");
                            //echo $_SESSION["admin"];
                            // Redirect user to welcome page
                            header("location: ../../index.php");
                            
                        } else{
                            // Display an error message if password is not valid
                            $password_err = "The password you entered was not valid.";
                        }
                    }
                } else{
                    // Display an error message if username doesn't exist
                    $user_name_err = "No account found with that user_name.";
                }
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }
        }
        
        // Close statement
        mysqli_stmt_close($stmt);
    }
    
    // Close connection
    mysqli_close($link);
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Texas Holdem</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Login</h2>
        <p>Please fill in your credentials to login.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group <?php echo (!empty($user_name_err)) ? 'has-error' : ''; ?>">
                <label>User Name</label>
                <input type="text" name="user_name" class="form-control" value="<?php echo $user_name; ?>">
                <span class="help-block"><?php echo $user_name_err; ?></span>
            </div>    
            <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label>Password</label>
                <input type="password" name="password" class="form-control">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Login">
            </div>
            <p>Don't have an account? <a href="./register.php">Sign up now</a>.</p>
        </form>
    </div>    
</body>
</html>
