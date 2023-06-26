<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"></head>
<body>
<div class="container">
    <h1 class="text-center text-primary">Danh sách khách hàng</h1>
    <br>
    <div class="d-flex justify-content-center">
        <a href="/create.jsp"  class="btn btn-primary">Thêm khách hàng</a>
    </div>
    <table class="table table-striped text-center">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Age</th>
            <th>Image</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="customer" items="${customerList}">
        <tr>
            <td>${customer.getId()}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getAge()}</td>
            <td><img src="${customer.getImg()}" alt="Load..." width="100px" height="100px"></td>
            <td><a href="/edit.jsp?id=${customer.getId()}" type="button" class="btn btn-success">Edit</a></td>
            <td><a href="/deleteCustomer?id=${customer.getId()}" type="button" class="btn btn-danger">Delete</a></td>
        </tr>
        </c:forEach>
    </table>

</div>
</body>
</html>

