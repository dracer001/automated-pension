<?php

// Function to generate random account numbers
function generateRandomAccountNumber() {
    return sprintf("%010d", rand(0, 9999999999)); // Generates a random 10-digit number
}

// Function to generate random narration
function generateRandomNarration() {
    $narrations = [
        "Monthly pension transfer",
        "Salary disbursement",
        "Bonus payment",
        "Retirement fund allocation",
        "Pension adjustment",
        "Year-end bonus",
        "Compensation payment",
        "Severance payment",
        "Medical allowance",
        "Transportation reimbursement"
    ];
    return $narrations[array_rand($narrations)];
}

// Create an array to hold the transaction data
$data = [
    "status" => "success",
    "message" => "Transfer fetched",
    "data" => []
];

// Generate random transaction data for 27 employees
for ($i = 0; $i < 27; $i++) {
    $transaction = [
        "id" => 1933222 + $i, // Incrementing ID
        "account_number" => generateRandomAccountNumber(),
        "created_at" => (new DateTime('now'))->modify("-$i days")->format('Y-m-d\TH:i:s\Z'), // Decrementing date for each transaction
        "amount" => rand(200, 500), // Random amount between 200 and 500
        "status" => "SUCCESSFUL",
        "meta" => ["employee_id" => rand(20, 50)], // Random employee ID between 20 and 50
        "narration" => generateRandomNarration(),
    ];
    $data['data'][] = $transaction;
}

// Create a log file
$logFile = fopen('logs/payment.log', 'a');

foreach ($data['data'] as $transaction) {
    // Convert created_at to a DateTime object
    $createdAt = new DateTime($transaction['created_at']);
    // Format the log entry
    $logEntry = sprintf(
        "[%s] Payment ID: %d, Account Number: %s, Amount: %.2f, Status: %s, Employee ID: %d, Narration: %s\n",
        $createdAt->format('Y-m-d H:i:s'),
        $transaction['id'],
        $transaction['account_number'],
        $transaction['amount'],
        $transaction['status'],
        $transaction['meta']['employee_id'],
        $transaction['narration']
    );
    fwrite($logFile, $logEntry);
}

// Close the log file
fclose($logFile);

echo "Log file created successfully.";
?>
