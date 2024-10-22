<?php

class Employee extends Database
{ 
    protected $table = "employee";

    protected $allowedColumns = [
        'firstname',
        'lastname',
        'email',
        'password',
        'address',
        'employment_date',
        'terminated_date',
        'employment_status',
        'account_number',
        'bank',
        'postal_code',
        'sex',
    ];

    // public function getJobs($employee_id)
    // {
    //     $jobDB = new Jobs
    // }
}
