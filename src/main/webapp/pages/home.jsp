<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
/* Style the <html> and <body> elements */
html, body {
    height: 100%;
}

/* Center the content vertically and horizontally */
body {
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Style the title text */
.title {
    font-size: 24px;
    font-weight: bold;
}

/* Style the header background */
header {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
}

/* Style the main section background */
main {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

/* Style the section containing main links */
.menus {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 20px
}

/* Style the links within .main-card */
.main-card a {
    text-decoration: none;
    color: #333;
}

/* Hover effect for links */
.main-card a:hover {
    color: #007bff;
}

/* Style the "Logout" link differently */
.logout a {
    background-color: #ff5555;
    color: #fff;
}

/* Add margin to the "Logout" link */
.logout a {
    margin-top: 10px;
}

/* Style the <span> elements within .main-card */
.main-card span {
    display: block;
    margin-top: 10px;
    font-weight: bold;
}

/* Center the text within .main-card */
.main-card a, .logout a {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100%;
}

/* Style links in the footer */
footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
}

</style>
</head>
<body>
    <main>
    <h1>AUCA REGISTRATION</h1>
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