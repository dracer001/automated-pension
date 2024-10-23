<?php
require_once "../globalFunctions.php";
require_once "../../autoLoader.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $employeeDB = new Employee();
    // ALLOW SQL TO INPUT DEFAULT VALUE FOR EMPTY DATE
    $secret_key=$_POST["secret_key"];
    $employee_id=$_POST["employee_id"];
    if($secret_key == SECRET_KEY){
        $response = $employeeDB->delete("employee_id", $employee_id);
        returnJson($response);
    }
    returnJson(["success"=>false, "message"=>"invalid secret key"]);
}