<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style>
    #que {
        min-height: 340px;
    }
    </style>
    <title>Forum</title>
</head>

<body>
    <?php include 'include/header.php';?>
    <?php include 'include/dbconnect.php';?>
    <?php
        $id=$_GET['threadid'];
        $method = $_SERVER['REQUEST_METHOD'];
        if($method=='POST'){
            $comment = $_POST['desc'];
            $comment = str_replace("<","&lt;",$comment);
            $comment = str_replace(">","&gt;",$comment);
            $sno = $_POST['sno'];
            $sql="INSERT INTO `comments` (`comment_content`, `thread_id`, `comment_by`, `comment_time`) VALUES ('$comment', '$id', '$sno', current_timestamp());";
            $result=mysqli_query($conn,$sql);
            $th_add=true;
            if($th_add){
                echo '
                <div class="alert alert-success" role="alert">
                <p>Success! Comment added to successfully!</p>
              </div>
                ';
            }
        }
    ?>
    <?php  
            
            $sql = "SELECT * FROM `threads` WHERE thread_id=$id";
            $result = mysqli_query($conn,$sql);
            while($row = mysqli_fetch_assoc($result)){
                $title = $row['thread_title'];
                $desc = $row['thread_desc'];
            }
    ?>

    <?php  
            $th_user_id= $_GET['posted_by'];
            $sql = "SELECT email FROM `users` WHERE sno='$th_user_id'";
            $result = mysqli_query($conn,$sql);
            $row = mysqli_fetch_assoc($result);
            
    echo '<div class="container my-4">
        <div class="jumbotron">
            <h1 class="display-4">'.$title .'</h1>
    <p class="lead">'. $desc .'</p>
    <hr class="my-4">
    <p><b>Posted by : '.$row['email'].'</b></p>
    </div>

    </div>';

    ?>
    <?php

        if(isset($_SESSION['login']) && $_SESSION['login']==true){
            echo '<div class="container">
                <h2>Post a comment</h2>
                <form action="'.$_SERVER['REQUEST_URI'].'" method="post">
            <div class="form-group">
                <label for="desc">Type your comment</label>
                <textarea class="form-control" id="desc" name="desc" rows="3"></textarea>
                <input type="hidden" name="sno" value="'.$_SESSION["sno"].'">
            </div>
            <button type="submit" class="btn btn-success">Post comment</button>
            </form>
            </div>';
        }
        else{
            echo '<div class="container">
                    <h2>Post a comment</h2>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Login to post a comment!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                  </div>';
        }
    ?>
    <div class="container mb-4" id="que">
        <h2>Discussion</h2>
        <?php  
            $id=$_GET['threadid'];
            $sql = "SELECT * FROM `comments` WHERE thread_id=$id";
            $result = mysqli_query($conn,$sql);
            while($row = mysqli_fetch_assoc($result)){
                $desc = $row['comment_content'];
                $time = $row['comment_time'];
                $thread_user_id=$row['comment_by'];
                $sql1= "SELECT email FROM `users` WHERE sno=$thread_user_id";
                $result1 = mysqli_query($conn,$sql1);
                $row1 = mysqli_fetch_assoc($result1);

                echo 
                '<div class="media my-3">
                    <img src="img/avtar.png" width="70px" class="mr-3" alt="...">
                    <div class="media-body">
                    <p class="font-weight-bold my-0">'.$row1["email"].'</p>
                        '.$desc.'
                    </div>
                    '.$time.'
                </div>
                 ';
            }
        ?>
    </div>






    <?php include 'include/footer.php';?>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
    </script>

</body>

</html>