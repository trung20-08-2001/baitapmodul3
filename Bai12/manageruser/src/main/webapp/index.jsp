<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>
<div class="container">
    <h2 class="text-center text-primary">Danh sách người dùng</h2>
    <a href="/addusers.jsp" type="button" class="btn btn-primary">Thêm người dùng</a>
    <a href="/sortByName" type="button" class="btn btn-primary">Sắp xếp theo tên</a>
    <form action="/findByCountry">
        <h6>Tìm người dùng theo country</h6>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Enter name" name="country" required>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${listAccount}" var="account">
        <tr>
            <td>${account.getId()}</td>
            <td>${account.getName()}</td>
            <td>${account.getEmail()}</td>
            <td>${account.getCountry()}</td>
            <td><a href="/editusers.jsp?id=${account.getId()}" type="button" class="btn btn-success">Edit</a></td>
            <td><a href="/deleteUsers?id=${account.getId()}" type="button" class="btn btn-danger">Delete</a></td>
        </tr>
        </c:forEach>
    </table>

</div>

</html>