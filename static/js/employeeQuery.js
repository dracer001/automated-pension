const AllEmployeeDatabase = [];
const SackedEmployeeDatabase = [];
const RetiredEmployeeDatabase = [];
const PensionEmployeeDatabase = [];
const ActiveEmployeeDatabase = [];

const result_template = document.querySelector(".view-employee-btn.demo").cloneNode(true);

document.addEventListener("DOMContentLoaded", ()=>{
    document.querySelectorAll("#all-employee .view-employee-btn").forEach(el =>{
        try {
            var data = JSON.parse(el.getAttribute("data-info"))
            AllEmployeeDatabase.push(data);
        } catch (error) {
            console.log(error);
        }
    })
    document.querySelectorAll("#sacked-employee .view-employee-btn").forEach(el =>{
        try {
            var data = JSON.parse(el.getAttribute("data-info"))
            SackedEmployeeDatabase.push(data);
        } catch (error) {
            console.log(error);
        }
    })
    document.querySelectorAll("#retired-employee .view-employee-btn").forEach(el =>{
        try {
            var data = JSON.parse(el.getAttribute("data-info"))
            RetiredEmployeeDatabase.push(data);
        } catch (error) {
            console.log(error);
        }
    })
    document.querySelectorAll("#pension-employee .view-employee-btn").forEach(el =>{
        try {
            var data = JSON.parse(el.getAttribute("data-info"))
            PensionEmployeeDatabase.push(data);
        } catch (error) {
            console.log(error);
        }
    })
    document.querySelectorAll("#active-employee .view-employee-btn").forEach(el =>{
        try {
            var data = JSON.parse(el.getAttribute("data-info"))
            ActiveEmployeeDatabase.push(data);
        } catch (error) {
            console.log(error);
        }
    })
})



function displayEmployeeQuery(displayId, query="") {
    sessionStorage.setItem("employee-query", query)
    if (query.trim().length > 0) {
        let EmployeeDatabase = [];
        let queryParent = document.getElementById("query-employee")
        queryParent.innerHTML = "";
        let tables = document.querySelectorAll(".employee-filter");
        tables.forEach(table =>{
            if(table.id == "query-employee"){
                table.classList.remove("d-none");
            }else{
                table.classList.add("d-none");
            }
        })
        switch (displayId) {
            case "active-employee":
                EmployeeDatabase = ActiveEmployeeDatabase;
                break;
            case "retired-employee":
                EmployeeDatabase = RetiredEmployeeDatabase;
                break;
            case "sacked-employee":
                EmployeeDatabase = SackedEmployeeDatabase;
                break;
            case "pension-employee":
                EmployeeDatabase = PensionEmployeeDatabase;
                break;
            case "all-employee":
                EmployeeDatabase = AllEmployeeDatabase;
                break;
        
            default:
                EmployeeDatabase = AllEmployeeDatabase;
                break;
        }
        console.log(EmployeeDatabase);
        let Employees = EmployeeDatabase.filter(employee =>
            employee.firstname.toLowerCase().startsWith(query.toLowerCase()) ||
            employee.lastname.toLowerCase().startsWith(query.toLowerCase()) ||
            employee.email.toLowerCase().startsWith(query.toLowerCase())
        );
        
        console.log("Employees: ");
        console.log(Employees);
        Employees.forEach(employee =>{
            let template = result_template.cloneNode(true);
            template.classList.remove("d-none", "demo")
            let employee_json = JSON.stringify(employee);
            template.setAttribute("data-info", employee_json)
            template.querySelector(".firstname").innerText = employee.firstname;
            template.querySelector(".lastname").innerText = employee.lastname;
            template.querySelector(".sex").innerText = employee.sex;
            template.querySelector(".email").innerText = employee.email;
            template.querySelector(".employment_status").innerText = employee.employment_status;
            template.addEventListener("click", ()=>{displayEmployeeInfo(template)});
            console.log(template);
            queryParent.appendChild(template);
        })

    }else{
        let tables = document.querySelectorAll(".employee-filter");
        tables.forEach(table =>{
            if (table.id == displayId){
                table.classList.remove("d-none");
                sessionStorage.setItem("employee-display", displayId)
                document.querySelectorAll(".employee-filter-btn").forEach(btn =>{
                    (btn.getAttribute("data-target") == displayId) ?
                        btn.classList.add("active") :
                        btn.classList.remove("active");
                })
            }else{
                table.classList.add("d-none");
            }
        })
    }

}


document.querySelectorAll(".employee-filter-btn").forEach(btn=>{
    btn.addEventListener("click", ()=>{
        let query = sessionStorage.getItem("employee-query") ?? "";
        let displayId = btn.getAttribute("data-target");
        displayEmployeeQuery(displayId, query);
    })
})


document.querySelector("input#employee-query").addEventListener("keyup", (event)=>{
    let query = event.target.value;
    // console.log(query);
    let displayId = sessionStorage.getItem('employee-display') ?? "all-employee";
    // console.log(displayId);
    displayEmployeeQuery(displayId, query);
})
