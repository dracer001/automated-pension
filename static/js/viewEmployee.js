document.querySelectorAll(".view-employee-btn").forEach(btn =>{
    btn.addEventListener("click", ()=>{
        displayEmployeeInfo(btn)})
})


function displayEmployeeInfo(btn){
    console.log("btn", btn);
    let employee_info = btn.getAttribute("data-info");
    console.log(employee_info);
    employee_info = JSON.parse(employee_info);
    console.log("employee_info", employee_info);
    sessionStorage.setItem("employee_id", employee_info.employee_id);
    document.querySelectorAll(".employee-form").forEach(form => {
        for (let key in employee_info) {
            let date_trial = formatDate(employee_info[key]);
            if (key.endsWith("date") && date_trial ) {
                employee_info[key]  = date_trial
            }

            let inputField = form.querySelector(`input[name="${key}"]:not([type="radio"])`);
            if (inputField) { // Check if the input field exists
                inputField.value = employee_info[key];
                inputField.readOnly = true;
            }
            inputField = form.querySelectorAll(`input[name="${key}"][type="radio"]`);
            if (inputField) { // Check if the input field exists
                for (const input of inputField) {
                    input.disabled = true;
                    if (input.value == employee_info[key]) {
                        input.checked = true;
                    }                 
                }
            }
            inputField = form.querySelector(`select[name="${key}"]`);
            if (inputField) { // Check if the input field exists
                inputField.value = employee_info[key];
                inputField.disabled = true;
            }
        }
    });
    let employeeJobs = employee_info.jobs;
    let jobContainer = document.querySelector(".job-info");
    let job_amount = 0;
    employeeJobs.forEach(job=>{
        let jobFormTemplate = jobFormModel.cloneNode(true);
        jobFormTemplate.id="";
        jobFormTemplate.classList.remove("demo");
        console.log(job)
        for (let key in job) {
            let date_trial = formatDate(job[key]);
            if (key.endsWith("date") && date_trial ) {
                job[key]  = date_trial
            }
            let inputField = jobFormTemplate.querySelector(`input[name="${key}"]`);
            if (inputField) {
                inputField.value = job[key];
                inputField.readOnly = true
            }
            inputField = jobFormTemplate.querySelector(`select[name="${key}"]`);
            if (inputField) { // Check if the input field exists
                inputField.value = job[key];
                inputField.disabled = true;
            }
            let id_el = document.createElement("input");
            id_el.type="hidden";
            id_el.name="job_id";
            id_el.value=job.job_id;
            jobFormTemplate.appendChild(id_el);
        }
        jobContainer.appendChild(jobFormTemplate);
        let percentageAmount = job.pension_percentage * job.salary;
        let working_months = getMonthsDifference(job.start_date, job.end_date)
        job_amount += working_months*percentageAmount/100;
    })
    document.getElementById("accumulated-amount").value=job_amount.toFixed(2);
    let payment_percentage = document.querySelector("input[name='payment_percentage']").value;
    document.getElementById("monthly-amount").value=(job_amount*payment_percentage/100).toFixed(2);

    displayPage({loc:"admin-", pageId: "employee", afterEffect:employeePageSetup("view")})
}
