const signInModal = document.getElementById('sign-in-modal');
const signInForm = document.getElementById("sign-in-form");

signInModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes
  var user = button.getAttribute('data-bs-user');
  var modalTitle = signInModal.querySelector('.modal-title');
  if(user === "employee"){
    modalTitle.textContent = "Login as employee"
    document.getElementById("username-form").classList.add("d-none");
    document.getElementById("email-form").classList.remove("d-none");
    signInForm.setAttribute("data-user", "employee");
  }
  else{
    modalTitle.textContent = "Login as admin"
    document.getElementById("email-form").classList.add("d-none");
    document.getElementById("username-form").classList.remove("d-none");
    signInForm.setAttribute("data-user", "admin");
  }
})



signInForm.addEventListener('submit', (e) => {
    e.preventDefault();
    
    clearErrors(signInForm);
    const formData = new FormData(e.target);
    const user = e.target.getAttribute("data-user");

    formData.append("user", user)
    const root = document.querySelector("main");

    // Show loader
    showLoader(root);

    // Send AJAX request
    sendJsonForm(formData, `/controllers/auth.php`, (response)=>{
        hideLoader(root);
        if(response?.success) {
            handleAuthSuccess(signInForm, "Login Successful! Reloading Page");
            setTimeout(() => {
                // Reload the current page
                window.location=ROOT+"/?user="+user;
            }, 2000)
        } else if(response?.message) {
            handleAuthError(signInForm, response.message);
        }else{
            handleAuthError(signInForm, "Login Failed !, please try again.");
        }
    }, (error)=>{
        handleAuthError(signInForm, "Login Failed !, please try again.");
        return;
    })
})


function handleAuthError(form, message) {
    let htmlText = `<div class="text-danger w-100 text-center fw-bold" role="alert">${message}</div>`;
    form.querySelector(".server-message").innerHTML = htmlText;
}

function handleAuthSuccess(form, message) {
    let htmlText = `<div class="text-success w-100 text-center fw-bold" role="alert">${message}</div>`;
    form.querySelector(".server-message").innerHTML = htmlText;
}

