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


document.querySelector("#add-admin-btn").addEventListener("click", (event)=>{
    displayPage({loc:"admin-", event:event});
})
document.querySelector("#change-password-btn").addEventListener("click", (event)=>{
    displayPage({loc:"admin-", event:event});
})


document.querySelector(".save-admin-btn").addEventListener("click", (e)=>{

    e.preventDefault();
    const form = document.querySelector(".add-admin-form");

    clearErrors(form);
    document.querySelector(".server-message").innerHTML = "";
    if(displayNullError(form, "input")) return;
    showLoader(document.body);
    formData = new FormData(form);
    sendJsonForm(formData, "/controllers/admin/addAdmin.php", (response)=>{
        hideLoader(document.body);
        console.log(response);
        if (response?.success) {
            notify("success", "admin user added successfuly!")
            displayAdminInfo(response.data);
        }else if(response?.message){
            notify("error", response.message);
        }else{
            notify("error", "error occured with server, please try again!");
        }
    }, ()=>{
        hideLoader(document.body);
        notify("error", "error occured with server, please try again!");
    })
})

document.querySelector(".save-password-btn").addEventListener("click", (e)=>{
    const form = document.querySelector(".change-password-form");
    e.preventDefault();
    clearErrors(form);
    if(displayNullError(form, "input")) return;
    let new_pwd = form.querySelector("[name=new_password]");
    let confirm_pwd = form.querySelector("[name=confirm_password]");
    if (new_pwd.value !== confirm_pwd.value) {displayError(confirm_pwd, "password do not match"); return;}
    showLoader(document.body);

    formData = new FormData(form);
    sendJsonForm(formData, "/controllers/admin/changePassword.php", (response)=>{
        hideLoader(document.body);
        console.log(response);
        if (response?.success) {
            notify("success", "password updated successfuly!")
        }else if(response?.message){
            notify("error", response.message);
        }else{
            notify("error", "error occured with server, please try again!");
        }
    }, ()=>{
        hideLoader(document.body);
        notify("error", "error occured with server, please try again!");
    })
})


function displayAdminInfo(info) {
    let htmlText = "<h5 class='text-center'>Admin Info</h5>";
    for (const key in info) {
        htmlText += `<span class="fw-bold">${key}: ${info[key]}</span> <br>`;
    }
    document.querySelector(".server-message").innerHTML = htmlText;
}