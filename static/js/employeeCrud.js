// Group Form
const contactForm = document.getElementById("contact-form");
const bankForm = document.getElementById("bank-form");
const employmentForm = document.getElementById("employment-form");
const jobForm = document.getElementById("job-form");
document.getElementById("save-employee-btn").addEventListener("click", ()=>{
    var input_error = false;
    document.querySelectorAll(".employee-form").forEach(form =>{
        clearErrors(form);
        if (displayNullError(form, "input.required")) input_error = true;
        if (displayNullError(form, "select.required")) input_error = true;
    })
    var radio_error = true
    const radio_input = contactForm.querySelectorAll("input[name=sex]")
    radio_input.forEach(input=>{
        if (input.checked) {
            radio_error = false;
        }
    })
    if(radio_error) {
        radio_input.forEach(input=>{
            displayError(input, "Please select a gender")
        })
    }
    if(input_error || radio_error) return;

    showLoader(document.body);


    const employeeForm = new FormData();

    joinForm = (singleForm)=>{
        new FormData(singleForm).forEach((value, key) =>{
            employeeForm.append(key, value);
        })
    }

    joinForm(contactForm);
    joinForm(bankForm);
    joinForm(employmentForm);
    joinForm(jobForm);

    // Send Employee data to bank end
    sendJsonForm(employeeForm, "/controllers/admin/addEmployee.php", (response)=>{
        console.log(response);
        hideLoader(document.body);
        if (response?.success) {
            notify("success", "employee record added successfuly!");
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
})