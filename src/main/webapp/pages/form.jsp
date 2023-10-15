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
    @charset "UTF-8";
.m-b-xs {
  margin-bottom: 2%;
}

.m-b-md {
  margin-bottom: 10%;
}

.m-t-xs {
  margin-top: 2%;
}

.m-t-sm {
  margin-top: 5%;
}

* {
  outline: 0 !important;
}

body {
  padding: 2% 0;
  background-color: #222222;
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  width: 60%;
}

h1 {
  font-family: "Roboto", sans-serif;
  font-size: 2.2em;
  font-weight: 300;
  color: #1FFF96;
  text-transform: uppercase;
}

p {
  font-family: "Roboto", sans-serif;
  font-size: 1.1em;
  font-weight: 300;
  color: #fff;
}

a {
  color: #fff;
}
a:hover {
  text-decoration: none;
  color: #fff;
}

#admission-form label,
#admission-form .labels {
  display: block;
  margin-bottom: 2%;
  font-family: "Roboto", sans-serif;
  font-size: 1.1em;
  font-weight: 300;
  color: #fff;
  letter-spacing: 0.5px;
}
#admission-form input::-webkit-input-placeholder {
  color: transparent !important;
}
#admission-form input::-moz-placeholder {
  color: transparent !important;
}
#admission-form input:-ms-input-placeholder {
  color: transparent !important;
}
#admission-form input:-moz-placeholder {
  color: transparent !important;
}
#admission-form input,
#admission-form select {
  display: block;
  width: 100%;
  overflow: hidden;
  outline: none;
  border: 2px solid #333;
}
#admission-form input {
  margin-top: 1.5%;
  padding: 0 0 5px 0;
  background: transparent;
  border: none;
  outline: none;
  border-bottom: 2px solid #fff;
  font-size: 1.1em;
  font-weight: 300;
  color: #1FFF96;
}
#admission-form input:focus {
  border-color: #1FFF96;
}
#admission-form [type="checkbox"],
#admission-form [type="radio"] {
  display: inline-block;
  width: auto;
  margin: 0px 10px 0 0;
}
#admission-form [type="checkbox"],
#admission-form [type="radio"] {
  display: inline-block;
  margin: 0 10px 0 0 !important;
  position: relative;
  top: 5px;
  right: 0;
  bottom: 0;
  left: 0;
  -webkit-appearance: none;
  -moz-appearance: none;
  -o-appearance: none;
  appearance: none;
  height: 23px;
  width: 23px;
  transition: all 0.15s ease-out 0s;
  background: #222222;
  color: #fff;
  cursor: pointer;
  outline: none;
  z-index: 1000;
  border: 1px solid #fff;
}
#admission-form [type="checkbox"]:hover,
#admission-form [type="radio"]:hover {
  border-color: #1FFF96;
}
#admission-form [type="checkbox"]:checked:before,
#admission-form [type="radio"]:checked:before {
  display: inline-block;
  height: 21px;
  width: 21px;
  position: relative;
  left: 0;
  bottom: 0;
  content: "";
  text-align: center;
  font-family: "Glyphicons Halflings";
  line-height: 20px;
  font-size: 15px;
  color: #1FFF96;
}
#admission-form [type="checkbox"]:focus,
#admission-form [type="radio"]:focus {
  outline: none;
  border-color: #fff;
}
#admission-form [type="radio"] {
  border-radius: 50%;
}
#admission-form [type="radio"]:after {
  border-radius: 50%;
}
#admission-form [type="number"] {
  width: 45px;
}
#admission-form [type="number"]::-webkit-inner-spin-button,
#admission-form [type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  margin: 0;
}
#admission-form select {
  height: 40px;
  padding-left: 5px;
  background-color: #222222;
  border: 2px solid #fff;
  color: #1FFF96;
}
#admission-form select option {
  padding: 5px 10px;
  font-weight: 300;
  cursor: pointer;
}
#admission-form select option:hover {
  background-color: #1FFF96;
}
#admission-form textarea {
  resize: none;
  margin-top: 2%;
  padding: 10px 10px 0px 20px;
  width: 95%;
  height: 90px;
  color: #1FFF96;
  background-color: #222222;
  border: 2px solid #fff;
}
#admission-form .btn {
  display: inline-block;
  position: relative;
  width: 100%;
  margin: 3% 0 0 0;
  height: 45px;
  text-transform: uppercase;
  text-decoration: none;
  cursor: pointer;
  border: 3px solid #1FFF96;
  border-radius: 0;
  font-weight: 500;
  font-size: 1.2em;
  color: #1FFF96;
  text-align: center;
  background: none;
  transition: color 0.25s ease;
}
#admission-form .btn:after {
  position: absolute;
  content: "";
  top: 0;
  left: 0;
  width: 0;
  height: 100%;
  background-color: #1FFF96;
  transform-origin: left;
  transition: width 0.5s ease;
  z-index: -1;
}
#admission-form .btn:hover {
  color: #222222;
}
#admission-form .btn:hover:after {
  width: 100%;
}
#admission-form fieldset {
  margin: 5% 0 0 0;
}
fieldset .radio-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.copyright {
  text-align: center;
  font-size: 10px;
  color: #fff;
}
.copyright i {
  color: #ef5350;
}

fieldset small {
  color: #f55656;
  font-weight: 600;
  display: none;
}
.back{
    padding: 5px 20px;
    box-shadow: #1FFF96 0px 2px 10px;
    max-width: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: all 0.3s ease-in;
    text-decoration: none;
    color: #1FFF96;
    position: absolute;
    right: 80px;
}
.back:hover{
    scale: 1.1;
    color: #1FFF96
}
.back-container{
	width: 100%;
	position: relative;
	margin: 30px 0
}
@media only screen and (max-width: 600px) {
  body {
    padding: 8% 0;
  }
}
    
    </style>
  </head>
  <body>
    <main id="main" class="container">
        <a href="<%=request.getContextPath()%>/home" class="back">
           Back
           </a>  
      <div class="row">
        <div class="col-xs-12 col-lg-offset-3 col-lg-6">
          <div class="m-b-md text-center">
            <h1 id="title">Admission Form</h1>
            <p id="description" class="description" class="text-center">
              Fill in this form to join our institution
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
             
                <label for="admission-form-faculty">
                 Faculty *
                  <select
                   	id="admission-form-faculty"
                    name="admission-form-faculty"
                   class="m-t-xs"
                    onchange="fetchFaculty()"
                  >
                  <%
                  List<AcademicUnit> faculties = unitDao.getFacultiesByProgramme(1);
                		 for(AcademicUnit faculty:faculties){
                  %>
                  <option class="admission-form-faculty" value="<%=faculty.getId()%>"><%=faculty.getName() %></option>
                  <%}%>
                  </select>
                </label>
            </fieldset>
            <fieldset>
              <label for="admission-form-department" id="department-label">
                Choose Department
                <select
                  id="admission-form-department"
                  name="admission-form-department"
                  class="m-t-xs"
                >
                   <%
                  List<AcademicUnit> departments = unitDao.getDepartmentsByFaculty(3);
                		 for(AcademicUnit department:departments){
                  %>
                  <option value="<%=department.getId()%>">
                    <%=department.getName() %>
                  </option>
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
