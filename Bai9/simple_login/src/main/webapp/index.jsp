<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <style type="text/css">
    .login {
      height:180px; width:250px;
      margin:0;
      padding:10px;
      border:1px #CCC solid;
    }
    .login input {
      margin: 5px 2px;
    }
  </style>
</head>
<body>
<form action="/login" method="post" >
  <div class="login">
    <h2>Login</h2>
    <input type="text" name="username" size="30"  placeholder="username" />
    <input type="password" name="password" size="30" placeholder="password" />
    <input type="submit" value="Sign in"/>
  </div>
</form>
</body>
</html>