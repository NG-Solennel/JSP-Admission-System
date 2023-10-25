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
            <a href="<%=request.getContextPath()%>/studentsBySemester" class="main-card">
                <span>By semester</span>
            </a>
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
              <tbody>
              <%
              List<Learner> students = new ArrayList<Learner>();
                                          StudentDao dao = new StudentDao();
                                          students = dao.getAllStudents();
                                          
                                          for (Learner student : students) {
              %>
                <tr>
                  <td>
                    <div class="d-flex align-items-center">
                      <div class="">
                        <p class="fw-bold mb-1">
                        <%=student.getId()%>
                        </p>
                      </div>
                    </div>
                  </td>
                  <td>
                    <span
                      ><a
                        class="btn avatar-button rounded-circle overflow-hidden p-0 m-0 d-inline-flex"
                        ><img
                          src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(student.getPhoto()) %>"
                          class="avatar-span border-0 d-inline-flex align-items-center justify-content-center text-white text-uppercase text-nowrap font-weight-normal"
                        >
                      </a>
                      <!----></span
                    ><%=student.getName()%>
                  </td>
                  <td>
                    <p class="fw-bold fw-normal mb-1"><%=student.getEmail()%></p>
                  </td>

               <td>
                    <p class="fw-bold fw-normal mb-1"><%=student.getProgram().getName()%></p>
                  </td>
      
                </tr>
                <%}%>
              </tbody>
            </table>

            <!-- <nav class="mt-4">
              <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                  <a class="page-link">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#">Next</a>
                </li>
              </ul>
            </nav> -->
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
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"
  ></script>


</html>