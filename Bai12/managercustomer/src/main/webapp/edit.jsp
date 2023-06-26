<%--
  Created by IntelliJ IDEA.
  User: trung
  Date: 6/23/2023
  Time: 9:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<body>

<div class="container">
    <h1 class="text-center text-primary">Sửa thông tin khách hàng</h1>
     <form action="/updateCustomer" method="post" class="was-validated">
         <div class="form-group d-none">
             <label >Id:</label>
             <input type="text" class="form-control"  placeholder="Enter id" name="id" value="${param.id}" required>
             <div class="valid-feedback">Valid.</div>
             <div class="invalid-feedback">Please fill out this field.</div>
         </div>
        <div class="form-group">
            <label >Name:</label>
            <input type="text" class="form-control"  placeholder="Enter name" name="name" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label >Age:</label>
            <input type="text" class="form-control" placeholder="Enter age" name="age" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
         <div class="form-group">
             <label >Image:</label>
             <input type="text" class="form-control" placeholder="Enter image link" name="img" required>
             <div class="valid-feedback">Valid.</div>
             <div class="invalid-feedback">Please fill out this field.</div>
         </div>
        <button type="submit" class="btn btn-primary">Complete</button>
    </form>
</div>

</body>
</html>
