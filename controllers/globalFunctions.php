
<?php

function returnJson($response)
{
	header('Content-Type: application/json');
	echo json_encode($response);
    exit;
}

function generatePassword($length = 6) {
    // Generate a random string
    $bytes = random_bytes($length);
    // Convert it to hexadecimal and then get the first $length characters
    return substr(bin2hex($bytes), 0, $length);
}

function generateEmail($name) {
    // Generate a random string
    $number = random_int(1, 10000);
    return strtolower($name).(string)$number."@dracercorp.org";
}

function generateSalary() {
    $min = 20000.0;
    $max = 100000.0;
    $randomFloat = $min + mt_rand() / mt_getrandmax() * ($max - $min);
    return round($randomFloat, 2);
}
function generatePercentage() {
    $min = 0.5;
    $max = 12.0;
    $randomFloat = $min + mt_rand() / mt_getrandmax() * ($max - $min);
    return round($randomFloat, 2);
}

function extractDate($timestamp){
    $date = new DateTime($timestamp);
    $formattedDate = $date->format('Y-m-d');
    return $formattedDate;
}

function getMonthsDifference($date1, $date2 = null) {
    // Parse the dates into DateTime objects
    $d1 = new DateTime($date1);
    
    // If $date2 is null or not valid, use the current date
    $d2 = isset($date2) ? new DateTime($date2) : new DateTime();

    // Calculate the difference
    $yearDiff = $d2->format('Y') - $d1->format('Y');
    $monthDiff = $d2->format('m') - $d1->format('m');
    
    // Total months difference
    return $yearDiff * 12 + $monthDiff;
}

function calculatePensionAmount($jobs, $jobDB){
    $job_amount = 0;
    $response = $jobDB->query("SELECT `payment_percentage` FROM `pension_settings` WHERE `id` = 1;");
    $payment_percentage = $response["data"][0]->payment_percentage;
    $job_amount = 0;
    foreach ($jobs as $job) {
        $percentageAmount = $job->pension_percentage*$job->salary/100;
        $working_months = getMonthsDifference($job->start_date, $job->end_date);
        $job_amount += $working_months*$percentageAmount/100;
    }
    $job_amount = round($job_amount*$payment_percentage/100, 2);
    return $job_amount;
}


function hasDateKey($data) {
    foreach ($data as $key => $value) {
        if (substr($key, -4) === 'date') {
            return true;
        }
    }
    return false;
}

function formartDate(&$input_array){
    $is_date = false;
    foreach ($input_array as $key => $value) {
        if (substr($key, -4) === 'date') {
            $input_array[$key] = (new DateTime($value))->format('Y-m-d H:i:s') ;
            $is_date = true;
        }
    }
    return $is_date;
}