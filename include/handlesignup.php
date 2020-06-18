<?php
   $showError = "false";
   if($_SERVER['REQUEST_METHOD']=='POST'){
        include 'dbconnect.php';
        $email = $_POST['email'];
        $password = $_POST['password'];
        $confirmpassword=$_POST['confirmpassword'];
        
        //check email existance.
        $existSql = "SELECT * FROM `users` WHERE email='$email'";
        $result = mysqli_query($conn,$existSql);
        $numRows = mysqli_num_rows($result);
        if($numRows>0){
            $showError = "Email already exist!";
        }
        else{
            if($password == $confirmpassword){
                $hash =  password_hash($password,PASSWORD_DEFAULT);
                $sql = "INSERT INTO `users` (`email`, `password`, `timestamp`) VALUES ('$email', '$hash', current_timestamp())";
                $result = mysqli_query($conn,$sql);
                if($result){
                    $showAlert = true;
                    header("Location: ../index.php?signupsuccess=true");
                    exit();
                }
            }
            else{
                $showError = "Password did not match!";
                
            }
        }
        header("Location: ../index.php?signupsuccess=false&error=$showError");
    }
?>