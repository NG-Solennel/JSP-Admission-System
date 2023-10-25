<%@page import="net.sol.model.StudentRegistration"%>
<%@page import="net.sol.model.Semester"%>
<%@page import="net.sol.dao.SemesterDao"%>
<%@page import="net.sol.model.Learner"%>
<%@page import="net.sol.model.AcademicUnit"%>
<%@page import="net.sol.dao.AcademicUnitDao"%>
<%@page import="java.util.Base64"%>
<%@page import="net.sol.dao.StudentDao"%>
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

/* Style the filter select */
.select {
  margin-left: 10px;
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

/* Table pagination (if needed) */
.pagination {
  margin-top: 20px;
  justify-content: center;
}
 	
  </style>
    <title>Students</title>
  </head>
  <body>
    <div class="main">
      <div class="container">
        <div class="main-sub row align-items-center pt-2">
        <div class="back-container">
      <a href="<%=request.getContextPath()%>/home" class="back">
           Back
           </a>  
             <div class="filters">
             <span>Choose semester</span>
             <select
                name="semester-select"
                class="form-select select"
                id="semester-select"
              >
              <%
              SemesterDao semesterDao = new SemesterDao();
              List<Semester> semesters = semesterDao.getAllSemesters();
            		 for(Semester semester:semesters){
              %>
                <option value="<%=semester.getId()%>">
                  <%=semester.getName() %>
                </option>
                <%}%>
              </select>
            </div>   
        </div>
      <div class="table-container mt-5">
            <div class="mb-2">
              <h2 class="">Students</h2>
              <small class="text-secondary"
                >View all students.</small
              >
            </div>
            <table id="mytable" class="table align-middle mb-0 bg-white">
              <thead class="bg-light">
                <tr class="header-row">
                  <th>ID</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Program</th>
                </tr>
              </thead>
              <tbody id="table-body">
              <%
                       SemesterDao dao = new SemesterDao();
                       Semester semester = dao.getSemesterById(1);
                       List<StudentRegistration> registrations = semester.getRegistrations();
              		for (StudentRegistration registration: registrations) {
              %>
                <tr>
                  <td>
                    <div class="d-flex align-items-center">
                      <div class="">
                        <p class="fw-bold mb-1">
                        <%=registration.getStudent().getId()%>
                        </p>
                      </div>
                    </div>
                  </td>
                  <td>
                   <%=registration.getStudent().getName()%>
                  </td>
                  <td>
                    <p class="fw-bold fw-normal mb-1"><%=registration.getStudent().getEmail()%></p>
                  </td>

              
                  
                  <td>
                    <span class="badge badge-success rounded-pill d-inline"
                      ><%=registration.getStudent().getProgram().getName()%></span
                    >
                  </td>
                </tr>
                <%}%>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
$("#change-status").change(function(){
    var selectedValue=$('#change-status :selected').text(); 
    if(selectedValue === "All"){
      $('table > tbody  > tr').each(function(i) {
            $(this).show() 
      });
    }else{
      $('table > tbody  > tr > td').each(function(i) {
        if(this.dataset.label === "Status"){
          if($(this).children( 'span' ).text() != selectedValue){
            $(this).closest("tr").hide()
          }else{
            $(this).closest("tr").show()
          }

        }
      });
    }
    
  });
</script>
<script>
const select = document.getElementById("semester-select")
select.addEventListener("input",()=>{
	const param = new URLSearchParams();
	param.append("id",select.value.split("-")[0]);
	fetch("studentsBySemester?"+param,{
		method:"POST"
	}).then(res=>res.json()).then(res=>{
		console.log(res)
		const tbody = document.getElementById("table-body");
		tbody.innerHTML =""
		res.forEach(reg=>{
		const row = document.createElement('tr')
		const data1 = document.createElement("td")
		const data2 = document.createElement("td")
		const data3= document.createElement("td")
		const data4 = document.createElement("td")
		data1.textContent = reg.student.id
		data2.textContent = reg.student.name
		data3.textContent = reg.student.email
		data4.textContent = reg.student.program

		row.append(data1)
		row.append(data2)
		row.append(data3)
		row.append(data4)

		tbody.append(row)
		})
	})
})
</script>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"
  ></script>


</html>