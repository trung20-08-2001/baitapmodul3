<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <form action="/calculator">
        <div class="form-group">
            <label >Fist number</label>
            <input type="text" class="form-control"  placeholder="Enter fist number" name="fistNumber">
        </div>
        <div class="form-group">
            <label> Operator</label>
            <select class="form-control" name="operator">
                <option value="+">Addition (+)</option>
                <option value="-">Subtraction (-)</option>
                <option value="*">Multiplication (*)</option>
                <option value="/">Division (/)</option>
            </select>
        </div>
        <div class="form-group">
            <label >Second number</label>
            <input type="text" class="form-control" placeholder="Enter second number" name="secondNumber" >
        </div>
        <button type="submit" class="btn btn-primary">Calculator</button>
    </form>
    <div class="form-group">
        <label >Result</label>
        <input type="text" class="form-control" placeholder="Result" value="${result}">
    </div>
</div>

</body>
</html>