<?php

class Pensioneer extends Database
{ 
    protected $table = "pensioneer";

    protected $allowedColumns = [
        'employee_id',
        'pension_status',
        'last_paid_date',
        'start_date',
        'stop_date',
    ];
}
