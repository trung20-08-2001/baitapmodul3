<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <h2 class="text-center text-primary">Danh sách sản phẩm</h2>
    <a href="/addproduct.jsp" type="button" class="btn btn-primary">Thêm sản phẩm</a>
    <form action="/findProductByName">
        <h6>Tìm sản phẩm theo tên</h6>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Enter name" name="name" required>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Img</th>
            <th>Edit</th>
            <th>Delete</th>
            <th>Detail</th>
        </tr>
        <c:forEach items="${listProduct}" var="product">
        <tr>
            <td>${product.getName()}</td>
            <td><img src="${product.getImg()}" alt="Load..." width="100px" height="100px"></td>
            <td><a href="/editproduct.jsp?id=${product.getId()}" type="button" class="btn btn-success">Edit</a></td>
            <td><a href="/deleteProduct?id=${product.getId()}" type="button" class="btn btn-danger">Delete</a></td>
            <td><a href="/displayDetailProduct?id=${product.getId()}" type="button" class="btn btn-primary">Detail</a>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
