<?php
require_once "../globalFunctions.php";
require_once "../../autoLoader.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    # code...
    if(!Auth::is_admin()){
        returnJson(["success"=>false, "message"=>"unauthorized access"]);
    }
    
    $pensionSettingsDB = new PensionSettings();
    $response = $pensionSettingsDB->update("id", 1, $_POST);
    returnJson($response);
}