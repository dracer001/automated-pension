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

    public function updatePensionStatus($employee_id)
    {
        return $this->query("
            UPDATE `pensioneer`
            INNER JOIN `employee` USING(`employee_id`)
            SET `pensioneer`.`pension_status` = 'eligible',
                `pensioneer`.`start_date` = NOW()
            WHERE `employee`.`employment_status` = 'retired'
            AND TIMESTAMPDIFF(YEAR, `employee`.`employment_date`, `employee`.`terminated_date`) > 40
            AND `employee`.`employee_id` = $employee_id;
        ");
    }
}
