<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
*{
    margin:0;
    padding:0;
}

body{
background-color: #222222;
color:#1FFF96;
}

a{
text-decoration: none;
}

header{
   text-align: center;
    font-size: 52px;
    padding-top: 70px;
}

main{
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative
    height: 100%
}
.logout{
position: absolute;
right: 50px;
bottom: 20px
}
.menus{
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    width: 80%;
    height: 40vh;
    margin-top: 10vh;
    align-items: center;
    justify-content: center;
}

.main-card{
    box-shadow: #1FFF96 0px 2px 10px;  
    width: 20vw;
    height: 10vh;
    font-size: 32px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #1FFF96;
    transition: all 0.3s ease-in;
}
.main-card:hover{
    scale: 1.1;
}
</style>
</head>
<body>
<header>
        <div>Main Menu</div>
    </header>
    <main>
        <section class="menus">
            <a href="<%=request.getContextPath()%>/submit-form" class="main-card">
                <span>Students</span>
            </a>
            <a href="<%=request.getContextPath()%>/student-registration" class="main-card">
                <span>Student Registration</span>
            </a>
            <a href="<%=request.getContextPath()%>/allcourses" class="main-card">
                <span>Course Definition</span>
            </a>
            <a href="<%=request.getContextPath()%>/add-academicUnit" class="main-card">
                <span>Academic Unit</span>
            </a>
            <a href="<%=request.getContextPath()%>/teacher" class="main-card">
                <span>Teachers</span>
            </a>
             <a href="<%=request.getContextPath()%>/semester" class="main-card">
                <span>Semesters</span>
            </a>
            <a href="<%=request.getContextPath()%>/courses" class="main-card">
                <span>Courses</span>
            </a>
        </section>
            <a href="<%=request.getContextPath()%>/logout" class="main-card logout">
                <span>Logout</span>
            </a>
    </main>
</body>
</html>