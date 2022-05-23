<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}
include_once("dbconnect.php");
$name = addslashes($_POST['name']);
$email = addslashes($_POST['email']);
$phoneno = $_POST['phoneno'];
$homeaddress = $_POST['homeaddress'];
$base64image = $_POST['image'];

$sqlinsert = "INSERT INTO `registration`(`myt_name`, `myt_email`, `myt_phoneno`, `myt_homeaddress`) VALUES ('$name','$email','$phoneno',$homeaddress')";
if ($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success', 'data' => null);
    $filename = mysqli_insert_id($conn);
    $decoded_string = base64_decode($base64image);
    $path = '/images/profiles' . $filename . '.jpg';
    $is_written = file_put_contents($path, $decoded_string);
    sendJsonResponse($response);
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>