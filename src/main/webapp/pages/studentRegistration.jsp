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

/* Container for Back link and notifications */
.main-sub {
  display: flex;
  justify-content: space-between;
}

/* Back link */
.back {
  color: #007bff;
  text-decoration: none;
  font-weight: bold;
}

/* Notifications/Registrations section */
.semesters {
  margin-top: 20px;
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

/* Form elements */
label {
  font-weight: bold;
}

/* Input fields and select */
select,
input {
  margin-bottom: 15px;
  padding: 10px;
  width: 100%;
  border: 1px solid #ccc;
  border-radius: 5px;
}

/* Submit button */
button {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  font-weight: bold;
}

/* Handle cursor pointer on registration handles */
.registrationHandle {
  cursor: pointer;
}
     
    </style>
  </head>
  <body>
    <div class="main">
      <div class="container">
        <div class="main-sub row align-items-center pt-2">
        <div class="back-container">
				<a href="<%=request.getContextPath()%>/home" class="back">
	           Back
	           </a>        
	        </div>
	    
	        
          <div class="form-container mt-5">
            <h2>Student registration</h2>
            <form method="POST" id="form" action="<%=request.getContextPath()%>/student-registration">
              <label for="semester">Semester</label>
              <select
                name="semester"
                class="form-select select"
                aria-label="Default select example"
                id="semester-select"
              >
              <%
              SemesterDao semesterDao = new SemesterDao();
           	 List<Semester> semesters = semesterDao.getAllSemesters();
            		  for(Semester semester:semesters){
            			  
                          String academicYear;
                          int month = semester.getStartDate().getMonthValue();
        					Integer year = semester.getStartDate().getYear();
        					Integer previousYear = year - 1;
        					Integer nextYear = year + 1;
        					if(month > 8){
        						academicYear = year.toString() + "-" + nextYear.toString();
        					}else{
        						academicYear = previousYear.toString()+"-"+ year.toString();
        					}
              %>
              
                <option value="<%=semester.getId()%>"><%=semester.getName() %>/<%=academicYear%></option>
                <%}%>
              </select>
              <label for="student">Insert your student ID</label>
			 <input type="number" name="id"  id="studentId" placeholder="Student ID"/>
			 <label for="department">Department</label>
			 <select
                name="department"
                class="form-select select"
                id="department-select"
              >
               <option value="" disabled selected>Select a department</option>
              <%
              AcademicUnitDao academicUnitDao = new AcademicUnitDao();
              List<AcademicUnit> departments = academicUnitDao.getDepartments();
            		 for(AcademicUnit department:departments){
              %>
                <option value="<%=department.getId()%>">
                  <%=department.getName() %>
                </option>
                <%}%>
              </select>
              <button type="submit">Register</button>
            </form>
          </div>
          <div>
          </div>
              <%
	        StudentRegistrationDao studentRegistrationDao = new StudentRegistrationDao();
	        List<StudentRegistration> registrations = studentRegistrationDao.getAllRegistrations();
	        for(StudentRegistration registration:registrations){
	        %>
	        <div class="semesters"><span><%=registration.getStudent().getName() %></span>  <span class="registrationHandle"><span class="regName"><%=registration.getSemester().getName() %></span><span class="regId"><%=registration.getId() %></span>
	        </span>
	        </div>
	        <%} %>
        </div>
      </div>
    </div>
    <script>
    const regHandles = document.querySelectorAll(".registrationHandle")
    regHandles.forEach(regHandle=>{
    	regHandle.addEventListener("click",()=>{
        localStorage.setItem("registrationId",regHandle.querySelector(".regId").textContent)
        const base = location.href.split("/student-")[0]
        location.href= base + "/student-course"
        })
    })
    </script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>