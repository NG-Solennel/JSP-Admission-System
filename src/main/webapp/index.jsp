<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login || Signup</title>
 <link rel="stylesheet" href="css/signin.css" />
</head>
<body>
<div class="container">
    <div class="form-container" id="login-form">
      <h1>Login</h1>
      <form action="<%=request.getContextPath()%>/login" method="post">
       <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Login</button>
      </form>
      <p>Don't have an account? <a href="#" id="signup-link">Sign up</a></p>
    </div>

    <div class="form-container" id="signup-form" style="display: none;">
      <h1>Sign Up</h1>
      <form action="<%=request.getContextPath()%>/register" method="post">
        <label for="username">Names</label>
        <input type="text" id="names" name="names" required>
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Sign Up</button>
      </form>
      <p>Already have an account? <a href="pages/form.jsp" id="login-link">Login</a></p>
    </div>
  </div>
  <script src="js/signin.js"></script>
</body>
</html>