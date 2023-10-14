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
}
.menus{
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    width: 50%;
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
            <a href="<%=request.getContextPath()%>/applications" class="main-card">
                <span>View applications</span>
            </a>
            <a href="<%=request.getContextPath()%>/submit-form" class="main-card">
                <span>Application form</span>
            </a>
            <a href="<%=request.getContextPath()%>/courses" class="main-card">
                <span>Courses</span>
            </a>
            <a href="<%=request.getContextPath()%>/logout" class="main-card">
                <span>Logout</span>
            </a>
        </section>
    </main>
</body>
</html>