<!-- Assume employee already exists -->
<style>
    main{
        background-color: #010a1f;
        color: #fff;
    }
    .card{
        background: transparent;
    }
</style>

<main >
    <div class="container mt-5 p-4">
        <h1 class="my-3">Hello <?=$employee->firstname?></h1>
        <div class="dashboard-info border rounded p-4 my-4">
            <div class="row row-cols-3 g-4">
                <div class="col">
                    <div class="card border-info h-100">
                        <div class="card-header text-info fw-bold border-info">Bank Details</div>
                        <div class="card-body">
                            <p><span class="fw-bold">Bank: </span> <?=$employee->bank?></p>
                            <p><span class="fw-bold">Account: </span> <?=$employee->account_number?></p>
                            <p><span class="fw-bold">Postal Code: </span> <?=$employee->postal_code?></p>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card border-info h-100">
                        <div class="card-header text-info fw-bold border-info">Employment Status</div>
                        <div class="card-body">
                            <div class="alert fw-bold
                                <?php if ($employee->employment_status == 'employed'){
                                    echo 'alert-success';
                                }elseif ($employee->employment_status == 'sacked'){
                                    echo  'alert-danger';
                                } elseif ($employee->employment_status == 'retired'){
                                    echo 'alert-info';
                                } ?>">
                                <?=$employee->employment_status?>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card border-info h-100">
                        <div class="card-header text-info fw-bold border-info">Current Job(s)</div>
                        <div class="card-body">
                            <?php foreach ($employee->jobs as $job):
                                if ($job->end_date === NULL) : ?>
                            <div class="fw-bold"> <i class="bi bi-star-fill text-info me-2"></i>
                                <?= $job->job_title?>
                            </div>
                            <?php endif; 
                            endforeach; ?>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card border-info h-100">
                        <div class="card-header text-info fw-bold border-info">Pension Status</div>
                        <div class="card-body">
                            <div class="alert fw-bold
                                <?php if ($employee->pension_status == 'eligible'){
                                    echo 'alert-success';
                                }elseif ($employee->pension_status == 'not eligible'){
                                    echo  'alert-danger';
                                }?>">
                                <?=$employee->pension_status?>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card border-info h-100">
                        <div class="card-header text-info fw-bold border-info">Pension Allowance</div>
                        <div class="card-body">
                            <p class="fs-4 fw-bold">$ <span class=" text-success"> <?=$employee->pension_allowance?></span> </p>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card border-info h-100">
                        <div class="card-header text-info fw-bold border-info">Last Paid Date</div>
                        <div class="card-body">
                            <?=$employee->last_paid_date?>
                        </div>
                    </div>
                </div>

            </div>

        </div>


        <div class="bio-info p-4 border rounded my-4">
            <h5 class="display-5 border-bottom mb-3">Bio Details</h5>
            <div class="mb-3">
                <p class="fs-5"><span class="fw-bold"> First name: </span> <span class="text-info"><?=$employee->firstname?></span></p>
                <p class="fs-5"><span class="fw-bold">Last name:</span> <span class="text-info"> <?=$employee->lastname?></span></p>
                <p class="fs-5"><span class="fw-bold">Address: </span> <span class="text-info"><?=$employee->address?> </span></p>
                <p class="fs-5"><span class="fw-bold">Gender: </span> <span class="text-info" style="text-transform: capitalize;"><?=$employee->sex?> </span></p>
            </div>
        </div>
    </div>

</main>