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
    height: 640px;
    overflow-y: scroll;
    width: 630px;
    margin-top: -40px
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

/* //Removes border from last table row */

 

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

.main-sub{
display: flex;
justify-content: space-between;
align-items: center
}

.form-container{
	box-shadow: #1FFF96 0px 2px 10px;
    padding: 50px 30px;
    border-radius: 12px;
    background-color: var(--main-bg);
    height: 550px;
    overflow-y: scroll;
    width: 550px;
    }
input,textarea {
  width: 100%;
  padding: 0.5rem;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  background: #3b3b3b;
  transition: border 0.15s ease-in-out;
  margin-top: 10px
}
input:focus,textarea:focus {
  border: none;
  outline: none;
  box-shadow: #1FFF96 0px 2px 10px;
}

form label{
margin-top: 20px
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
  margin-top: 30px
}
button:hover {
  background-color: #019751;
}
button:focus {
  border: none;
  box-shadow: #1FFF96 0px 2px 10px;
}

.form-select{
background: #3b3b3b;
color: #1FFF96;
border: none;
  margin: 10px 0;
}

.form-select:focus {
	box-shadow: #1FFF96 0px 2px 10px;
	border: none
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