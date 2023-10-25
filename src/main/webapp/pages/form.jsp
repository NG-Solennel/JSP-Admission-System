<%@page import="net.sol.dao.AcademicUnitDao"%>
<%@page import="net.sol.model.AcademicUnit"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admission Form</title>
    <style>
/* Reset some default browser styles */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* Set a background color for the entire page */
body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
}

/* Center the main content */
#main {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
}

/* Style the "Back" link */
.back {
  color: #007bff;
  text-decoration: none;
  margin-bottom: 20px;
}

/* Style the main title and description */
#title {
  font-size: 28px;
  font-weight: bold;
  margin-bottom: 10px;
}

.description {
  text-align: center;
  color: #555;
}

/* Style the form and form fields */
#admission-form {
  width: 100%;
  max-width: 400px;
  padding: 20px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  margin: 20px auto;
}

fieldset {
  margin: 20px 0;
}

label {
  display: block;
  font-weight: bold;
}

input[type="text"],
input[type="email"],
input[type="number"],
select,
textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

select {
  height: 40px;
}

/* Style error messages */
.small.error {
  display: none;
  color: #ff5555;
  margin-top: 5px;
}

/* Style the "Submit" button */
.btn {
  background-color: #007bff;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

/* Add a hover effect to the "Submit" button */
.btn:hover {
  background-color: #0056b3;
}

    </style>
  </head>
  <body>
    <main id="main" class="container">
        <a href="<%=request.getContextPath()%>/home" class="back">
           Back
           </a>  
           <a href="<%=request.getContextPath()%>/students" class="main-card add-student">
                <span>View Students</span>
            </a>
      <div class="row">
        <div class="col-xs-12 col-lg-offset-3 col-lg-6">
          <div class="m-b-md text-center">
            <h1 id="title">Add a student</h1>
            <p id="description" class="description" class="text-center">
              Add a new student to the university
            </p>
          </div>
          <form
            method="POST"
            action="<%=request.getContextPath()%>/submit-form"
            id="admission-form"
            name="admission-form"
            enctype="multipart/form-data"
          >
            <fieldset>
              <label for="name" id="name-label">
                Name *
                <input
                  class=""
                  type="text"
                  autocomplete="off"
                  id="name"
                  name="name"
                  placeholder="Enter your name (required)"
                />
              </label>
              <small class="error" id="name-error"
                >Please provide a name</small
              >
            </fieldset>
            <fieldset>
              <label for="email" id="email-label">
                Please provide your email *
                <input
                  class=""
                  type="email"
                  id="email"
                  name="email"
                  autocomplete="off"
                  placeholder="Enter your email (required)"
                />
              </label>
              <small class="error" id="email-error"
                >Please provide an email</small
              >
            </fieldset>
            <fieldset>
              <label for="guardian-name" id="name-label">
                Guardian Name *
                <input
                  class=""
                  type="text"
                  autocomplete="off"
                  id="guardian-name"
                  name="guardian-name"
                  placeholder="Enter your name (required)"
                />
              </label>
              <small class="error" id="guardian-name-error"
                >Please provide a guardian name</small
              >
            </fieldset>
            <fieldset>
              <label for="guardian-email" id="email-label">
                Please provide guardian email *
                <input
                  class=""
                  type="email"
                  id="guardian-email"
                  name="guardian-email"
                  autocomplete="off"
                  placeholder="Enter your guardian email (required)"
                />
              </label>
              <small class="error" id="guardian-email-error"
                >Please provide guardian email</small
              >
            </fieldset>
            <fieldset>
              <label for="number" id="number-label">
                Age *
                <input
                  class=""
                  type="number"
                  id="age"
                  name="age"
                  min="8"
                  max="112"
                  placeholder="Enter you age (required)"
                />
              </label>
              <small class="error" id="age-error"
                >Please provide your age</small
              >
            </fieldset>
            <fieldset>
              <label for="status">
                Marital Status
                <select id="status" name="status" class="m-t-xs">
                  <option value="Single">Single</option>
                  <option value="Married">Married</option>
                  <option value="Divorced">Divorced</option>
                  <option value="Widow/widower">Widow/widower</option>
                  <option value="Separated">Separated</option>
                </select>
              </label>
            </fieldset>
            <fieldset>
              <label for="program">
                Select a programme *
                <select id="program" name="program" class="m-t-xs">
                <%
                AcademicUnitDao unitDao = new AcademicUnitDao();
                List<AcademicUnit> programmes = unitDao.getProgrammes();
            		  for(AcademicUnit programme:programmes){
                %>
                  <option  class="programme" value="<%=programme.getId()%>"><%=programme.getName() %></option>
                <%}%>  
                </select>
              </label>
            </fieldset>
          
            <fieldset>
              <label for="diploma" id="diploma-label">
                Upload your diploma 
                <input
                  class=""
                  type="file"
                  id="diploma"
                  name="diploma"
                  accept=".pdf"
                />
              </label>
            </fieldset>
            <fieldset>
              <label for="photo" id="photo-label">
                Upload your profile photo 
                <input
                  class=""
                  type="file"
                  id="photo"
                  name="photo"
                  accept=".png, .jpg, .jpeg"
                />
              </label>
            </fieldset>
            <fieldset>
              <label for="admission-form-suggestions">
                Any Comments or Suggestions?
                <textarea name="admission-form-suggestions" id="admission-form-comments"></textarea>
              </label>
              <small class="error" id="desc-error"
                >Description cannot exceed 200 characters</small
              >
            </fieldset>
            <button id="submit" type="submit" class="btn">
              Submit the form
            </button>
          </form>
        </div>
      </div>
    </main>
    <script>
    const radioGroup = document.getElementsByName("admission-form-faculty");
    const emailErrorMsg = document.getElementById("email-error");
    const guardianEmailErrorMsg = document.getElementById("guardian-email-error");
    const nameErrorMsg = document.getElementById("name-error");
    const guardianNameErrorMsg = document.getElementById("guardian-name-error");
    const descErrorMsg = document.getElementById("desc-error");
    const ageErrorMsg = document.getElementById("age-error");
    const nameInput = document.getElementById("name");
    const guardianNameInput = document.getElementById("guardian-name");
    const guardianEmailInput = document.getElementById("guardian-email");
    const emailInput = document.getElementById("email");
    const ageInput = document.getElementById("age");
    const commentInput = document.getElementById("admission-form-comments");
    const programInput = document.getElementById("program");
    const statusInput = document.getElementById("status");
    const form = document.getElementById("admission-form");
    const depLabel = document.getElementById("department-label");
    const programOptions = document.getElementsByClassName("programme")
    const facultySelect =  document.getElementById("admission-form-faculty")
    const departmentSelect = document.getElementById("admission-form-department")
    const programSelect =   document.getElementById("program")
    // const radioInputs = document.querySelectorAll('input[name="admission-form-faculty"]');
	
    let checkedValue = "";

    form.addEventListener("submit", (e) => {
      const nameOk = checkName(nameInput.value, nameErrorMsg);
      const emailOk = checkEmail(emailInput.value, emailErrorMsg);
      const ageOk = checkAge(ageInput.value);
      const descOk = checkDesc(commentInput.value);
      const guardianEmailOk = checkEmail(
        guardianEmailInput.value,
        guardianEmailErrorMsg
      );
      const guardianNameOk = checkName(
        guardianNameInput.value,
        guardianNameErrorMsg
      );
      const selectedDep = depSelect.options[depSelect.selectedIndex].text;
      for (let i = 0; i < radioGroup.length; i++) {
        if (radioGroup[i].checked) {
          checkedValue = radioGroup[i].value;
          break;
        }
      }

      if (
        nameOk &&
        emailOk &&
        ageOk &&
        descOk &&
        guardianEmailOk &&
        guardianNameOk
      ) {
        const data = {
          name: nameInput.value,
          email: emailInput.value,
          guardianName: guardianNameInput.value,
          guardianEmail: guardianEmailInput.value,
          age: ageInput.value,
          faculty: checkedValue,
          department: selectedDep,
          program: programInput.value,
          status: statusInput.value,
          suggestions: commentInput.value
        };
        console.log(data)
        const formData = new FormData()
        formData.append("name",data.name)
        formData.append("email",data.email)
        formData.append("guardianName",data.guardianName)
        formData.append("guardianEmail",data.guardianEmail)
        formData.append("age",data.age)
        formData.append("faculty",data.faculty)
        formData.append("department",data.department)
        formData.append("status",data.status)
        formData.append("program",data.program)
        formData.append("suggestions",data.suggestions)
      }else{
    	   e.preventDefault();
      }
    });

    nameInput.addEventListener("input", () => {
      checkName(nameInput.value,nameErrorMsg);
    });
    guardianNameInput.addEventListener("input", () => {
      checkName(guardianNameInput.value,guardianNameErrorMsg);
    });
    emailInput.addEventListener("input", () => {
      checkEmail(emailInput.value,emailErrorMsg);
    });
    guardianEmailInput.addEventListener("input", () => {
      checkEmail(guardianEmailInput.value,guardianEmailErrorMsg);
    });
    ageInput.addEventListener("input", () => {
      checkAge(ageInput.value);
    });

   programSelect.addEventListener("input",()=>{
	   const params = new URLSearchParams()
	   let reponse;
	   params.append("unit","FACULTY")
	   params.append("id", programSelect.value)
    fetch("AcademicUnit?" + params).then(res=>res.json()).then(res=>{
    	facultySelect.innerHTML = ""
    	res.forEach(faculty=>{
    	const option = document.createElement("option")
		option.value = faculty.id
		option.textContent = faculty.name
		facultySelect.append(option)
		reponse =res
		return res
    	})
    }).then(res=>{    	
    const params1 = new URLSearchParams()
  	   params1.append("unit","DEPARTMENT")
  	   params1.append("id", reponse[0].id)
  	    fetch("AcademicUnit?" + params1).then(res=>res.json()).then(res=>{
  	    	departmentSelect.innerHTML = ""
  	    	res.forEach(department=>{
  	    	const option = document.createElement("option")
  	   		option.value = department.id
  	   		option.textContent = department.name
  	   		departmentSelect.append(option)
  	    	})
  	    })
    })
    })
    facultySelect.addEventListener("input",()=>{
    	const params = new URLSearchParams()
  	   params.append("unit","DEPARTMENT")
  	   params.append("id", facultySelect.value)
  	    fetch("AcademicUnit?" + params).then(res=>res.json()).then(res=>{
  	    	departmentSelect.innerHTML = ""
  	    	res.forEach(department=>{
  	    	const option = document.createElement("option")
  	   		option.value = department.id
  	   		option.textContent = department.name
  	   		departmentSelect.append(option)
  	    	})
  	    })
     })

    const checkName = (value, element) => {
      let format = /^[a-z ,.'-]+$/gi;
      if (value === "" || value === null) {
        element.style.display = "block";
        element.innerText = "Please provide a name!";
      } else if (isNaN(value) === false) {
        element.style.display = "block";
        element.innerText = "Name cannot be a number";
      } else if (!value.match(format)) {
        element.style.display = "block";
        element.innerText = "Name is invalid";
      } else if (value.length < 3) {
        element.style.display = "block";
        element.innerText = "Name can not be less than 3 characters";
      } else if (value.length > 45) {
        element.style.display = "block";
        element.innerText = "Name can not exceed 45 characters";
      } else if (value.match(format)) {
        element.style.display = "none";
        return true;
      }
    };

    const checkDesc = (value) => {
      if (value.length < 3 && value.length > 0) {
        descErrorMsg.style.display = "block";
        descErrorMsg.innerText = "Description can not be less than 3 characters";
        return false;
      } else if (value.length > 200) {
        descErrorMsg.style.display = "block";
        descErrorMsg.innerText = "Description cannot exceed 200 characters";
        return false;
      } else if (value === "" || value === null) {
        return true;
      }
      return true;
    };

    const checkEmail = (value, errorElement) => {
      let format = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
      if (value === "" || value === null) {
        errorElement.style.display = "block";
      } else if (isNaN(value) === false) {
        errorElement.style.display = "block";
        errorElement.innerText = "Email cannot be a number";
      } else if (!value.match(format)) {
        errorElement.style.display = "block";
        errorElement.innerText = "Email is invalid";
      } else if (value.match(format)) {
        errorElement.style.display = "none";
        return true;
      }
    };

    const checkAge = (value) => {
      if (value === "" || value === null) {
        ageErrorMsg.style.display = "block";
      } else {
        ageErrorMsg.style.display = "none";
        return true;
      }
    };


    </script>
  </body>
</html>
