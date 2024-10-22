<!-- Assume employee already exists -->


<main class="container">
    <h1>Hello <?=$employee->firstname?></h1>

    <div class="dashboard-info d-flex justify-content-around">

        <div class="card text-dark bg-info mb-3 h-100" style="max-width: 18rem;">
            <div class="card-header">Employment Status:</div>
            <div class="card-body">
                <?=$employee->employment_status?>
            </div>
        </div>

        <div class="card text-dark bg-info mb-3 h-100" style="max-width: 18rem;">
            <div class="card-header">Current Job:</div>
            <div class="card-body">
                <?php foreach ($employee->jobs as $job):
                    if ($job->end_date === NULL) : ?>
                <div class="fw-bold">
                    <?= $job->job_title?>
                </div>
                <?php endif; 
                endforeach; ?>
            </div>
        </div>

        <div class="card text-dark bg-info mb-3 h-100" style="max-width: 18rem;">
            <div class="card-header">Bank Details:</div>
            <div class="card-body">
                <p><span class="fw-bold">Bank: </span> <?=$employee->bank?></p>
                <p><span class="fw-bold">Account: </span> <?=$employee->account_number?></p>
                <p><span class="fw-bold">Postal Code: </span> <?=$employee->postal_code?></p>
            </div>
        </div>
    </div>
</main>