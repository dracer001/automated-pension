console.log("home.js");
document.getElementById("initialize-page-btn").addEventListener("click", (event)=>{
    let pageId = event.target.getAttribute("data-target");
    displayPage({pageId: pageId});
})

document.addEventListener('DOMContentLoaded', function() {

    const page = sessionStorage.getItem('page');
    console.log("page storage", page);
    (page !== null) ? displayPage({pageId: page}) : displayPage({pageId: "home"});
});



// When user clicks the initialize button
document.getElementById("initialize-btn").addEventListener("click", (event)=>{
    const form = document.getElementById("initialize-app");
    clearErrors(form);

    // GET SECRETE KEY
    let secretKey = document.getElementById("initialize-secret-key");

    // RETURN WITH ERROR IF SECRET KEY IS EMPTY
    if(secretKey.value.length === 0){
        displayError(secretKey, "Please Input Secrete key");
        return;
    }

    const btn = event.target
    btn.innerText = "initializing...";
    btn.disabled = true;
    let root = document.querySelector("main")
    showLoader(root);
    const formData = new FormData();
    formData.append("secret_key", secretKey.value);

    sendJsonForm(formData, `/controllers/init.php`, (response)=>{
        hideLoader(root);
        if (response?.success) {
            handleSuccess(btn, response.data);
        }else if (response?.message){
            handleError(btn, response.message);
        }else{
            handleError(btn, "Server Error, Please Check console for error details");
        }
        console.log(response);
        return;
    }, (response)=>{
        console.log(response);
        handleError(btn, "Server Error, Please Check console for error details");
        return;
    })
})


function displayAdminInfo(info) {
    let htmlText = "";
    for (const key in info) {
        htmlText += `<span class="fw-bold">${key}: ${info[key]}</span> <br>`;
    }
    document.querySelector(".server-message").innerHTML = htmlText;
    document.querySelector("#init-warining").classList.add("d-none");
}

function handleError(btn, message) {
    let htmlText = `<div class="text-danger w-100 text-center fw-bold" role="alert">${message}</div>`;
    btn.innerText = "initiaze app";
    btn.disabled = false;
    document.querySelector(".server-message").innerHTML = htmlText;
}

function handleSuccess(btn, data) {
    btn.innerText = "initialized";
    btn.classList.add("btn-success");
    btn.classList.remove("btn-primary");
    displayAdminInfo(data);
}

