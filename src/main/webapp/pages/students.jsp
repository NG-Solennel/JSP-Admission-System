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
  :root{
    --text-color:#1FFF96;
    --success-text:#0d6832;
    --primary-text:#273e63;
    --warning-text:#73510d;
    --danger-text: #A61001;
    --success-bg:#d6f0e0;
    --primary-bg:#dfe7f6;
    --warning-bg:#fbf0da;
    --danger-bg: #FFEBE9;
    --primary-btn-text:#3b71ca;
    --main-bg: #222;
    --secondary-bg: #555;
    --primary-color: #1FFF96
}

*{
    color:var(--text-color);
    font-family: 'Open Sans', sans-serif;
    font-family: 'Poppins', sans-serif;
}

.main{
    background-color: var(--main-bg) !important;
    height: 100vh;
    
}

tbody td{
font-size: 13px;
}

.text-primary{
    color:var(--primary-btn-text) !important;
}

.fw-bold{
    font-weight: 500 !important;
}

h2{
    font-weight: 400;
    margin-bottom: unset;
    
}

.action-icon{
    font-size: 1.08rem;
}

/* //Badge color overwirte */



.badge-success{
    color:var(--success-text) !important;
    background-color:var(--success-bg);
    border: 1px solid;
}

.badge-primary{
    color:var(--primary-text) !important;;
    background-color:var(--primary-bg);
    border: 1px solid;
}

.badge-warning{
    color:var(--warning-text) !important;;
    background-color:var(--warning-bg);
    border: 1px solid;
}

.badge-danger{
    color:var(--danger-text) !important;;
    background-color: var(--danger-bg);
    border: 1px solid;
}

.time{
  font-size:.75rem;
}


/* //Badge color overwirte end */


/* table styling */

/* primary table container  */
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
   font-size: .875rem;
    margin-bottom: 1rem !important;
    background-color: var(--main-bg) !important;
    color:var(--text-color) !important;
    font-weight: 600 !important;
    text-align: center;
}

th:last-child  {
   border-top-right-radius: 12px;
}

td{
text-align: center;
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

ul{
    margin-bottom: 0rem !important;
}

.avatar-span{
  width: 40px;
  height: 40px;
  cursor: pointer;
  background-size: cover;
  border-radius: 20px;
  object-fit: fill;
}

/* table styling end*/

/*  button styling */
.btn-link{
    font-weight: 500;
    color:var(--primary-text);
    /* border:1px solid #2c58a094 !important; */
    border-radius: 8px;
    text-decoration: underline 0.1em rgb(255, 255, 255) !important;
    text-underline-offset: 0.2em !important;
    transition: text-decoration-color 300ms, text-underline-offset 300ms !important;
}

.btn-link:hover{
  text-decoration-color:#0d6efd !important;
  text-underline-offset: 0.4em !important; 
}

.logout-btn{
    text-decoration: none;
    font-size: 1rem;
}

.page-link{
    border: unset !important;
    color:var(--primary-btn-text)
}
.back{
    padding: 5px 20px;
    box-shadow: #1FFF96 0px 2px 10px;
    max-width: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: all 0.3s ease-in;
    text-decoration: none;
    color: #1FFF96;
    position: absolute;
    right: 80px;
}
.back:hover{
    scale: 1.1;
    color: #1FFF96
}
.back-container{
	width: 100%;
	position: relative;
	margin: 30px 0
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
  background: #00B862;
}
::-webkit-scrollbar-thumb:hover {
  background: #1FFF96;
}
a{
    text-decoration: none;
    color:white
}
a:hover{
    color:white 
}
  </style>
    <title>Applications</title>
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
                  <th>Department</th>
                  <th>Faculty</th>
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
                      ></a>
                      <!----></span
                    ><%=student.getName()%>
                  </td>
                  <td>
                    <p class="fw-bold fw-normal mb-1"><%=student.getEmail()%></p>
                  </td>
                  <%
                  AcademicUnitDao academicUnitDao = new AcademicUnitDao();
                  AcademicUnit faculty = academicUnitDao.getAcademicUnitById(student.getDepartment().getParentId());
                  AcademicUnit program = academicUnitDao.getAcademicUnitById(faculty.getParentId());
                  %>
                  
                  <td><%=student.getDepartment().getName() %></td>
                  <td><%=faculty.getName()%></td>
                  
                  <td>
                    <span class="badge badge-success rounded-pill d-inline"
                      ><%=program.getName()%></span
                    >
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