<?php

if ($_SERVER["REQUEST_METHOD"] !== "POST") exit;

require_once "../globalFunctions.php";
require_once "../../autoLoader.php";

$username = $_POST["username"] ?? "";
if (empty($username)) returnJson(["success"=>false, "message"=>"username cannot be empty"]);
if (hasMoreThanOneWord($username)) returnJson(["success"=>false, "message"=>"Invalid Username"]);

$adminDB = new Admin();

$response = $adminDB->where(["username"=>"@".$username]);
if(!$response["success"]) returnJson($response);
$user = $response["data"][0] ?? "";
if (!empty($user)) returnJson(["success"=>false, "message"=>"username already exists! please choose another"]);

$password = generatePassword();
$email = generateEmail($username);
$admin_data = [
    "username" => "@".$username,
    "email" => $email,
    "password" => password_hash($password, PASSWORD_DEFAULT),
    "role" => "admin"
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

 function hasMoreThanOneWord($string) {
    // Split the string by spaces
    $words = explode(" ", trim($string));
    
    // Count the words and return true if more than one
    return count($words) > 1;
}
