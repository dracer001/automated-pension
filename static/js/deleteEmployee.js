document.querySelector(".delete-employee-btn").addEventListener("click", ()=>{
    let secret_key = prompt("you are about to delete an employee record, please input secret key");
    if(!secret_key) return;
    const employee_id = sessionStorage.getItem("employee_id") ?? null;
    if(!employee_id){ notify("error", "employee id not found"); return}

    formData = new FormData();
    formData.append("secret_key", secret_key);
    formData.append("employee_id", employee_id);
    sendJsonForm(formData, "/controllers/admin/deleteEmployee.php", (response)=>{
        console.log(response);
        hideLoader(document.body);
        if (response?.success) {
            notify("success", `deleted 1 employee record with id  ${employee_id}!`);
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