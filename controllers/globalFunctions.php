
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
