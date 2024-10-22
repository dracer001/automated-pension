<?php
// Install with: composer require flutterwavedev/flutterwave-v3
require_once '../vendor/autoload.php';

// Replace with your actual Flutterwave API keys
$flw = new \Flutterwave\Rave(getenv('FLW_SECRET_KEY')); // Set `PUBLIC_KEY` as an environment variable
$transferService = new \Flutterwave\Transfer();

// Function to initiate a payment
function initiatePayment($amount, $email, $tx_ref, $redirect_url) {
    // Prepare the data for the API call
    $details = [
        "title" =>  "Staff salary for April",
        "bulk_data" => [
            [
                "bank_code" => "044",
                "account_number" => "1234567832",
                "amount" => 690000,
                "currency" => "NGN",
                "narration" => "Salary payment for April",
            ],
            [
                "bank_code" => "044",
                "account_number" => "1234567834",
                "amount" => 500000,
                "currency" => "NGN",
                "narration" => "Salary payment for April",
            ]
        ]
    ];
    $response = $transferService->bulkTransfer($details);

}


$response = initiatePayment($amount, $email, $tx_ref, $redirect_url);

// Check if the payment was successfully initiated
if ($response && isset($response['status']) && $response['status'] === 'success') {
    // Redirect the user to the payment page
    header('Location: ' . $response['data']['link']);
    exit();
} else {
    // Handle error
    echo "Error initiating payment: " . $response['message'];
}




    // {
    //     "status": "success",
    //     "message": "Bulk transfer queued",
    //     "data": {
    //       "id": 9145,
    //       "created_at": "2021-04-28T12:20:13.000Z",
    //       "approver": "N/A"
    //     }

    // {
    //     "status": "success",
    //     "message": "Transfers fetched",
    //     "meta": {
    //         "page_info": {
    //             "total": 0,
    //             "current_page": 0,
    //             "total_pages": 0
    //         },
    //         "errors": [
    //             {
    //                 "reference": "bulk_Transfers_0019_PMCK",
    //                 "item": 1,
    //                 "message": "Payout with this ref already exists"
    //             },
    //             {
    //                 "reference": "bulk_Transfers_0020_PMCK",
    //                 "item": 2,
    //                 "message": "Payout with this ref already exists"
    //             },
    //             {
    //                 "reference": "bulk_Transfers_0021_PMCK",
    //                 "item": 3,
    //                 "message": "Payout with this ref already exists"
    //             },
    //             {
    //                 "reference": "bulk_Transfers_0022_PMCK",
    //                 "item": 4,
    //                 "message": "Payout with this ref already exists"
    //             }
    //         ]
    //     },
    //     "data": []
    // }
    