<?php 
require_once './Database.php';
$link = Database::getInstance();

$status = $link->real_escape_string(filter_var($_POST['status'], FILTER_SANITIZE_FULL_SPECIAL_CHARS));
$id = $_POST['id'];
//print_r($id);die();
//print_r($status);die();
try{
$sql = "UPDATE ticket set status = '$status' WHERE id = '$id'";

 if (!$link->query($sql)) {
    throw new Exception();
}

echo (json_encode([
    'msg' => 'Ticket status changed',
    'status' => 200,
]));


} catch(Exception $e) {
    echo (json_encode([
        'msg' => 'Ticket status updation failed',
        'status' => 500,
    ]));
}

?>