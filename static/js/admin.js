const jobFormModel = document.querySelector(".job-info form.demo").cloneNode(true);


document.addEventListener('DOMContentLoaded', function() {
    const page = sessionStorage.getItem('admin-page');
    if(page !== null) {
        let action = sessionStorage.getItem('page-action');
        displayPage({loc:"admin-", pageId:page, afterEffect:employeePageSetup(action)});
    }else{
        displayPage({loc:"admin-", pageId: "dashboard"});
    }
    const employeeDisplay = sessionStorage.getItem('employee-display') ?? "all-employee";
    const employeeQuery = sessionStorage.getItem('employee-query') ?? "";
    displayEmployeeQuery(employeeDisplay, employeeQuery);
    console.log(employeeDisplay, employeeQuery);
});


document.getElementById("dashboard-btn").addEventListener("click", (event)=>{
    displayPage({loc:"admin-", event: event});
});

document.getElementById("add-employee-btn").addEventListener("click", (event)=>{
    displayPage({loc:"admin-", event: event, afterEffect:()=>{
            let action = event.target.getAttribute("data-action");
            employeePageSetup(action);
        }
    });
});



document.querySelectorAll(".view-employee-btn").forEach(btn =>{
    btn.addEventListener("click", ()=>{
        let employee_info = btn.getAttribute("data-info");
        console.log(employee_info);
        employee_info = JSON.parse(employee_info);
        console.log(employee_info);
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
    })
})



function employeePageSetup(action){
    sessionStorage.setItem('page-action', action);
    document.querySelectorAll(".employee-form").forEach(form =>{
        clearErrors(form);
    })
    if (action == "add") {
        document.querySelector(".save-btn").classList.remove("d-none")
        document.querySelector(".pension-info").classList.add("d-none")
        document.querySelectorAll(".change-btn").forEach(btn =>{btn.classList.add("d-none")})
        document.querySelector(".job-info form.demo").classList.remove("d-none");
        document.querySelectorAll(".job-info form:not([class~=demo])").forEach(el=>{
            el.remove();
        })
        const inputForms = document.querySelectorAll("#contact-form, #bank-form, #employment-form, .job-info form.demo")
        inputForms.forEach(form=>{
            form.querySelectorAll("input:not([type='radio'])").forEach(input=>{
                input.value="";
                if (!input.classList.contains("end-date")) {
                    input.readOnly = false;
                }else{
                    input.readOnly = true;
                }
            })
            form.querySelectorAll("input[type=radio]").forEach(input=>{
                input.checked = false;
                input.disabled = false;
            })
            form.querySelectorAll("select").forEach(input=>{
                input.value="";
                input.disabled = false;
            })
        })
    } else if (action == "view") {

        document.querySelector(".pension-info").classList.remove("d-none")
        document.querySelector(".save-btn").classList.add("d-none")
        document.querySelectorAll(".change-btn").forEach(btn =>{btn.classList.remove("d-none")})
        document.querySelectorAll(".end-date").forEach(btn =>{btn.readOnly = true})
        document.querySelector(".job-info form.demo").classList.add("d-none");
    } else if (action == "edit"){
        document.querySelector(".save-btn").classList.add("d-none")
        document.querySelector(".pension-info").classList.add("d-none")
        document.querySelector(".job-info form.demo").classList.remove("d-none");
        const inputForms = document.querySelectorAll(".employee-form:not(#pension-form)");
        inputForms.forEach(form=>{
            form.querySelectorAll("input:not([type='radio'])").forEach(input=>{
                input.readOnly = false;
            })
            form.querySelectorAll("input[type=radio], select").forEach(input=>{
                input.disabled = false;
            })
        })

    }
}

function displayNullError(form, query){
    let empty = false;
    form.querySelectorAll(query).forEach(input =>{
        if (input.value.trim().length === 0) {
            displayError(input, `${input.name} cannot be empty`);
            empty = true;
        }
    })
    return empty;
}


function addEmployee(params) {
    
}


document.querySelector("#pension-settings-btn").addEventListener("click", (event)=>{
    event.preventDefault();
    const form = document.getElementById("payment-settings-form");
    btn = event.target;

    let action = btn.getAttribute("action-type");

    if (action == "edit") {
        form.querySelectorAll("input").forEach(input=>{
            input.readOnly = false;
        })
        btn.textContent  = "save";
        btn.classList.remove("btn-secondary");
        btn.classList.add("btn-success");
        btn.setAttribute("action-type", "save");

    } else if(action == "save") {
        if (displayNullError(form, "input")) return; //check for null and return

        showLoader(document.body);
        const formData = new FormData(form);
        sendJsonForm(formData, "/controllers/admin/editPensionSettings.php", (response)=>{
            console.log(response);
            hideLoader(document.body);
            if(response?.success){

                notify("success", "pension settings has been changed");
                form.querySelectorAll("input").forEach(input=>{
                    input.readOnly = true;
                })
                btn.textContent  = "change";
                btn.classList.add("btn-secondary");
                btn.classList.remove("btn-success");
                btn.setAttribute("action-type", "edit");
            }else{
                console.log(response);
                notify("error", "error in changing pension settings!");
            }
        }, ()=>{
            console.log(response)
            notify("error", "error in changing pension settings!");
        });
    }
})



