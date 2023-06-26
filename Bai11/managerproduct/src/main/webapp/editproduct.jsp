<%--
  Created by IntelliJ IDEA.
  User: trung
  Date: 6/26/2023
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
  <h2>Sửa thông tin sản phẩm</h2>
  <form action="/editProduct" method="get">
    <c:set var="id" value="${param.id}"/>
    <input type="text" class="form-control d-none" placeholder="Enter id" name="id" value="${id}">
    <div class="form-group">
      <label>Name</label>
      <input type="text" class="form-control" placeholder="Enter name" name="name" required>
    </div>
    <div class="form-group">
      <label>Price:</label>
      <input type="text" class="form-control" placeholder="Enter price" name="price" required>
    </div>
    <div class="form-group">
      <label>Link image:</label>
      <input type="text" class="form-control" placeholder="Enter link image" name="img" required>
    </div>
    <div class="form-group">
      <label>Producing Country</label>
      <input type="text" class="form-control" placeholder="Enter producing country" name="producingCountry" required>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>
</body>
</html>

