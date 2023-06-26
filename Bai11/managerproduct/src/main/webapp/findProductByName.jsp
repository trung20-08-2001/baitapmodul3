<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: trung
  Date: 6/26/2023
  Time: 11:28 AM
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
    <h2 class="text-center text-primary">Danh sách sản phẩm có tên là ${nameProduct}</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Img</th>
            <th>Edit</th>
            <th>Delete</th>
            <th>Detail</th>
        </tr>
        <c:forEach items="${listProductSameName}" var="product">
        <tr>
            <td>${product.getName()}</td>
            <td><img src="${product.getImg()}" alt="Load..." width="100px" height="100px"></td>
            <td><a href="/editproduct.jsp?id=${product.getId()}" type="button" class="btn btn-success">Edit</a></td>
            <td><a href="/deleteProduct?id=${product.getId()}" type="button" class="btn btn-danger">Delete</a>
            <td><a href="/displayDetailProduct?id=${product.getId()}" type="button" class="btn btn-primary">Detail</a>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
