<?php
   $showError = "false";
   if($_SERVER['REQUEST_METHOD']=='POST'){
    include 'dbconnect.php';
    $loginemail = $_POST['loginemail'];
    $password = $_POST['loginpassword'];
    $sql = "SELECT * FROM `users` WHERE email='$loginemail'";
    $result=mysqli_query($conn,$sql);
    $numRows = mysqli_num_rows($result);
        if($numRows == 1){
            $row = mysqli_fetch_assoc($result);
            if(password_verify($password,$row['password'])){
                session_start();
                $_SESSION['login']=true;
                $_SESSION['sno']=$row['sno'];
                $_SESSION['useremail']=$loginemail;
                
            }
           
          header("Location: ../index.php");
            
   }
   header("Location: ../index.php");
   }
?>