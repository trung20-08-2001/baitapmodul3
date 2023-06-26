<%--
  Created by IntelliJ IDEA.
  User: trung
  Date: 6/25/2023
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Sửa thông tin khách hàng</h2>
    <form action="/editCustomer" method="post">
        <c:set var="id" value="${param.id}"/>
        <input type="text" class="form-control d-none" placeholder="Enter id" name="id" value="${id}">
        <div class="form-group">
            <label>Name</label>
            <input type="text" class="form-control" placeholder="Enter name" name="name" required>
        </div>
        <div class="form-group">
            <label>Email:</label>
            <input type="email" class="form-control" placeholder="Enter email" name="email" required>
        </div>
        <div class="form-group">
            <label>Address:</label>
            <input type="text" class="form-control" placeholder="Enter address" name="address" required>
        </div>
        <div class="form-group">
            <label>Link image</label>
            <input type="text" class="form-control" placeholder="Enter img link" name="img" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
