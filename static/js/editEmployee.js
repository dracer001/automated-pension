document.querySelector(".edit-employee-btn").addEventListener("click", (event)=>{
    let btn = event.target;
    let action = btn.getAttribute("data-action");
    if (action == "edit") {
        btn.textContent = "Save";
        btn.setAttribute("data-action", "save");
        btn.classList.remove("btn-secondary");
        btn.classList.add("btn-success");

        employeePageSetup(action);   
        
    }else if (action == "save") {
        const joinForm = (singleForm)=>{
            new FormData(singleForm).forEach((value, key) =>{
                employeeForm.append(key, value);
            })
        }
        const inputForms = document.querySelectorAll(".employee-form:not(#pension-form, .job-form)");
        const employeeForm = new FormData()
        inputForms.forEach(form=>{
            joinForm(form);
        })
        const jobs = []
        const jobForm = document.querySelectorAll(".job-form");
        jobForm.forEach(form=>{
            let job = {}
            new FormData(form).forEach((value, key)=>{
                job[key] = value;
            })
            jobs.push(job)
        })
        employeeForm.append("employee_id", sessionStorage.getItem("employee_id"))
        employeeForm.append("jobs", JSON.stringify(jobs))
        employeeForm.forEach((value, key)=>{
            console.log(`${key}: ${value}`);
        })
        sendJsonForm(employeeForm, "/controllers/admin/editEmployee.php", (response)=>{
            console.log(response);
            hideLoader(document.body);
            if (response?.success) {
                if(response.actions.length == 0){
                    notify("success", "No action performed on employee");
                    return;
                }
                notify("success", " Employee record updated successfuly! check console for actions");
                // btn.textContent = "Edith";
                // btn.setAttribute("data-action", "save");
                // btn.classList.remove("btn-secondary");
                // btn.classList.add("btn-success");
                setTimeout(()=>{
                    location.reload();
                }, 6000);
            }else if(response?.message){
                notify("error", response.message);
            }else{
                notify("error", "error occured with server, please try again!");
            }
        }, ()=>{
            hideLoader(document.body);
            notify("error", "error occured with server, please try again!");
        })

    }



})