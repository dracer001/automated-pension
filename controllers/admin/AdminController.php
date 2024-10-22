<?php

class AdminController{
    	
	private $employeeDB, $jobsDB, $adminDB, $departmentDB, $pensionSettingsDB;

	public function __construct()
    {
        $this->employeeDB = new Employee();
        $this->jobsDB = new Jobs();
        $this->departmentDB = new Departments();
        $this->pensionSettingsDB = new PensionSettings();
    }
    public function getAllEmployees(){
        $employees = $this->employeeDB->all();
        return ($employees["success"]) ? $employees["data"] : false;
    }
    public function getActiveEmployees(){
        $employees = $this->employeeDB->where(["employment_status"=> "employed"]);
        return ($employees["success"]) ? $employees["data"] : false;
    }

    public function getRetiredEmployees(){
        $employees = $this->employeeDB->where(["employment_status"=> "retired"]);
        return ($employees["success"]) ? $employees["data"] : false;
    }
    public function getSackedEmployees(){
        $employees = $this->employeeDB->where(["employment_status"=> "sacked"]);
        return ($employees["success"]) ? $employees["data"] : false;
    }
    public function getPensionEmployees(){
        $employees = $this->employeeDB->query("SELECT * FROM employee INNER JOIN pensioneer USING(employee_id) WHERE pensioneer.pension_status='eligible';");
        return ($employees["success"]) ? $employees["data"] : false;
    }

    public function getEmployeeJobs($employee_id){
        $jobs = $this->jobsDB->where(["employee_id"=>$employee_id]);
        if(!$jobs["success"]) return false;
        return $jobs["data"];
    }

    public function getAllEmployeeswithJobs(){
        $employees = $this->getAllEmployees();
        if(!$employees) return false;
        foreach ($employees as $index => $employee) {
            $jobs = $this->getEmployeeJobs($employee->employee_id);
            $employee->jobs = $jobs;
            $employees[$index] = $employee;
        }
        return $employees;
    }

    public function getAllDepartments(){
        $department = $this->departmentDB->all();
        return ($department["success"]) ? $department["data"] : false;
    }

    public function getAllEmployeeswithPension(){
        $employees = $this->departmentDB->query("SELECT * from employee INNER JOIN pensioneer USING (employee_id);");
        return ($employees["success"]) ? $employees["data"] : false;
    }
    public function getAllEmployeeswithPensionwithJobs(){
        $employees = $this->getAllEmployeeswithPension();
        if(!$employees) return false;
        foreach ($employees as $index => $employee) {
            $jobs = $this->getEmployeeJobs($employee->employee_id);
            $employee->jobs = $jobs;
            $employees[$index] = $employee;
        }
        return $employees;
    }

    public function getSackedEmployeeswithPensionwithJobs(){
        $employees = $this->getSackedEmployees();
        if(!$employees) return false;
        foreach ($employees as $index => $employee) {
            $jobs = $this->getEmployeeJobs($employee->employee_id);
            $employee->jobs = $jobs;
            $employees[$index] = $employee;
        }
        return $employees;
    }
    
    public function getRetiredEmployeeswithPensionwithJobs(){
        $employees = $this->getRetiredEmployees();
        if(!$employees) return false;
        foreach ($employees as $index => $employee) {
            $jobs = $this->getEmployeeJobs($employee->employee_id);
            $employee->jobs = $jobs;
            $employees[$index] = $employee;
        }
        return $employees;
    }

    public function getActiveEmployeeswithPensionwithJobs(){
        $employees = $this->getActiveEmployees();
        if(!$employees) return false;
        foreach ($employees as $index => $employee) {
            $jobs = $this->getEmployeeJobs($employee->employee_id);
            $employee->jobs = $jobs;
            $employees[$index] = $employee;
        }
        return $employees;
    }

    public function getPensionEmployeeswithPensionwithJobs(){
        $employees = $this->getPensionEmployees();
        if(!$employees) return false;
        foreach ($employees as $index => $employee) {
            $jobs = $this->getEmployeeJobs($employee->employee_id);
            $employee->jobs = $jobs;
            $employees[$index] = $employee;
        }
        return $employees;
    }

    public function getPensionSettings(){
        $settings = $this->pensionSettingsDB->where(["id"=>1]);
        return ($settings["success"]) ? $settings["data"][0] : false;
    }
}