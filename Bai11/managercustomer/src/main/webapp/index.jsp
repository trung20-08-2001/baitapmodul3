<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        img{
            width: 100px;
            height:100px
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">Danh sách khách hàng</h2>
    <a href="/addcustomer.jsp" type="button" class="btn btn-primary">Thêm khách hàng</a>
    <table class="table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Image</th>
            <th>Customer Detail</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <c:forEach items="${listCustomer}" var="customer">
            <tr>
                <th>${customer.getName()}</th>
                <th><img src="${customer.getImg()}" alt="Load..."></th>
                <th><a href="/displayDetailCustomer?id=${customer.getId()}" type="button" class="btn btn-primary">Customer Detail</a></th>
                <th><a href="/editcustomer.jsp?id=${customer.getId()}" type="button" class="btn btn-success">Edit</a></th>
                <th><a href="/deleteCustomer?id=${customer.getId()}" type="button" class="btn btn-danger">Delete</a>
                </th>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
