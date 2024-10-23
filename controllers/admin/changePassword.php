<?php

if ($_SERVER["REQUEST_METHOD"] !== "POST") exit;

require_once "../globalFunctions.php";
require_once "../../autoLoader.php";

$adminDB = new Admin();
if (!Auth::is_admin()) returnJson(["success"=>false, "message"=>"unauthorized access"]);
$admin = Auth::getUserInfo();
if (!password_verify($_POST["old_password"], $admin->password)) {
    returnJson(["success"=>false, "message"=>"incorrect password"]); 
}
$password = password_hash($_POST["new_password"], PASSWORD_DEFAULT);
$response = $adminDB->update("admin_id", $admin->admin_id, ["password"=>$password]);
returnJson($response);
 function hasMoreThanOneWord($string) {
    // Split the string by spaces
    $words = explode(" ", trim($string));
    
    // Count the words and return true if more than one
    return count($words) > 1;
}
