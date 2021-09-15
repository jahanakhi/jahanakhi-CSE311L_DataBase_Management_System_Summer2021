<?php
include('db_connection.php');
include('php_query_functions.php');
session_start();

if (isset($_POST['action']) && $_POST['action'] == 'fetch-pk-data') {
    $response = array(
        'pk_name' => 'Basic'
    );
    $condition = array(
        'pk_id' => $_POST['id']
    );
    $result = PullData($con, 'packages', 'pk_name', $condition, '');
    $row = mysqli_fetch_array($result);
    $response['pk_name'] = $row['pk_name'];

    echo json_encode($response);
}
if (isset($_POST['action']) && $_POST['action'] == 'enroll') {
    $id = $_POST['id'];
    $columns = array('plan_id', 'member_id', 'instructor_id', 'plan_name', 'workout_time', 'workout_end_time');
    // $uid = $_SESSION['user_id'];
    $uid='1';
    $condition = array(
        'user_id' =>$uid
    );
    $result = PullData($con, 'membershiptype', '*', $condition, '');
    $result=mysqli_fetch_array($result);
    $memid=$result['membership_id'];
    $typename=$result['type_name'];
    $values=array(null,$memid,$id,$typename,'2','8');
    PushData($con,'workoutplans',$columns,$values);
    

}
if (isset($_POST['action']) && $_POST['action'] == 'buy-product') {
    $id = $_POST['id'];
    echo "HELLO";
    unset($_SESSION["cart"]);

}