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
        margin-top:30px;
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
      .main-card{
    box-shadow: #1FFF96 0px 2px 10px;  
    width: 10vw;
    height: 5vh;
    font-size: 16px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #1FFF96;
    transition: all 0.3s ease-in;
}
.main-card:hover{
    scale: 1.1;
}
a{
text-decoration: none;
}
.table-container{
    box-shadow: #1FFF96 0px 2px 10px;
    padding:1rem;
    border-radius: 12px;
    background-color: var(--main-bg);
    height: 550px;
    overflow-y: scroll;
}


th{
    padding:1rem .5rem !important;   
   font-size: 16px;
    margin-bottom: 1rem !important;
    background-color: var(--main-bg) !important;
    color:var(--text-color) !important;
    font-weight: 600 !important;
    text-align: center;
}
.listings {
	max-width: 100px;
	font-size: 12px
}

th:last-child  {
   border-top-right-radius: 12px;
}

td{
text-align: center;
font-size: 14px
}

 th:first-child  {
   border-top-left-radius: 12px;
}

 tbody{
    background-color: var(--main-bg);
 }


/* Changing TH bottom border color*/
.table>:not(:last-child)>:last-child>* {
     border-bottom-color: var(--primary-color) !important;
    
}
.add-course {
position: absolute;
right: 200px
}
.filters{ 
display: flex;
 gap: 20px
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