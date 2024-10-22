<?php

class PensionSettings extends Database
{ 
    protected $table = "pension_settings";

    protected $allowedColumns = [
        'id',
        'payment_percentage',
        'payment_date',
    ];
}
