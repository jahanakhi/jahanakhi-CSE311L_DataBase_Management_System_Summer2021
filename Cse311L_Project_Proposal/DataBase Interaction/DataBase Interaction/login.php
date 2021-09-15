<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <title>Log in</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>

    </style>
</head>

<body>




<?php
 session_start();
  include('php-layout-files/navbar.php')
  ?>


    <?php
    $error = array(
        'error' => False,
        'msg' => ''
    );
    include('php-functions/db_connection.php');
    include('php-functions/php_query_functions.php');
    if (isset($_POST['submit'])) {

        $password = $_POST['password'];
        $email = $_POST['email'];
        $columns = array('user_id', 'fname');
        $condition = array(
            'username' => $email,
            'password' => $password
        );
        $result = PullData($con, 'users', $columns, $condition, 'and');
        $nrows = mysqli_num_rows($result);
     
        if ($nrows < 1) {
            $error['error'] = True;
            $error['msg'] = "Invalid Password Or Username";
        } else {
            $row = mysqli_fetch_array($result);
            $_SESSION['user_id'] = $row['user_id'];
            $_SESSION['name'] = $row['fname'];
            $_SESSION['mail'] = $email;
            echo $con->error;
            // echo 'hiii';
            header('location:index.php');
        }
    }

    ?>


    <div class="signup-form">
        <?php
        if ($error['error']) {
        ?>
            <div class="alert alert-danger" role="alert">
                <strong><?php echo $error['msg']  ?></strong>
            </div>
        <?php
        }
        ?>

        <form action="login.php" method="post">
            <h2>Log In</h2>

            <hr>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <span class="fa fa-user"></span>
                        </span>
                    </div>
                    <input type="text" class="form-control" name="email" placeholder="Username/Email" required="required">
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fa fa-lock"></i>
                        </span>
                    </div>
                    <input type="text" class="form-control" name="password" placeholder="Password" required="required">
                </div>
            </div>


            <div class="form-group">
                <button type="submit" name="submit" class="btn btn-primary btn-lg">Login</button>
            </div>
            <div class="text-center text-primary">Dont have an account? <a href="#">Signup here</a></div>
        </form>

    </div>
</body>

</html>