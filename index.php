<?php

require_once "config.php";
require_once "autoLoader.php";
require_once "controllers/globalFunctions.php";

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dracer Corp.</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- CSS BOOTSTRAP LINK -->
    <link rel="stylesheet" href="assets/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="assets\bootstrap-icons-1.11.3\font\bootstrap-icons.css">

    <!-- GLOBAL CSS -->
    <link rel="stylesheet" href="static/css/global.css">


    <!-- JS link -->
    <script src="assets/bootstrap/bootstrap.bundle.js"></script>
    <script src="static/js/global.js"></script>
    <script src="static/js/index.js" defer></script>
</head>

<body>
    <input type="hidden" id="root-url" value="<?=ROOT?>">

    <div id="notify"></div>

    <div class="loader d-none">
        <span class="spinner-grow spinner-grow-sm text-secondary" role="status"></span>
        <span class="spinner-grow spinner-grow-sm text-secondary mx-3" role="status"></span>
        <span class="spinner-grow spinner-grow-sm text-secondary" role="status"></span>
    </div>

    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="<?=ROOT?>" id="root-link">
            <img src="<?=ROOT?>/assets/images/dracer-corp-logo.png" alt="" width="50" height="34" class="d-inline-block align-text-top">
            DracerCorp
            </a>
        </div>
    </nav>
    <?php
        $url = $_GET["user"] ?? "";

        switch ($url) {
            case 'admin':
                if (!Auth::is_admin()){
                    message("please sign in as employee");
                    redirect("");
                }
                    $admin = Auth::getUserInfo();
                    $adminController = new AdminController();
                    $pension_info = $adminController->getPensionSettings();
                    if($pension_info){
                        $payment_percentage = $pension_info->payment_percentage;
                        $payment_date = $pension_info->payment_date;
                    }
                    $departments = $adminController->getAllDepartments();
                    $active_employees = $adminController->getActiveEmployeeswithPensionwithJobs();
                    $retired_employees = $adminController->getRetiredEmployeeswithPensionwithJobs();
                    $sacked_employees = $adminController->getSackedEmployeeswithPensionwithJobs();
                    $pension_employees = $adminController->getPensionEmployeeswithPensionwithJobs();
                    $employees = $adminController->getAllEmployeeswithPensionwithJobs();
                    require_once "views/admin.view.php";
                break;
            
            case 'employee':
                if (!Auth::is_employee()){
                    message("please sign in as employee");
                    redirect("");
                } 
                $employeeController = new EmployeeController(Auth::getUser_id("employee_id"));
                $employee = $employeeController->getEmployeewithPensionwithJobs();
                $job_amount = calculatePensionAmount($employee->jobs, new Jobs());
                $employee->pension_allowance = $job_amount;
                require_once "views/employee.view.php";
                break;
            
            default:
                include_once "views/home.view.php";
                break;
        }
    ?>
</body>
</html>