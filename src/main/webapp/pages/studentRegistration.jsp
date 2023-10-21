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
      :root {
        --text-color: #1fff96;
        --success-text: #0d6832;
        --primary-text: #273e63;
        --warning-text: #73510d;
        --danger-text: #a61001;
        --success-bg: #d6f0e0;
        --primary-bg: #dfe7f6;
        --warning-bg: #fbf0da;
        --danger-bg: #ffebe9;
        --primary-btn-text: #3b71ca;
        --main-bg: #222;
        --secondary-bg: #555;
        --primary-color: #1fff96;
      }

      * {
        color: var(--text-color);
        font-family: "Open Sans", sans-serif;
        font-family: "Poppins", sans-serif;
      }

body {
        background-color: var(--main-bg) !important;
      }

      .main {
        background-color: var(--main-bg) !important;
        height: 130vh;
      }
      .back {
        padding: 5px 20px;
        box-shadow: #1fff96 0px 2px 10px;
        max-width: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
        transition: all 0.3s ease-in;
        text-decoration: none;
        color: #1fff96;
        position: absolute;
        right: 80px;
      }
      .back:hover {
        scale: 1.1;
        color: #1fff96;
      }
      .back-container {
        width: 100%;
        position: relative;
        margin: 30px 0;
      }

      .form-container {
        box-shadow: #1fff96 0px 2px 10px;
        padding: 50px 30px;
        border-radius: 12px;
        background-color: var(--main-bg);
        height: 100%;
        overflow-y: scroll;
        width: 70%;
      }
      input,
      textarea {
        width: 100%;
        padding: 0.5rem;
        border: none;
        border-radius: 4px;
        font-size: 1rem;
        background: #3b3b3b;
        transition: border 0.15s ease-in-out;
        margin-top: 10px;
        display: block;
      }
      input:focus,
      textarea:focus {
        border: none;
        outline: none;
        box-shadow: #1fff96 0px 2px 10px;
      }

      form label {
        margin-top: 20px;
      }
      button {
        width: 100%;
        padding: 0.5rem;
        border-radius: 4px;
        outline: none;
        border: none;
        font-size: 1rem;
        background-color: #016436;
        color: white;
        cursor: pointer;
        margin-top: 30px;
      }
      button:hover {
        background-color: #019751;
      }
      button:focus {
        border: none;
        box-shadow: #1fff96 0px 2px 10px;
      }
      ::-webkit-scrollbar {
        width: 6px;
      }
      ::-webkit-scrollbar:horizontal {
        height: 6px;
      }
      ::-webkit-scrollbar-track,
      ::-webkit-scrollbar-corner {
        background: transparent;
        border-radius: 10px;
      }

      ::-webkit-scrollbar-thumb {
        border-radius: 10px;
        background: #00b862;
      }
      ::-webkit-scrollbar-thumb:hover {
        background: #1fff96;
      }
      .form-select {
        background: #3b3b3b;
        color: #1fff96;
        border: none;
        margin: 10px 0;
      }

      .form-select:focus {
        box-shadow: #1fff96 0px 2px 10px;
        border: none;
      }

      .main-sub {
        display: flex;
        justify-content: center;
        align-items: start;
        flex-direction: column
      }
      ul {
        width: 100%;
        display: flex;
        justify-content: start;
        align-items: center;
      }
      ul li {
        list-style-type: none;
        color: var(--main-bg);
        background-color: #1fff96;
        border-radius: 5px;
        padding: 4px 8px;
        margin: 0 10px;
        font-size: 13px;
      }
      .error{
        color: #f55656;
        font-weight: 600;
        display: none;
      }
          .add-student {
position: absolute;
right: 200px
}
     .main-card{
    box-shadow: #1FFF96 0px 2px 10px;  
    width: 23vw;
    height: 5vh;
    font-size: 16px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #1FFF96;
    transition: all 0.3s ease-in;
}
a{
text-decoration: none;
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
	            <a href="<%=request.getContextPath()%>/students" class="main-card add-student">
                <span>Add courses to your new semester</span>
            </a>       
	        </div>
	        <%
	        StudentRegistrationDao studentRegistrationDao = new StudentRegistrationDao();
	        List<StudentRegistration> registrations = studentRegistrationDao.getAllRegistrations();
	        for(StudentRegistration registration:registrations){
	        %>
	        <p>You have successfully been registered to <a href="<%=request.getContextPath()%>/student-course" ><%=registration.getSemester().getName() %></a></p>
	        <%} %>
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
              %>
                <option value="<%=semester.getId()%>"><%=semester.getName() %>/<%=semester.getAcademicYear()%></option>
                <%}%>
              </select>
              <label for="student">Insert your student ID</label>
			 <input type="number" name="id"  id="studentId"/>
              <button type="submit">Register</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>