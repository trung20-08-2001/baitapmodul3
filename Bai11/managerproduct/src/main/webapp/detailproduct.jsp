<%--
  Created by IntelliJ IDEA.
  User: trung
  Date: 6/26/2023
  Time: 11:04 AM
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
    <table class="table">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Image</th>
            <th>Producing Country</th>
        </tr>
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()} VND</td>
            <td><img src="${product.getImg()}" alt="Load ..." width="100px" height="100px"></td>
            <td>${product.getWhereProduction()}</td>
        </tr>
    </table>
</div>
</body>
</html>
