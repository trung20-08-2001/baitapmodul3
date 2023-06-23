<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<from action="/discountservlet" method="post">
    <p>Product Description:</p>
    <input type="text" name="description" placeholder="Description"> <br>
    <p>List Product:</p>
    <input type="text" name="price" value="0" placeholder="Price"> <br>
    <p>Discount Percent(%):</p>
    <input type="text" name="percent" value="0.3" placeholder="Percent"> <br><br>
    <input type="submit"  value=" Calculate Discount">
</from>
</body>
</html>