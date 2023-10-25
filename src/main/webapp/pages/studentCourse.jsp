<%@page import="net.sol.model.StudentRegistration"%>
<%@page import="net.sol.dao.StudentRegistrationDao"%>
<%@page import="net.sol.model.StudentCourse"%>
<%@page import="net.sol.dao.StudentCourseDao"%>
<%@page import="net.sol.model.Teacher"%>
<%@page import="net.sol.model.AcademicUnit"%>
<%@page import="net.sol.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="net.sol.dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Courses</title>
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

/* Container for Back link and Add Course button */
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

/* Add Course button */
.add-course {
  color: #fff;
  background-color: #007bff;
  text-decoration: none;
  font-weight: bold;
  border-radius: 5px;
  padding: 10px 15px;
}

/* Table container */
.table-container {
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  margin-top: 20px;
}

/* Table title */
h2 {
  font-size: 24px;
  margin-bottom: 20px;
}

/* Table headers */
.header-row th {
  font-weight: bold;
  text-align: left;
  padding: 10px;
}

/* Table data rows */
tbody tr {
  border-bottom: 1px solid #ddd;
}

/* Table data cells */
td {
  padding: 10px;
  text-align: left;
}

/* Cursor pointer on table rows */
tbody tr {
  cursor: pointer;
}

/* Hover effect on table rows */
tbody tr:hover {
  background-color: #f0f0f0;
}
    
    </style>
</head>
<body>
<div class="main">
      <div class="container">
        <div class="main-sub row align-items-center pt-2">
	        <div class="back-container">
				<a href="<%=request.getContextPath()%>/student-registration" class="back">
	           Back
	           </a>         
	    	<a href="<%=request.getContextPath()%>/add-student-course" class="main-card add-course">
                <span>Add course</span>
            </a>
	    	</div>
            <div class="table-container mt-5">
            <div class="mb-2">
              <h2 class="">Student Courses</h2>
              <small class="text-secondary"
                >View all added courses.</small
              >
            </div>
            <table id="mytable" class="table align-middle mb-0 bg-white">
              <thead class="bg-light">
                <tr class="header-row">
                  <th>CODE</th>
                  <th>Name</th>
                  <th>Tutors</th>
                </tr>
              </thead>
              <tbody>
            
              </tbody>
            </table>
          </div>
	  </div>
	</div>
</div>
<script>
const tbody = document.querySelector("tbody")
window.addEventListener("load",()=>{
	const registrationId = localStorage.getItem("registrationId")
	fetch("get-student-course?regId="+registrationId).then(res=>res.json()).then((res)=>{
		console.log(res)
		res.forEach(stCourse=>{
			const row = document.createElement("tr")
			const data1 = document.createElement("td")
			const data2 = document.createElement("td")
			const data3 = document.createElement("td")
			data1.textContent = stCourse.course.courseDefinition.code
			data2.textContent = stCourse.course.courseDefinition.name
			data3.textContent = stCourse.course.tutors.map(t=>t.name).join(" & ")
			row.append(data1)
			row.append(data2)
			row.append(data3)
			tbody.append(row)
		})
	})
})
</script>
</body>
</html>