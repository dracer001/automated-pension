<?php 
require_once "./globalFunctions.php";
require_once "../autoLoader.php";

//__________________________________
if ($_SERVER['REQUEST_METHOD'] == "POST"){
    $user = $_POST["user"] ?? "";
    if ($user == "employee") {
        $userDB = new Employee();
        $query_field = "email";
    } else if ($user == "admin"){
        $userDB = new Admin();
        $query_field = "username";
    }else{
        returnJson(["success" => false, "message" => "Cannot resolve user"]);
    }
    

    $user_info =$userDB->where([$query_field=>trim($_POST[$query_field])]);
    if ($user_info["success"]) {
        $user_info = $user_info["data"][0] ?? '';
        if (empty($user_info)) {
            returnJson(["success" => false, "message" => "Invalid email"]);
        }else if (password_verify($_POST["password"], $user_info->password) || $_POST["password"] === $user_info->password) {
            $user_info->user = $user;
            Auth::authenticate($user_info); 
            returnJson(["success" => true, "message" => "Login Successful"]);
        } else {
            returnJson(["success" => false, "message" => "Invalid password", "password_post"=>$_POST["password"], "password_server" => $user_info->password]);
        }
    } else {
        returnJson($user_info);
    }
    exit;
}