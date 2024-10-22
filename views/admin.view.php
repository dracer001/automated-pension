<style>
    main{
        background-color: #010a1f;
        color: #fff;
    }
    .column {
      height: 100vh; /* Set each column height to 100% of the viewport */
      overflow: auto; /* Allow vertical scrolling if content exceeds height */
      padding-top: 5rem !important;
    }
    .table-container {
        overflow-x: auto; /* Hide horizontal overflow */
        position: relative;
        height: 100%;
    }
    .table td, .table th {
        white-space: nowrap; /* Prevent text from wrapping */
        overflow: hidden;
        text-overflow: ellipsis; /* Show "..." for overflowing text */
    }
    .table{
        position: absolute;
        top: 0;
        height: 100%;
    }
    .add-employee-btn{
        bottom: 20px;
        right: 10px;
    }

    #dashboard-btn, .view-employee-btn{
        cursor: pointer;
    }

    .employee-filter-container{
        overflow-x: scroll;
    }
    .employee-filter-btn{
        color: #6ba5fd85;
    }
    .employee-filter-btn:hover{
        color: #6ba5fdea;
    }
    .employee-filter-btn.active{
        color: #0d6efd;
    }
</style>
<main class="container-fluid">
    <div class="row gx-3">
        <div class="col-3 p-3 column">
            <h2 class="mb-3 border-bottom">Your Profile</h2>
            <div class="admin-profile border rounded p-3 mt-5">
                <div class="mb-3 ">
                    <span class="fw-bold">username:</span><br>
                    <span class="text-info"><?=$admin->username?></span>
                </div>
                <div class="mb-3">
                    <span class="fw-bold">email:</span> <br>
                    <span class="text-info"><?=$admin->email?></span>
                </div>
                <div class="mb-3">
                    <span class="fw-bold">Role:</span> <br>
                    <span class="text-info"><?=$admin->role?></span>
                </div>
            </div>
            <div class="other-links">
                <button class="btn btn-outline-info w-100 mt-5">change password</button><br>
                <?php if($admin->role == "super_admin"):?>
                <button class="btn btn-outline-info w-100 my-3"><i class="bi bi-plus"></i> add admin</button>
                <?php endif ?>
            </div>
        </div>

        <div class="col-5 p-3 column">
            <h2 class="page-btn border-bottom" id="dashboard-btn" data-page="dashboard">dashboard</h2>
            <div id="dashboard" class="page d-none mt-5">
                <div class="border rounded-3 p-3 mb-4">
                    <h3 class="text-info mb-3 ">Employment Details</h3>
                    <div class="mb-2">
                        <span class="fw-bold">Total no of active employees:</span> 
                        <span><?=count($active_employees)?></span>
                    </div>
                    <div class="mb-2">
                        <span class="fw-bold">Total no of sacked employees:</span> 
                        <span><?=count($sacked_employees)?></span>
                    </div>
                    <div class="mb-2">
                        <span class="fw-bold">Total no of retired employees:</span> 
                        <span><?=count($retired_employees)?></span>
                    </div>
                    <div class="mb-2">
                        <span class="fw-bold">Total no of pensioneers:</span> 
                        <span><?=count($pension_employees)?></span>
                    </div>
                </div>

                <div class="border rounded-3 p-3 mb-4">
                    <h3 class="text-info">Departments</h3>
                    <?php foreach ($departments as $department): ?>
                        <div><i class="bi bi-check-circle text-info"></i> <?=$department->name?></div>
                    <?php endforeach; ?>
                </div>

                <div class="border rounded-3 p-3 mb-4">
                    <h3 class="text-info mb-3">Pension Settings</h3>
                    <form id="payment-settings-form">
                        <div class="mb-3 form-group">
                            <label for="payment-percentage">Payment Percentage</label>
                            <div class="input-group input-group-sm mb-3">
                                <input type="number" name="payment_percentage" class="form-control" value="<?=$payment_percentage?>" readonly>
                                <span class="input-group-text">%</span>
                            </div>
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="mb-3 form-group">
                            <label for="payment-date">Payment Monthly Date</label>
                            <input type="number" name="payment_date" class="form-control" value="<?=$payment_date?>" readonly>
                            <div class="invalid-feedback">Error message here</div>
                        </div>   
                        <div class="mb-3">
                            <button id="pension-settings-btn" class="btn btn-secondary" action-type="edit">change</button>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="page d-none mt-5" id="employee">
                <fieldset class="border rounded-3 shadow mb-3 p-3">
                    <legend class="text-info">Contact Info</legend>
                    <form class="row g-3 employee-form" id="contact-form">
                        <div class="col-md-6 form-group">
                            <label for="firstname" class="form-label">Firstname</label>
                            <input type="text" class="form-control required" name="firstname">
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="lastname" class="form-label">Lastname</label>
                            <input type="text" class="form-control required" name="lastname">
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="Leave blank to auto generate email">
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="col-6 form-group">
                            <label class="d-block mb-3" for="sex">Gender</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input required" type="radio" name="sex" id="sex-male" value="male">
                                <label class="form-check-label" for="sex-male">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input required" type="radio" name="sex" id="sex-female" value="female">
                                <label class="form-check-label" for="sex-female">Female</label>
                            </div>
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="col-12 form-group">
                            <label for="inputAddress" class="form-label">Address</label>
                            <input type="text" class="form-control required" name="address" placeholder="1234 Main St">
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                    </form>
                </fieldset>

                <fieldset class="border rounded-3 shadow mb-3 p-3">
                    <legend class="text-info">Bank Info</legend>
                    <form class="row g-3 employee-form" id="bank-form">
                        <div class="col-md-12 form-group">
                            <label for="bank-name" class="form-label">Bank name</label>
                            <input type="text" class="form-control required" name="bank">
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="col-md-8 form-group">
                            <label for="account-number" class="form-label">Account number</label>
                            <input type="number" class="form-control required" name="account_number">
                            <div class="invalid-feedback">Error message here</div>

                        </div>
                        <div class="col-4 form-group">
                            <label for="postal-code" class="form-label">Postal Code</label>
                            <input type="number" class="form-control required" name="postal_code" placeholder="1234567">
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                    </form>
                </fieldset>

            
                <fieldset class="border rounded-3 shadow mb-3 p-3">
                    <legend class="text-info">Employment Info</legend>
                    <form class="row g-3 employee-form" id="employment-form">
                        <div class="col-md-12 form-group">
                            <label for="employment-status" class="form-label">Employment Status</label>
                            <select name="employment_status" class="form-select required">
                                <option selected disabled value="">Choose...</option>
                                <option value="employed">Employed</option>
                                <option value="retired">Retired</option>
                                <option value="sacked">Sacked</option>
                            </select>
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="account-number" class="form-label">Employment Date</label>
                            <input type="date" class="form-control" name="employment_date">
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="col-md-6">
                            <label for="termination-date" class="form-label">Termination Date</label>
                            <input type="date" class="form-control end-date" name="terminated_date">
                        </div>
                    </form>
                </fieldset>

                <fieldset class="border rounded-3 shadow mb-3 p-3 job-info">
                    <legend class="text-info">Job Info</legend>
                    <form class="row g-3 employee-form demo my-3 border rounded p-3 job-form" id="job-form">
                        <div class="col-md-12 form-group">
                            <label for="employment-status" class="form-label">Department</label>
                            <select name="department_id" class="form-select required">
                                <option selected disabled>Choose...</option>
                                <?php foreach($departments as $department) :?>
                                <option value="<?=$department->department_id?>"><?=$department->name?></option>
                                <?php endforeach; ?>
                            </select>
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label for="job-title" class="form-label">Job Title</label>
                            <input type="text" class="form-control required" name="job_title">
                            <div class="invalid-feedback">Error message here</div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="start-date" class="form-label required">Start Date</label>
                            <input type="date" class="form-control" name="start_date">
                        </div>
                        <div class="col-md-6">
                            <label for="end-date" class="form-label">End Date</label>
                            <input type="date" class="form-control end-date" name="end_date">
                        </div>
                    </form>
                </fieldset>

                <fieldset class="border rounded-3 shadow mb-3 p-3 pension-info">
                    <legend class="text-info">Pension Info</legend>
                    <form class="row g-3 employee-form" id="pension-form">
                        <div class="col-md-12">
                            <label for="pension-status" class="form-label">Status</label>
                            <select name="pension_status" class="form-select" disabled>
                                <option selected disabled value="">Choose...</option>
                                <option value="not eligible">Not Eligible</option>
                                <option value="eligible">Eligible</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="accumulated-amount" class="form-label">Accumulated Amount</label>
                            <div  class="input-group">
                                <span class="input-group-text">N</span>
                                <input type="number" class="form-control" id="accumulated-amount" value="" disabled>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="monthly-amount" class="form-label">Monthly Payment Amount</label>
                            <div  class="input-group">
                                <span class="input-group-text">N</span>
                                <input type="number" class="form-control" id="monthly-amount" value="" disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="start-date" class="form-label">Last Payment Date</label>
                            <input type="date" class="form-control" name="last_paid_date" disabled>
                        </div>
                        <div class="col-md-4">
                            <label for="start-date" class="form-label">Start Date</label>
                            <input type="date" class="form-control" name="start_date" disabled>
                        </div>
                        <div class="col-md-4">
                            <label for="stop-date" class="form-label">Stop Date</label>
                            <input type="date" class="form-control end-date" name="stop_date" disabled>
                        </div>
                        
                    </form>
                </fieldset>
                <div class="loader d-none">
                    <span class="spinner-grow spinner-grow-sm text-secondary" role="status"></span>
                    <span class="spinner-grow spinner-grow-sm text-secondary mx-3" role="status"></span>
                    <span class="spinner-grow spinner-grow-sm text-secondary" role="status"></span>
                </div>
                <div class="action-btns">
                    <button class="btn btn-success save-btn" id="save-employee-btn">Save</button>
                    <button class="btn btn-secondary edit-employee-btn change-btn" data-action="edit">Edit</button>
                    <button class="btn btn-danger delet-employee-btn change-btn">Delete</button>
                </div>
            </div>

        </div>

        <div class="col-4 p-3 column">
            <div class="d-flex my-3">
                <input class="form-control me-2" type="search" placeholder="Search" id="employee-query">
                <button class="btn btn-outline-info" type="submit">Search</button>
            </div>
            <div class="d-flex border-bottom my-3 employee-filter-container">
                <button class="btn employee-filter-btn" data-target="all-employee">all</button>
                <button class="btn ms-3 employee-filter-btn" data-target="active-employee">active</button>
                <button class="btn ms-3 employee-filter-btn" data-target="retired-employee">retired</button>
                <button class="btn ms-3 employee-filter-btn" data-target="sacked-employee">sacked</button>
                <button class="btn ms-3 employee-filter-btn" data-target="pension-employee">pensioneers</button>
            </div>
            <div class="table-container">
                <table class="table table-dark table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Firstname</th>
                            <th scope="col">Lastname</th>
                            <th scope="col">Email</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Employment Status</th>
                        </tr>
                    </thead>
                    <tbody class="employee-filter d-none" id="all-employee">
                        <?php foreach ($employees as $employee): ?>
                            <tr class="view-employee-btn" data-info='<?=json_encode($employee);?>'>
                                <td><?=$employee->firstname?></td>
                                <td><?=$employee->lastname?></td>
                                <td><?=$employee->email?></td>
                                <td><?=$employee->sex?></td>
                                <td><?=$employee->employment_status?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tbody class="employee-filter d-none" id="active-employee">
                        <?php foreach ($active_employees as $employee): ?>
                            <tr class="view-employee-btn" data-info='<?=json_encode($employee);?>'>
                                <td><?=$employee->firstname?></td>
                                <td><?=$employee->lastname?></td>
                                <td><?=$employee->email?></td>
                                <td><?=$employee->sex?></td>
                                <td><?=$employee->employment_status?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tbody class="employee-filter d-none" id="sacked-employee">
                        <?php foreach ($sacked_employees as $employee): ?>
                            <tr class="view-employee-btn" data-info='<?=json_encode($employee);?>'>
                                <td><?=$employee->firstname?></td>
                                <td><?=$employee->lastname?></td>
                                <td><?=$employee->email?></td>
                                <td><?=$employee->sex?></td>
                                <td><?=$employee->employment_status?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tbody class="employee-filter d-none" id="retired-employee">
                        <?php foreach ($retired_employees as $employee): ?>
                            <tr class="view-employee-btn" data-info='<?=json_encode($employee);?>'>
                                <td><?=$employee->firstname?></td>
                                <td><?=$employee->lastname?></td>
                                <td><?=$employee->email?></td>
                                <td><?=$employee->sex?></td>
                                <td><?=$employee->employment_status?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tbody class="employee-filter d-none" id="pension-employee">
                        <?php foreach ($pension_employees as $employee): ?>
                            <tr class="view-employee-btn" data-info='<?=json_encode($employee);?>'>
                                <td><?=$employee->firstname?></td>
                                <td><?=$employee->lastname?></td>
                                <td><?=$employee->email?></td>
                                <td><?=$employee->sex?></td>
                                <td><?=$employee->employment_status?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tbody class="employee-filter d-none" id="query-employee">
                        <tr class="view-employee-btn demo d-none">
                            <td class="firstname"></td>
                            <td class="lastname"></td>
                            <td class="email"></td>
                            <td class="sex"></td>
                            <td class="employment_status"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <button id="add-employee-btn" class="page-btn btn btn-success position-fixed add-employee-btn" data-page="employee" data-action="add"><i class="bi bi-plus"></i> add employee</button>
        </div>
    </div>
</main>

<script src="<?=ROOT?>/static/js/employeeQuery.js"></script>
<script src="<?=ROOT?>/static/js/employeeCrud.js"></script>
<script src="<?=ROOT?>/static/js/editEmployee.js"></script>
<script src="<?=ROOT?>/static/js/admin.js"></script>