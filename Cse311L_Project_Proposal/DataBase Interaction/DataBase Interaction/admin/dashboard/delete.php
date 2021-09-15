<?php
include('../../php-functions/php_query_functions.php');
include('db_connection.php');
  if (isset($_REQUEST['id'])) {
      userDelete($con);
    }


  if (isset($_REQUEST['pakid'])) {
      packageDelete();
    }

   if (isset($_REQUEST['product_id'])) {
       productDelete($con);
   }

   if (isset($_REQUEST['trinid'])) {
       trinarDelete($con);
   }

  function userDelete($con){
       $user_id = $_REQUEST['id'];
   $condition=array('user_id'=>$user_id);
       delete_cell($con,'users',$condition,'');
             
         
         header('location: user-list.php');   
  }

  function packageDelete(){
        $package_id = $_REQUEST['pakid'];
        date_default_timezone_set("Asia/Kolkata");
        $package_udate =              date("m/d/yy");    
        $package_status = "0";
        require_once 'db.php';
        $sql = "UPDATE package SET package_status= '$package_status' , package_udate= '$package_udate' WHERE package_id = '$package_id' ";
         $retval = mysqli_query($conn, $sql);
             
         if(! $retval ) {
            die('Could not get data: ' . mysql_error());
         }   

         header('location: package-list.php');   
    }

    function productDelete($con){
       $product_id = $_REQUEST['product_id'];
       $condition=array('product_id'=>$product_id);
       delete_cell($con,'products',$condition,'');
       

         header('location: product-list.php');   
    }


    function trinarDelete($con){
        $trainer_id = $_REQUEST['trinid'];
        $condition=array(
          'instructor_id'=>$trainer_id
        );
        delete_cell($con,'instructors',$condition,'');
         header('location: trainer-list.php');   
    }
?>