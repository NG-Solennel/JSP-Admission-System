<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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