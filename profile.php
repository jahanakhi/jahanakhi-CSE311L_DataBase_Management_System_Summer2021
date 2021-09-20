<!doctype html>
<html lang="en">

<head>
    <title>Profile</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>



    </style>
</head>

<body>

    <?php
    session_start();
    include('php-layout-files/navbar.php')
    ?>



    <?php
    include('php-functions/db_connection.php');
    include('php-functions/php_query_functions.php');
    $uid = $_SESSION['user_id'];
    $condition = array(
        'user_id' => $uid
    );
    $result = PullData($con, 'users', '*', $condition, 'and');

    $row = mysqli_fetch_array($result);
    ?>

    <section class="about-us">
        <div class="container mt-5">
            <div class="row mt-5">
                <div class="col-md-10 mx-auto p-3">
                    <div class="card shadow">
                        <div class="card-body">
                            <h3 class="mb-4">My Profile</h3>
                            <p class="card-text">First Name: <?php echo $row['fname'] ?></p>
                            <p class="card-text">Last Name: <?php echo $row['lame'] ?></p>
                            <p class="card-text">Age: <?php echo $row['age'] ?></p>
                            <p class="card-text">Username: <?php echo $row['username'] ?></p>
                            <p class="card-text">Phone: <?php echo $row['phone_num'] ?></p>
                            <p class="card-text">Address: <?php echo $row['address'] ?></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <?php include("php-layout-files/footer.php") ?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>