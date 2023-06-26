<%--
  Created by IntelliJ IDEA.
  User: trung
  Date: 6/26/2023
  Time: 11:14 AM
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
    <h2>Thêm sản phẩm</h2>
    <form action="/addProduct" method="get">
        <div class="form-group">
            <label >Name</label>
            <input type="text" class="form-control" placeholder="Enter name" name="name" required>
        </div>
        <div class="form-group">
            <label >Price</label>
            <input type="text" class="form-control" placeholder="Enter price" name="price" required>
        </div>
        <div class="form-group">
            <label >Link image</label>
            <input type="text" class="form-control" placeholder="Enter img link" name="img" required>
        </div>
        <div class="form-group">
            <label >Producing Country</label>
            <input type="text" class="form-control" placeholder="Enter producing country" name="producingCountry" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

</body>
</html>
