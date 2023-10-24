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
        <div>Academic Unit</div>
    </header>
    <main>
        <section class="menus">
            <a href="<%=request.getContextPath()%>/program" class="main-card">
                <span>Program</span>
            </a>
            <a href="<%=request.getContextPath()%>/faculty" class="main-card">
                <span>Faculty</span>
            </a>
            <a href="<%=request.getContextPath()%>/department" class="main-card">
                <span>Department</span>
            </a>
        </section>
            <a href="<%=request.getContextPath()%>/home" class="main-card logout">
                <span>Back</span>
            </a>
    </main>
</body>
</html>