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

/* Container for Back link and filters */
.main-sub {
  display: flex;
  justify-content: space-between;
}

/* Back link */
.back {
  color: #007bff;
  text-decoration: none;
  margin-right: 20px;
  font-weight: bold;
}

/* Filters section */
.filters {
  display: flex;
  align-items: center;
}

/* Style the filter links */
.main-card {
  margin-right: 10px;
  text-decoration: none;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px 20px;
  color: #333;
  font-weight: bold;
  transition: background-color 0.3s ease;
}

.main-card:hover {
  background-color: #f2f2f2;
}

/* Table container */
.table-container {
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  margin-top: 20px;
}

/* Table header row */
.header-row {
  background-color: #f8f9fa;
}

/* Table cell styles */
td {
  padding: 10px;
  vertical-align: middle;
}

/* Student avatar */
.avatar-button {
  border: none;
  background-color: transparent;
}

.avatar-span {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #007bff;
}

/* Table pagination (if needed) */
.pagination {
  margin-top: 20px;
  justify-content: center;
}
	
  </style></head>
<body>
<div class="main">
      <div class="container">
        <div class="main-sub row align-items-center pt-2">
	        <div class="back-container">
				<a href="<%=request.getContextPath()%>/home" class="back">
	           Back
	           </a>         
	    	<a href="<%=request.getContextPath()%>/addcourses" class="main-card add-course">
                <span>Add course</span>
            </a>
            <div class="filters">
            <a href="<%=request.getContextPath()%>/coursesByDepartment" class="main-card">
                <span>By department</span>
            </a>
       
            </div>
	    	</div>
            <div class="table-container mt-5">
            <div class="mb-2">
              <h2 class="">Courses</h2>
              <small class="text-secondary"
                >View all added courses.</small
              >
            </div>
            <table id="mytable" class="table align-middle mb-0 bg-white">
              <thead class="bg-light">
                <tr class="header-row">
                  <th>ID</th>
                  <th>Name</th>
                  <th>Semester</th>
                  <th>Departments</th>
                  <th>Tutors</th>
                </tr>
              </thead>
              <tbody>
             <%
             CourseDao courseDao = new CourseDao();
             List<Course> courses = courseDao.getCourses();
             for(Course course:courses){
             %>
                <tr>
                  <td>        
                  <%= course.getId() %>
                  </td>
                  <td>
                    <%= course.getCourseDefinition().getName() %>
                  </td>
                  
                  
                  <td><%= course.getSemester().getName() %></td>
                  <%
                  List<AcademicUnit> departments = course.getDepartments();
                  StringBuilder stringBuilder = new StringBuilder();

                  for (AcademicUnit department : departments) {
                      if (stringBuilder.length() > 0) {
                          stringBuilder.append(",");
                      }
                      stringBuilder.append(department.getName());
                  }
                  %>
                  <td class="listings"><%= stringBuilder.toString() %></td>
                   <%
                  List<Teacher> tutors = course.getTutors();
                  StringBuilder tutorStr = new StringBuilder();

                  for (Teacher tutor : tutors) {
                      if (tutorStr.length() > 0) {
                          tutorStr.append(" && ");
                      }
                      tutorStr.append(tutor.getNames());
                  }
                  %>
                  <td class="listing"><%=tutorStr.toString() %></td>
                </tr>
                <%} %>
              </tbody>
            </table>
          </div>
	  </div>
	</div>
</div>
</body>
</html>