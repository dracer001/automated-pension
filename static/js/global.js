var ROOT;
document.addEventListener("DOMContentLoaded", ()=>{
    ROOT = document.getElementById("root-url").value;

})


function displayPage({loc="", event=null, pageId=null, selector=".page", afterEffect = ()=>{}} = {}) {
    console.log("selector", selector);
    console.log("pageId", pageId);
    console.log("event", event);
    if (!pageId && event) {
        pageId = event.target.getAttribute("data-page");
    }
    const pages = document.querySelectorAll(selector);
    pages.forEach(page => {
        if(page.id === pageId) {
            page.classList.remove("d-none");
            sessionStorage.setItem(loc+'page', pageId);
            afterEffect();
        }else{
            page.classList.add("d-none");
        }
    });
}

const sendJsonForm = (formData, location, responseCallback, errorCallback = null)=>{
    console.log("location: ", ROOT+location);
    // Send data using fetch
    fetch(ROOT+location, {
      method: 'POST',
      body: formData
    })
    .then(response => response.text())
    .then(response => {
      try {
        console.log("response text", response);
        // Attempt to parse the response as JSON
        response = JSON.parse(response);
        return responseCallback(response);
      } catch (error) {
          // Catch any errors from JSON parsing
          console.error("Error parsing JSON:", error);
          let error_response = (errorCallback) ? errorCallback(error) : console.log(error);
          return error_response;
      }
    })
    .catch(error => {
      // Catch any other errors, such as network issues
      console.error("Error in fetch:", error);
      let error_response = (errorCallback) ? errorCallback(error) : console.log(error);
      return error_response;
    });
  
}


function displayError(input, message) {
    const formGroup = input.closest('.form-group');
    const errorElement = formGroup.querySelector('.invalid-feedback');
    
    // Highlight input field
    input.classList.add('is-invalid');
    
    // Show error message
    errorElement.textContent = message;
    errorElement.style.display = 'block';
}


function clearErrors(form) {
    form.querySelectorAll('.form-group .invalid-feedback').forEach(el => el.style.display = 'none');
    form.querySelectorAll('.form-control, .form-check-input, .form-select').forEach(el => el.classList.remove('is-invalid'));
}

function showLoader(form) {
    form.querySelector('.loader').classList.remove("d-none")
    form.classList.add("loader-bg");
}

function hideLoader(form) {
    form.querySelector('.loader').classList.add("d-none")
    form.classList.remove("loader-bg");
}


function notify(type, message) {
    console.log("notify", message)
    message = (type == "error") ?
      `<div class="alert alert-danger" role="alert">${message}</div>` :
      (type == "success") ?
      `<div class="alert alert-success" role="alert">${message}</div>`:
      message;
    let notifyEl = document.getElementById("notify")
    notifyEl.innerHTML = message;
    notifyEl.classList.add("display");
    setTimeout(() => {
      notifyEl.classList.remove("display");
    }, 5000);
  }


function formatDate(timestamp) {
const date = new Date(timestamp);
// Check if the date is valid
if (!isNaN(date.getTime()) && timestamp !== null) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are 0-based
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}
// If the date is invalid, return null
return null;
}

function getMonthsDifference(date1, date2) {
    // Parse the timestamps into Date objects
    let d1 = new Date(date1);
    let d2 = new Date(date2);
    if(!isNaN(d2.getTime())){
        d2 = new Date();
    }
    // Calculate the year and month difference
    let yearDiff = d2.getFullYear() - d1.getFullYear();
    let monthDiff = d2.getMonth() - d1.getMonth();
    
    // Total months difference
    return yearDiff * 12 + monthDiff;
}