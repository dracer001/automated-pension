<?php
require_once '../vendor/autoload.php';


// Replace with your actual Flutterwave API keys
$flw = new \Flutterwave\Rave(getenv('FLWPUBK_TEST-2b280f08412a507161c3f931a5cc346a-X')); // Set `PUBLIC_KEY` as an environment variable
$transferService = new \Flutterwave\Transfer();

class Payment
{
    protected $bearer_token;
    public static $transferId;

    private function __contruct($bearer_token){
        $this->$bearer_token = $bearer_token;
    }

   // Function to initiate a payment
    public function initiatePayment() {
        // Prepare the data for the API call
        $bulk_data = getPensioneersAccountDetails();
        $payment_date = date('Y-m-d H:i:s');

        $details = [
            "title"=>"Pension payment for $payment_date",
            "bulk_data"=>json_encode($bulk_data)
        ]

        try {
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => 'https://api.flutterwave.com/v3/bulk-transfers/',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS =>$details,
              CURLOPT_HTTPHEADER => array(
                "Content-Type: application/json",
                "Authorization: Bearer $this->bearer_token"
              ),
            ));
            $response = curl_exec($curl);
            $response = json_decode($response);
            self::$transferId = $response->data->id;
            return $response;
        } catch (\Throwable $th) {
            logError($th);
        }
        curl_close($curl);

    }

    public function logPaymentDetails(){
        $details = $this->getPaymentDetails();
        // open file and log
    }
    public function getPaymentDetails(){
        if (!empty(self::$transferId)) {

            $curl = curl_init();

            curl_setopt_array($curl, array(
                CURLOPT_URL => "https://api.flutterwave.com/v3/transfers?$transferId",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => array(
                    "Authorization: Bearer $this->bearer_token"
                ),
            ));

            $response = curl_exec($curl);
            curl_close($curl);
            return $response;
        }
    }
 
}

