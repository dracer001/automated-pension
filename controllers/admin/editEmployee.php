<?php
require_once "../globalFunctions.php";
require_once "../../autoLoader.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $employeeDB = new Employee();
    $jobDB = new Jobs();
    $pensioneerDB = new Pensioneer();
    // ALLOW SQL TO INPUT DEFAULT VALUE FOR EMPTY DATE
    $action = [];
    $_POST["email"] = (empty($_POST["email"])) ? generateEmail($_POST["firstname"].$_POST["lastname"]) : $_POST["email"];
    $response = $employeeDB->where(["employee_id"=>$_POST["employee_id"]]);
    if (!$response["success"]) returnJson($response);
    $employee = $response["data"][0] ?? "";
    if(empty($employee)) returnJson(["success"=>false, "message"=>"employee id not found"]);
    $jobs = json_decode($_POST["jobs"], true);
    unset($_POST["jobs"]);
    $employee = (array)$employee;
    // Shortened date comparison logic
    $input_array = array_filter(array_diff_assoc($array2, $array1), fn($v, $k) =>
        !empty($v) && (substr($k, -4) !== 'date' || date('Y-m-d', $array1[$k]) !== $v),
        ARRAY_FILTER_USE_BOTH
    );
    print_r($input_array);
    if(count($input_array)>0) {
        print_r($input_array);
        $response = $employeeDB->update("employee_id", $employee["employee_id"], $input_array);
        print_r($response);
        array_push($action, "updated data for  ".json_encode($input_array));
    }
    
    foreach ($jobs as $job) {
        if(isset($job["job_id"])){
            $existing_job = $jobDB->where(["job_id"=>$job["job_id"]]);
            if($existing_job["success"] && isset($existing_job["data"][0])){
                $existing_job = (array)$existing_job["data"][0];
                $input_array = array_filter(array_diff_assoc($job, $existing_job), fn($value)=>!empty($value));
                if(count($input_array)>0) {
                    $jobDB->update("job_id", $existing_job["job_id"], $input_array);
                    array_push($action, "updated job for id ".$job["job_id"]);

                }  
            }
        }else{
            if(isset($job["department_id"]) and !empty($job["job_title"]) and !empty($job["department_id"])){
                if(empty($job["start_date"])) unset($job["start_date"]);
                if(empty($job["end_date"])) unset($job["end_date"]);
                $job["employee_id"] = $employee["employee_id"];
                $jobDB->insert($job);
                array_push($action, "1 job inserted");
            }
        }
    }
    returnJson(["success"=>true, "actions"=>$action]);
}