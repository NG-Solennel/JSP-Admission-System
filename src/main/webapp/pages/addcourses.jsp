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
        width: 80%;
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
        align-items: center;
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
    </style>
  </head>
  <body>
    <div class="main">
      <div class="container">
        <div class="main-sub row align-items-center pt-2">
        <div class="back-container">
				<a href="<%=request.getContextPath()%>/courses" class="back">
	           Back
	           </a>         
	        </div>
          <div class="form-container mt-5">
            <h2>Add Course</h2>
            <form method="POST" id="form">
              
              <label for="Teacher">Course Definition</label>
              <select
                name="course-definition"
                class="form-select select"
                id="course-select"
              >
              <%
              CourseDefinitionDao courseDefinitionDao = new CourseDefinitionDao();
              List<CourseDefinition> courses = courseDefinitionDao.getCourseDefinitions();
            		  for(CourseDefinition course: courses){
              %>
                <option value="<%=course.getCode()%>"><%=course.getName() %></option>
                <%}%>
              </select>
              <label for="Teacher">Teacher</label>
              <select
                name="teacher"
                class="form-select select"
                id="teacher-select"
              >
              <option value="" disabled selected>Select a teacher</option>
              <%
              TeacherDao teacherDao = new TeacherDao();
              List<Teacher> teachers = teacherDao.getAllTeachers();
            		  for(Teacher teacher: teachers){
              %>
                <option value="<%=teacher.getCode()%>-<%=teacher.getNames()%>"><%=teacher.getNames()%></option>
                <%}%>
              </select>
              <small class="error" id="teacher-error"
                >Please select a teacher</small>
              <ul id="selectedteachers"></ul>
              <label for="department">Department</label>
              <select
                name="department-select"
                class="form-select select"
                id="department-select"
              >
               <option value="" disabled selected>Select a department</option>
              <%
              AcademicUnitDao academicUnitDao = new AcademicUnitDao();
              List<AcademicUnit> departments = academicUnitDao.getDepartments();
            		 for(AcademicUnit department:departments){
              %>
                <option value="<%=department.getId()%>-<%=department.getName()%>">
                  <%=department.getName() %>
                </option>
                <%}%>
              </select>
              <small class="error" id="department-error"
                >Please select a department</small>
              <ul id="selecteddepartments"></ul>
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
              <label for="credits">Number of credits</label>
			 <input type="number" name="credits" value="3" min="1" max="5" id="credits"/>
              <button type="submit">Add Course</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script>
      const teachers = [];
      const departments = []
      const teacherSelect = document.getElementById("teacher-select");
      const departmentSelect = document.getElementById("department-select");
      const selectedTeachers = document.getElementById("selectedteachers");
      const semesterSelect = document.getElementById("semester-select")
      const courseSelect = document.getElementById("course-select")
      const selectedDepartments = document.getElementById("selecteddepartments");
      const selectedTeachersOptions = document.getElementsByClassName("selectedoption");
      const teacherError = document.getElementById("teacher-error")
      const departmentError = document.getElementById("department-error")
      const form = document.getElementById("form")
      teacherSelect.addEventListener("input", () => {
        if (!teachers.includes(teacherSelect.value.split("-")[0])) {
          teachers.push({
            id: teacherSelect.value.split("-")[0],
            name: teacherSelect.value.split("-")[1],
          });
          const li = document.createElement("li");
          li.textContent = teacherSelect.value.split("-")[1];
          li.addEventListener("click",()=>{
            li.style.display = "none"
            const newArray =  teachers.filter(t=>t.name!== li.textContent)
            teachers = newArray
          })
          selectedTeachers.append(li);
        }
      });
      departmentSelect.addEventListener("input", () => {
        if (!departments.includes(departmentSelect.value.split("-")[0])) {
          departments.push({
            id: departmentSelect.value.split("-")[0],
            name: departmentSelect.value.split("-")[1],
          });
          const li = document.createElement("li");
          li.textContent = departmentSelect.value.split("-")[1];
          li.addEventListener("click",()=>{
            li.style.display = "none"
            const newArray =  departments.filter(t=>t.name!== li.textContent)
            departments = newArray
          })
          selectedDepartments.append(li);
        }
      });

      form.addEventListener("submit",(e)=>{
        e.preventDefault();
        
        const data = {
        		courseDefinitionId: courseSelect.value,
        		credits: document.getElementById("credits").value,
        		semesterId: semesterSelect.value,
        		teacherArray: teachers,
        		departmentArray: departments
        	}
        
        if(teachers.length === 0){
          teacherError.style.display = "block"
        }else{
          teacherError.style.display = "none"
        }
        if(departments.length === 0) {
          departmentError.style.display = "block"
        }else{
          departmentError.style.display = "none"
        }
        console.log(teachers)
        console.log(departments)
        if(teachers.length !== 0 && departments.length !== 0){        	
        fetch("addcourses",{
        	method: "POST",
        	body: JSON.stringify({
        		courseDefinitionId: courseSelect.value,
        		credits: document.getElementById("credits").value,
        		semesterId: semesterSelect.value,
        		teacherArray: teachers,
        		departmentArray: departments
        	})
        })
        }
      })

    </script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>