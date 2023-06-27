<%--
  Created by IntelliJ IDEA.
  User: trung
  Date: 6/26/2023
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h2>Information Account</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Gender</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Password</th>
        </tr>
        <tr>
            <td>${account.getFistName()}</td>
            <td>${account.getLastName()}</td>
            <td>${account.getGender()}</td>
            <td>${account.getPhone()}</td>
            <td>${account.getEmail()}</td>
            <td>${account.getPassword()}</td>
        </tr>
    </table>
</div>
</body>
</html>

