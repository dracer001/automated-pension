<?php

if ($_SERVER["REQUEST_METHOD"] !== "POST") exit;

require_once "./globalFunctions.php";
require_once "../autoLoader.php";

$secret_key = $_POST["secret_key"] ?? '';
if (empty($secret_key)) {
        returnJson([
        "success"=>false,
        "message"=>"secret key not found"
        ]);
}
if ($secret_key !== SECRET_KEY){
    returnJson([
        "success"=>false,
        "message"=>"invalid secret key"
    ]);
}

$_DATABASE = new Database();
$response = $_DATABASE->createDatabase();
if(!$response["success"]) returnJson($response);
$adminDB = new Admin();
$password = generatePassword();
$admin_data = [
    "username" => "@super_admin",
    "email" => "super_admin@dracercorp.org",
    "password" => password_hash($password, PASSWORD_DEFAULT),
    "role" => "super_admin"
];
$response = $adminDB->insert($admin_data);

if (!$response["success"]) {
    returnJson($response) ;
 }else{
    $admin_data["password"] = $password;
    returnJson([
        "success" => true,
        "data" => $admin_data
    ]);
 }

