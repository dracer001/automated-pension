<?php

class Jobs extends Database
{ 
    protected $table = "jobs";

    protected $allowedColumns = [
        'department_id',
        'employee_id',
        'job_title',
        'salary',
        'start_date',
        'end_date',
        'pension_percentage'
    ];
}
