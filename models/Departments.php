<?php

class Departments extends Database
{ 
    protected $table = "department";

    protected $allowedColumns = [
        'department_id',
        'name',
    ];
}
