<?php

class EmployeeController{
    	
	private $employeeDB, $jobsDB;
    public $employee_id;
	public function __construct($employee_id)
    {
        $this->employeeDB = new Employee();
        $this->jobsDB = new Jobs();
        $this->employee_id = $employee_id;

    }
    public function getEmployee(){
        $employee = $this->employeeDB->where(["employee_id"=>$this->employee_id]);
        if(!$employee["success"]) return false;
        return $employee["data"][0];
    }
    public function getEmployeeJobs(){
        $employee = $this->jobsDB->where(["employee_id"=>$this->employee_id]);
        if(!$employee["success"]) return false;
        return $employee["data"];
    }
    public function getEmployeewithJobs(){
        $employee = $this->getEmployee();
        if(!$employee) return false;
        $jobs = $this->getEmployeeJobs();
        if(!$jobs) return false;
        $employee->jobs = $jobs;
        return $employee;
    }
}