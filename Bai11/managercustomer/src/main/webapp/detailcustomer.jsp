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
        <th>Email</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    <tr>
        <th>${customer.getId()}</th>
        <th>${customer.getName()}</th>
        <th>${customer.getEmail()}</th>
        <th>${customer.getAddress()}</th>
        <th><img src="${customer.getImg()}" alt="Load..." style=" width: 100px;height:100px"></th>
    </tr>
</table>
</div>
</body>
</html>
