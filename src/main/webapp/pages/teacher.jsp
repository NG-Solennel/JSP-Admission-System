<%@page import="net.sol.model.Teacher"%>
<%@page import="net.sol.dao.TeacherDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- //Bootstrap CDN -->
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
    <title>Teachers</title>
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
          <div class="table-container">
            <div class="mb-2">
              <h2 class="">Teachers</h2>
              <small class="text-secondary"
                >View teachers list.</small
              >
            </div>
            <table id="mytable" class="table align-middle mb-0 bg-white">
              <thead class="bg-light">
                <tr class="header-row">
                  <th>CODE</th>
                  <th>Name</th>
           		 <th>Qualification</th>	
                </tr>
              </thead>
              <tbody>
             <%
             TeacherDao teacherDao = new TeacherDao();
             List<Teacher> teachers =  teacherDao.getAllTeachers();
             for(Teacher teacher:teachers){
             %>
                <tr>
                  <td>
                        <p class="fw-bold fw-normal mb-1">
                        <%=teacher.getCode() %>
                       </p>
                  </td>
                  
                  <td>
                    <p class="fw-bold fw-normal mb-1"><%=teacher.getNames() %></p>
                  </td>
                  
                  
                  <td><p class="fw-bold fw-normal mb-1"><%=teacher.getQualification() %></p></td>
                  
                </tr>
                <%}%>
              </tbody>
            </table>
          </div>
          <div class="form-container mt-5">
 			 <h2>Add Teacher</h2>
 			 <form method="POST" action="<%=request.getContextPath()%>/teacher">
 			 <label for="code">Code</label>
			 <input type="text" name="code" />
			  <label for="name">Name</label>
			 <input type="text" name="name" />
			   <label for="qualification">Qualification</label>
			 <select name="qualification" class="form-select select" aria-label="Default select example">
				  <option selected value="MASTER">MASTER</option>
				  <option value="PHD">PHD</option>
				  <option value="PROFESSOR">PROFESSOR</option>
			 </select>
  			<button>Add Teacher</button>
 			
 			 </form>
          </div>
        </div>
      </div>
    </div>

  </body>
 
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"
  ></script>


</html>