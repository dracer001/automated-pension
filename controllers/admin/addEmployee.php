<?php
require_once "../globalFunctions.php";
require_once "../../autoLoader.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $employeeDB = new Employee();
    $jobDB = new Jobs();
    $pensioneerDB = new Pensioneer();
    // ALLOW SQL TO INPUT DEFAULT VALUE FOR EMPTY DATE
    foreach ($_POST as $key => $value) {
        if (substr($key, -strlen("date")) === "date" && empty($value)) unset($_POST[$key]);
    }


    $_POST["email"] = (empty($_POST["email"])) ? generateEmail($_POST["firstname"].$_POST["lastname"]) : $_POST["email"];
    $response = $employeeDB->where(["email"=>$_POST["email"]]);
    if (!$response["success"]) returnJson($response);
    $user = $response["data"][0] ?? "";
    if(!empty($user)) returnJson(["success"=>false, "message"=>"email already exists"]);
    $_POST["password"] = generatePassword();
    // ASSUMING THE DATA IS CLEAN
    $response = $employeeDB->insert($_POST);
    if(!$response["success"]) returnJson($response);
    $employee_id = $employeeDB->query("SELECT employee_id FROM `employee` WHERE `email` = '".$_POST["email"]."';");
    if(!$employee_id["success"]) returnJson($employee_id);
    if(!$employee_id["data"]) returnJson(["success"=>false, "message"=>"couldnt find employee id"]);
    $employee_id =  $employee_id["data"][0]->employee_id;
    $_POST["employee_id"] =$employee_id;
    $_POST["salary"] = generateSalary();
    $_POST["pension_percentage"] = generatePercentage();
    $response = $jobDB->insert($_POST);
    $response = $pensioneerDB->insert(["employee_id"=>$employee_id]);
    returnJson($response);
}