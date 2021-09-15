<!doctype html>
<html lang="en">

<head>
    <title>Instructors</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <?php
    include('php-functions/db_connection.php');
    include('php-functions/php_query_functions.php')
    ?>
    <?php
    session_start();
    include('php-layout-files/navbar.php')
    ?>

    <?php
    $msg = array(
        'msg' => false
    );


    ?>
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-10 mx-auto p-3">

                <h3 class="text-center my-5">Select Your Desire Trainer For Start Your Workout Plan</h3>




                <?php
               
                $uid=$_SESSION['user_id'];
               
                $condition=array(
                    'user_id'=> $uid
                );
                $nrows=num_of_rows($con,'membershiptype',$condition,'');
                ?>
                <?php if($nrows>0)
                {

               ?>
               
                
                <table class="table mt-3  table-bordered">
                    <thead>
                        <tr>
                            <th>Instructors Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        
                        $result = PullData($con, 'instructors', '*', "", "");

                        while ($row = mysqli_fetch_array($result)) {
                        ?>
                            <tr>
                                <td scope="row"><?php echo $row['name'] ?></td>
                                <td><?php echo $row['email'] ?> Month</td>
                                <td><?php echo $row['contact'] ?> </td>
                                <td><a class="btn btn-success text-white" onclick="enroll('<?php echo $row['instructor_id'] ?>')" role="button"> Enroll</a></td>
                            </tr>
                        <?php
                        }
                        ?>


                    </tbody>
                </table>
                <?php
                }
                else{
                    ?>
                    <p class="lead text-center">Your are not a member of this gym.Please buy a membership package then you are able to select a trainer</p>
                    <?php
                }
                ?>
            </div>

        </div>
    </div>



    <!-- Button trigger modal -->


    <!-- Button trigger modal -->
    <!-- Modal -->
    <div class="modal fade" id="model" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirmation Message</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="lead">
                        You successfully Enroll for this Trainer
                    </p>
                </div>
                <div class="modal-footer">

                    <button type="button" data-dismiss="modal" class="btn btn-primary">Done</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script>
        function enroll(id) {

            $.ajax({
                type: "post",
                url: "php-functions/curd-data-man.php",
                data: {
                    action: 'enroll',
                    id: id
                },

                success: function(response) {
                    $('.modal').modal('show');
                }
            });
        }
    </script>
</body>

</html>