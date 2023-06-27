<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: trung
  Date: 6/26/2023
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body class="container">
<h1 class="text-center text-primary">Danh sách người dùng có country là ${country}</h1>
<table class="table table-striped">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach items="${listUsers}" var="account">
    <tr>
        <td>${account.getId()}</td>
        <td>${account.getName()}</td>
        <td>${account.getEmail()}</td>
        <td>${account.getCountry()}</td>
    </tr>
    </c:forEach>
</table>

</body>
</html>
