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
            $id=$_GET['catid'];
            $sql = "SELECT * FROM `categories` WHERE category_id=$id";
            $result = mysqli_query($conn,$sql);
            while($row = mysqli_fetch_assoc($result)){
                $id = $row['category_id'];
                $cat = $row['category_name'];
                $info = $row['category_description'];
            }
    ?>

    <?php
        $method = $_SERVER['REQUEST_METHOD'];
        if($method=='POST'){
            $th_title = $_POST['title'];
            $th_desc = $_POST['desc'];
            
            $th_title =  str_replace("<","&lt;",$th_title);
            $th_title =  str_replace(">","&gt;",$th_title);

            $th_desc =  str_replace("<","&lt;",$th_desc);
            $th_desc =  str_replace(">","&gt;",$th_desc);

            $sno = $_POST['sno'];
            $sql="INSERT INTO `threads` ( `thread_title`, `thread_desc`, `thread_cat_id`, `thread_user_id`, `timestamp`) VALUES ('$th_title', '$th_desc', '$id', '$sno', current_timestamp())";
            $result=mysqli_query($conn,$sql);
            $th_add=true;
            if($th_add){
                echo '
                <div class="alert alert-success" role="alert">
                <p>Success! Thread added to database, wait for community response.</p>
              </div>
                ';
            }
        }
    ?>
    
    <div class="container my-4">
        <div class="jumbotron">
            <h1 class="display-4">Welcome to <?php echo $cat ?> Forum!</h1>
            <p class="lead"><?php echo $info; ?></p>
            <hr class="my-4">
            <p>This is peer to peer forum for sharing knowledge with each other</p>
            <a class="btn btn-success btn-lg" href="#" role="button">Learn more</a>
        </div>

    </div>
    <?php
     if(isset($_SESSION['login']) && $_SESSION['login']){
        echo '<div class="container">
                <h2>Start a discussion</h2>
                <form action="'.$_SERVER['REQUEST_URI'].'" method="post">
            <div class="form-group">
                <label for="title">Problem title</label>
                <input type="text" class="form-control" id="title" name="title">
                <small id="emailHelp" class="form-text text-muted">Keep problem title as short as possible.</small>
            </div>
            <input type="hidden" name="sno" value="'.$_SESSION["sno"].'">
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Problem description</label>
                <textarea class="form-control" id="desc" name="desc" rows="3"></textarea>
            </div>
            <button type="submit" class="btn btn-success">Submit</button>
            </form>
            </div>';
    }
    else{
        echo '<div class="container">
        <h2>Start a discussion</h2>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
  Login to start a discussion!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
    </div>';

    }
    ?>
    <div class="container mb-4" id="que">
        <h2>Browse Questions</h2>
        <?php  
            $id=$_GET['catid'];
            $sql = "SELECT * FROM `threads` WHERE thread_cat_id=$id";
            $result = mysqli_query($conn,$sql);
            $empty=true;
            while($row = mysqli_fetch_assoc($result)){
                $id = $row['thread_id'];
                $thread_user_id= $row['thread_user_id'];
                $title = $row['thread_title'];
                $desc = $row['thread_desc'];
                $time= $row['timestamp'];
                $empty=false;
                $thread_user_id=$row['thread_user_id'];
                $sql1= "SELECT email FROM `users` WHERE sno=$thread_user_id";
                $result1 = mysqli_query($conn,$sql1);
                $row1 = mysqli_fetch_assoc($result1);
                
                echo '
                <div class="media my-3">
                    <img src="img/avtar.png" width="70px" class="mr-3" alt="...">
                    <div class="media-body ">
                    <p class="font-weight-bold my-0">'.$row1["email"].'</p>
                        <h5 class="mt-0 my-0"><a class="text-dark" href="thread.php?threadid='.$id.'&posted_by='.$thread_user_id.'">'.$title.'</a></h5>
                        '.$desc.'
                    </div>
                    '.$time.'
                </div>';
            
              
            }
            if($empty){
                echo '<div class="alert alert-success" role="alert">
                Be the first person to ask a question!
              </div>';
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