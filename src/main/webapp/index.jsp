<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login || Signup</title>
 <style>
 * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'Open Sans', sans-serif;
    background-color: #222;
  }

  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .form-container {
    width: 600px;
    margin: 0 auto;
    padding: 50px;
    background-color: #333;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    color: #fff;
  }

  h1 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 36px;
    color: #00E078;
  }

  form {
    display: flex;
    flex-direction: column;
  }

  label {
    margin-bottom: 10px;
    font-size: 18px;
  }

  input {
    padding: 12px;
    border: none;
    border-radius: 5px;
    margin-bottom: 20px;
    font-size: 16px;
    color: #fff;
    background-color: #555;
  }

  button {
    padding: 10px;
    background-color: #00E078;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.2s ease-in-out;
  }

  button:hover {
    background-color: #1FFF96;
  }

  a {
    text-decoration: none;
    color: #00E078;
    font-size: 18px;
    transition: color 0.2s ease-in-out;
  }

  a:hover {
    color: #1FFF96;
  }

  p {
    text-align: center;
    margin: 8px;
  }
 </style>
</head>
<body>
<div class="container">
    <div class="form-container" id="login-form">
      <h1>Login</h1>
      <form action="<%=request.getContextPath()%>/admission" method="post">
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
  <script>
  const loginForm = document.getElementById('login-form');
  const signupForm = document.getElementById('signup-form');
  const loginLink = document.getElementById('login-link');
  const signupLink = document.getElementById('signup-link');

  loginLink.addEventListener('click', (event) => {
    event.preventDefault();
    signupForm.style.display = 'none';
    loginForm.style.display = 'block';

    setTimeout(() => {
      signupForm.style.opacity = 0;
      loginForm.style.opacity = 1;
    }, 10);
  });

  signupLink.addEventListener('click', (event) => {
    event.preventDefault();
    loginForm.style.display = 'none';
    signupForm.style.display = 'block';

    setTimeout(() => {
      loginForm.style.opacity = 0;
      signupForm.style.opacity = 1;
    }, 10);
  });
  </script>
</body>
</html>