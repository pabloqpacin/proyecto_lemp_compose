<?php
ini_set('display_errors', 1);
require_once './Database.php';
require_once './team-member.php';

$members = TeamMember::findByTeam($_POST['id']);

$data = [];

foreach($members as $member){
    $obj = new stdClass;
    $obj->id = $member->id;
    $obj->name = $member::getName($member->user);

    $data[] = $obj;
    
}
//print_r($data);die();
echo json_encode($data);