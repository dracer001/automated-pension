<?php

require_once "autoLoader.php";
require_once "controllers/globalFunction.php";

$employeeDB = new Employee();
$jobDB = new Jobs();
$pensionDB = new Pensioneer();

$pensioneers = $employeeDB->query("SELECT employee_id, bank, account_number FROM employee INNER JOIN pensioneers USING(employee_id) WHERE pension_staus = 'eligible';");
foreach ($pensioneers as $pensioneer) {
    $jobs = $jobDB->where(["employee_id"=>$pensioneer->employee_id])
    $amount = calculatePensionAmount($jobs);
    $detail_array = [
        "bank_code"=>$pensioneer->bank,
        "account_number"=>$pensioneer->account_number,
        "currency"=> "NGN",
        "amount"=> $amount,
        "naration"=> "pension payment for ". date("Y-m-d"),
        "reference"=> "pension_payment_$pensioneer->employee"."_".date("Y-m-d H:i:s"),
        "meta"=>[
            "employee_id"=> $pensioneer->employee_id
        ]
    ]
    array_push($bulk_data, $detail_array);
}

// make payment
$payment = new Payment(FLWPUBK_TEST);
$payment->initiatePayment();
$payment->logPaymentDetails();
$payment_details = $payment->getPaymentDetails();
$payment_details = json_decode($payment_details);
foreach ($payment_details->data as $details) {
    if ($details->status=="successful") {
        $employee_id = $details->meta->employee_id;
        $pensionDB.update("employee_id", $employee_id, [
            "last_paid_date"=>date('Y-m-d H:i:s', strtotime($details->created_at));
        ])
    }
}

function calculatePensionAmount($jobs){
    $response = $jobDB->query("SELECT `payment_percentage` FROM `pension_settings` WHERE `id` = 1;");
    $payment_percentage = $response["data"][0]->payment_percentage;
    $job_amount = 0;
    foreach ($jobs as $job) {
        $percentageAmount = $job->pension_percentage*$job->salary/100;
        $working_months = getMonthsDifference($job->start_date, $job->end_date)
        $job_amount += $working_months*$percentageAmount/100;
    }
    $job_amount = round($job_amount*$payment_percentage/100, 2);
    return $job_amount;
}


