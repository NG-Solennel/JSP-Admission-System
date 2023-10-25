<%@page import="net.sol.model.Semester"%>
<%@page import="net.sol.dao.SemesterDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sol.model.Learner"%>
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
    <title>Semester</title>
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
              <h2 class="">Semesters</h2>
              <small class="text-secondary"
                >Semester details.</small
              >
            </div>
            <table id="mytable" class="table align-middle mb-0 bg-white">
              <thead class="bg-light">
                <tr class="header-row">
                  <th>ID</th>
                  <th>Name</th>
           		 <th>Start Date</th>
           		 <th>End Date</th>	
           		 <th>Academic Year</th>
                </tr>
              </thead>
              <tbody>
             <%
             SemesterDao semesterDao = new SemesterDao();
             List<Semester> semesters =  semesterDao.getAllSemesters();
             for(Semester semester:semesters){
             %>
                <tr>
                  <td>
                        <p class="fw-bold fw-normal mb-1">
                        <%=semester.getId() %>
                       </p>
                  </td>
                  
                  <td>
                    <p class="fw-bold fw-normal mb-1"><%=semester.getName() %></p>
                  </td>
                  
                  
                  <td><p class="fw-bold fw-normal mb-1"><%=semester.getStartDate() %></p></td>
                  <td><p class="fw-bold fw-normal mb-1"><%=semester.getEndDate() %></p></td>
                  <%
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
                  <td><p class="fw-bold fw-normal mb-1"><%=academicYear %></p></td>
                </tr>
                <%}%>
              </tbody>
            </table>
          </div>
          <div class="form-container mt-5">
 			 <h2>Add Semester</h2>
 			 <form method="POST" action="<%=request.getContextPath()%>/semester">
 			 <label for="name">Name</label>
			  <select name="name" class="form-select select" aria-label="Default select example"> 
				 <option value="SEMESTER 1">SEMESTER 1</option>
				<option value="SEMESTER 2">SEMESTER 2</option>
				<option value="SEMESTER 3">SEMESTER 3</option>
			 </select>
			  <label for="start-date">Start Date</label>
			 <input type="date" name="start-date" />
			  <label for="end-date">End Date</label>
			 <input type="date" name="end-date" />
  			<button>Add semester</button>
 			
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