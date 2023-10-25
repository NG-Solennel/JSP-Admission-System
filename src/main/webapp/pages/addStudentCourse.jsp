<%@page import="net.sol.model.StudentRegistration"%>
<%@page import="net.sol.dao.StudentRegistrationDao"%>
<%@page import="net.sol.model.Semester"%>
<%@page import="net.sol.dao.SemesterDao"%>
<%@page import="net.sol.model.AcademicUnit"%>
<%@page import="net.sol.dao.AcademicUnitDao"%>
<%@page import="net.sol.model.Teacher"%>
<%@page import="net.sol.dao.TeacherDao"%>
<%@page import="net.sol.model.CourseDefinition"%>
<%@page import="java.util.List"%>
<%@page import="net.sol.dao.CourseDefinitionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Course</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <!-- //Bootstrap Icons -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"
    />
    <!-- fonts -->
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600&family=Poppins:ital,wght@0,100;0,200;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap");
    </style>
    <style>
     /* Reset some default browser styles */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* Set a background color for the entire page */
body {
  font-family: 'Open Sans', sans-serif;
  background-color: #f2f2f2;
}

/* Main container */
.main {
  background-color: #f2f2f2;
  padding: 20px;
}

/* Container for Back link */
.back-container {
  display: flex;
  justify-content: space-between;
}

/* Back link */
.back {
  color: #007bff;
  text-decoration: none;
  font-weight: bold;
}

/* Form container */
.form-container {
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  margin-top: 20px;
}

/* Form title */
h2 {
  font-size: 24px;
  margin-bottom: 20px;
}

/* Form labels */
label {
  font-weight: bold;
}

/* Form selects and inputs */
.select, #credits {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

/* Add Student Course button */
button {
  color: #fff;
  background-color: #007bff;
  text-decoration: none;
  font-weight: bold;
  border: none;
  border-radius: 5px;
  padding: 10px 15px;
  cursor: pointer;
  display: block;
  margin-top: 20px;
}

/* Add Student Course button hover effect */
button:hover {
  background-color: #0056b3;
}
     
    </style>
  </head>
  <body>
    <div class="main">
      <div class="container">
        <div class="main-sub row align-items-center pt-2">
        <div class="back-container">
				<a href="<%=request.getContextPath()%>/student-course" class="back">
	           Back
	           </a>         
	        </div>
          <div class="form-container mt-5">
            <h2>Add Course</h2>
            <form method="POST" id="form" action="<%=request.getContextPath()%>/add-student-course">
              
              <label for="Teacher">Select course</label>
              <select
                name="courses"
                class="form-select select"
                id="courses-select"
              >
             
              </select>
             <input type="hidden" name="regId" id="regId"/>
              <label for="credits">Number of credits</label>
			 <input type="number" name="credits" value="3" min="1" max="5" id="credits"/>
              <button type="submit">Add Student Course</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script>
    const courseSelect = document.getElementById("courses-select")
    const regIdInput = document.getElementById("regId")
		window.addEventListener("load",()=>{
		const registrationId = localStorage.getItem("registrationId")
				regIdInput.value =  registrationId 
				fetch("getCoursesBySemester?regId=" + registrationId).then(res=>res.json()).then(res=>{
					res.forEach(course=>{
					const option = document.createElement("option")
					option.value = course.id
					option.textContent = course.courseDefinition.name
					courseSelect.append(option)
					})
				}).then(()=>{
					if(location.href.includes("?")){						
					location.href = location.href.split("?")[0]
					}else{
						return
					}
				})	
				
		})
		
	function getCookie(name) {
    let cookies = document.cookie.split('; ');
    for (var i = 0; i < cookies.length; i++) {
        let cookie = cookies[i].split('=');
        if (decodeURIComponent(cookie[0]) === name) {
            return decodeURIComponent(cookie[1]);
        }
    }
    return null;
}
    </script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>