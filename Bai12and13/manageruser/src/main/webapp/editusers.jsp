<%--
  Created by IntelliJ IDEA.
  User: trung
  Date: 6/26/2023
  Time: 5:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
  <h2>Sửa thông tin người dùng</h2>
  <form action="/editUsers" method="get">
    <div class="form-group d-none">
      <label >ID</label>
      <input type="text" class="form-control" placeholder="Enter name" name="id" value="${param.id}">
    </div>
    <div class="form-group">
      <label >Name</label>
      <input type="text" class="form-control" placeholder="Enter name" name="name" required>
    </div>
    <div class="form-group">
      <label >Email</label>
      <input type="text" class="form-control" placeholder="Enter email" name="email" required>
    </div>
    <div class="form-group">
      <label >Country</label>
      <input type="text" class="form-control" placeholder="Enter country" name="country" required>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>
</body>
</html>
